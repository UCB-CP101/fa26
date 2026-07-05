---
layout: page
title: Reproducibility
parent: Getting Started
nav_order: 3
permalink: /docs/getting_started/reproducible/
---

## What reproducibility means

{: .note }
> A reproducible notebook can be opened in a fresh runtime, run from top to bottom, fetch its own inputs, save its outputs, and explain what data, code, and software versions produced the result.

That is the standard for this course. It rules out two common but non-reproducible patterns: loading files from a local path like `/Users/yourname/Downloads/`, and mounting your personal Google Drive.

{: .warning }
> **Avoid this pattern.** It works on one person’s account and fails for everyone else. The path and Drive permissions are not part of the notebook.

```python
from google.colab import drive
drive.mount("/content/drive")
df = pd.read_csv("/content/drive/MyDrive/my_project/data/file.csv")
```

Use this rule instead:

{: .note }
> The notebook should fetch the data, not assume the data is already sitting somewhere private.

Reproducibility is not just “a link exists.” It is also “the file I got is the file I expected, and the notebook can verify that.”

---

## Project structure

Start every notebook with a setup cell that creates a predictable local folder structure. This gives the notebook a home for data, outputs, and metadata without relying on any external path.

Setup cell — run this first:

```python
from pathlib import Path

DATA_DIR     = Path("data")
OUTPUT_DIR   = Path("outputs")
METADATA_DIR = Path("metadata")

for folder in [DATA_DIR, OUTPUT_DIR, METADATA_DIR]:
    folder.mkdir(parents=True, exist_ok=True)
```

The corresponding repository layout keeps the folders tracked in version control while keeping data files out:

```text
your-project/
├── data/
│   ├── raw/
│   └── processed/
├── visualizations/          # .png and/or .html
├── notebooks/  or  scripts/
├── src/                     # Track B only
├── requirements.txt
└── report.pdf
```

`data/raw/` is read-only — original files go there and are never modified. All transformations write to `data/processed/`. Add `data/` to `.gitignore` and keep a `.gitkeep` inside each subfolder so the empty folders stay tracked in Git.

---

## Data size guide

| Size | Recommended location | Avoid |
| --- | --- | --- |
| Under 10 MB | Fine to include directly in the GitHub repository | (none) |
| 10–100 MB | [Zenodo](https://zenodo.org), [OSF](https://osf.io), [Figshare](https://figshare.com), or the data’s original stable public URL | Committing to Git |
| 100 MB–2 GB | [Zenodo](https://zenodo.org), [OSF](https://osf.io), [Figshare](https://figshare.com), [Hugging Face Datasets](https://huggingface.co/datasets), or an institutional repository | Committing to Git |
| Over 2 GB | Data repository or cloud storage; compress files and provide a smaller sample if the full dataset is not required | Uncompressed files with no documentation of contents |

GitHub warns at 50 MiB and blocks files at 100 MiB. For anything over 10 MB, use a proper data repository ([Zenodo](https://zenodo.org), [OSF](https://osf.io), or [Figshare](https://figshare.com)) so your data has a stable URL, is separate from your code history, and will still be accessible if the repository moves.

> GitHub remembers the analysis. A data repository preserves the data. The notebook connects the two.

---

## Data acquisition

Choose the pattern that matches your data source. In every case the notebook records the acquisition step explicitly, rather than assuming the file is already present.

### Public URL

Use `requests` for all file downloads. `urllib.request.urlretrieve` is deprecated and will be removed in a future Python version.

Download a file from a public URL:

```python
from pathlib import Path
import requests

DATA_DIR = Path("data")
DATA_DIR.mkdir(parents=True, exist_ok=True)

url         = "https://example.org/dataset.zip"
output_path = DATA_DIR / "dataset.zip"

if not output_path.exists():
    response = requests.get(url, stream=True)
    response.raise_for_status()

    with output_path.open("wb") as file:
        for chunk in response.iter_content(chunk_size=1024 * 1024):
            file.write(chunk)

    print(f"Downloaded: {output_path}")
else:
    print(f"Already exists: {output_path}")
```

`stream=True` prevents `requests` from loading the entire file into memory before writing begins. `raise_for_status()` converts HTTP error codes (404, 403, 500) into Python exceptions immediately, rather than silently writing an error page to disk as though it were your data file.

### Raw GitHub file

For small files tracked in a public repository you can read directly into pandas. For a teaching notebook, downloading first is often clearer because you can see the `data/` folder being populated.

Read directly from a raw GitHub URL:

```python
import pandas as pd

url = "https://raw.githubusercontent.com/mwaskom/seaborn-data/master/iris.csv"

df = pd.read_csv(url)
```

### Public API

Urban data is often available through Socrata or similar open data portals. The query parameters become part of the documented method: a reader can see exactly which records were requested, not just that *some* data was downloaded.

Query a public data API:

```python
from urllib.parse import urlencode
import pandas as pd

base_url = "https://data.cityofnewyork.us/resource/erm2-nwe9.json"

params = {
    "$limit": 500,
    "agency": "DOT",
}

query_url = base_url + "?" + urlencode(params)

df = pd.read_json(query_url)
```

### Shared Google Drive file

If your dataset lives in a shared Google Drive folder, use `gdown` to download it by file ID. This is preferable to mounting Drive because the notebook records the acquisition step rather than hiding it inside a private path.

Install gdown (run once per Colab session):

```bash
pip install --quiet gdown
```

Download the file using subprocess:

```python
import subprocess
from pathlib import Path

DATA_DIR = Path("data")
DATA_DIR.mkdir(parents=True, exist_ok=True)

subprocess.run(
    [
        "gdown",
        "https://drive.google.com/uc?id=FILE_ID_HERE",
        "-O",
        str(DATA_DIR / "my_file.csv"),
    ],
    check=True,
)
```

Then read normally:

```python
import pandas as pd

df = pd.read_csv(DATA_DIR / "my_file.csv")
```

Using `subprocess.run(..., check=True)` instead of the `!gdown` shell shortcut means a download failure raises a proper Python exception with a traceback, rather than producing a shell error that is easy to miss.

---

## Checksums

A checksum verifies that the file you downloaded is the file you expected. URLs can silently point to updated or corrupted files. A checksum turns “it downloaded” into a concrete, testable claim.

Compute a SHA-256 checksum:

```python
import hashlib
from pathlib import Path

def compute_sha256(path: Path) -> str:
    """Return the SHA-256 checksum for a file."""
    with path.open("rb") as file:
        return hashlib.file_digest(file, "sha256").hexdigest()
```

Verify the checksum:

```python
data_file         = DATA_DIR / "dataset.zip"
expected_checksum = "PASTE_EXPECTED_SHA256_HERE"
actual_checksum   = compute_sha256(data_file)

print("File size:", data_file.stat().st_size, "bytes")
print("SHA-256:  ", actual_checksum)

if actual_checksum != expected_checksum:
    raise ValueError(
        f"Checksum mismatch.\n"
        f"  Expected: {expected_checksum}\n"
        f"  Got:      {actual_checksum}"
    )
```

{: .warning }
> **Do not use `assert` for verification.** Python’s `-O` optimization flag silently strips every `assert` statement at runtime. A checksum check written as `assert actual == expected` can disappear without warning. Raise a `ValueError` instead; it cannot be compiled away.

To get the expected checksum: download the file once, run `compute_sha256`, and paste the result into your notebook as a string constant. Anyone who later runs the notebook gets the same verification automatically.

`hashlib.file_digest` requires Python 3.11 or later. Colab currently runs 3.11+, so this is safe for course use.

---

## Data repositories

For datasets too large to commit to GitHub, upload to a stable public repository and write a notebook cell that downloads from it. The cell is the record; the repository is the archive.

### [Zenodo](https://zenodo.org)

The best general recommendation for academic teaching and research. Zenodo issues a DOI, supports versioning through records, and allows up to 50 GB per record by default. Files are downloadable from stable direct URLs.

Download from Zenodo:

```python
from pathlib import Path
import requests

DATA_DIR = Path("data")
DATA_DIR.mkdir(parents=True, exist_ok=True)

url         = "https://zenodo.org/records/RECORD_ID/files/FILENAME.zip?download=1"
output_path = DATA_DIR / "FILENAME.zip"

response = requests.get(url, stream=True)
response.raise_for_status()

with output_path.open("wb") as file:
    for chunk in response.iter_content(chunk_size=1024 * 1024):
        file.write(chunk)
```

### [OSF](https://osf.io)

Good for course projects and collaborative research, especially when you want a project page that combines data, documentation, and notes in one place. Public OSF projects allow up to 50 GB of storage.

### [Figshare](https://figshare.com)

Good for citable research outputs and large individual files. Individual accounts include 20 GB of private storage with uploads up to 20 GB per file. Institutional options extend this further.

### [Hugging Face Datasets](https://huggingface.co/datasets)

Well suited for image and text datasets. The `datasets` library supports streaming, which lets a notebook work through a large dataset without downloading it entirely first, which is useful when only a sample is needed.

---

## Data provenance

A beginner notebook does not need a full data management system. A JSON file written by the notebook is enough to record where data came from and how it was retrieved.

Write a provenance record:

```python
import json
from pathlib import Path

METADATA_DIR = Path("metadata")
METADATA_DIR.mkdir(parents=True, exist_ok=True)

provenance = {
    "dataset_name":     "311 Service Requests",
    "source_url":       query_url,
    "local_file":       str(data_file),
    "retrieval_method": "requests.get",
    "notes":            "Query limited to 500 DOT records. Downloaded by the notebook.",
}

with (METADATA_DIR / "data_provenance.json").open("w", encoding="utf-8") as file:
    json.dump(provenance, file, indent=2)
```

Writing provenance as a file rather than a comment means it is queryable, shows up in diffs, and is clearly separated from the analysis code.

---

## Environment recording

Recording the environment means answering one question:

> What Python world did this notebook run in?

This course asks you to include a `requirements.txt` in your repository. Here is why: a `requirements.txt` is a machine-readable list of every package and its exact version that was installed when the notebook ran. Someone who has never seen your project can take that file and recreate your environment exactly, with the same versions and behavior, using one command. Without it, there is no record of what was installed.

In Colab, generate it with `pip freeze`:

Freeze the environment into requirements.txt:

```python
import subprocess

with open("requirements.txt", "w") as req_file:
    subprocess.run(
        ["pip", "freeze"],
        stdout=req_file,
        check=True,
    )

print("requirements.txt written.")
```

Inspect the file:

```python
from pathlib import Path

print(Path("requirements.txt").read_text())
```

Anyone can then recreate your environment with:

```bash
pip install -r requirements.txt
```

In addition to `requirements.txt`, record a short human-readable summary so the Python version and platform are visible without opening the file:

Record Python version and platform:

```python
import json
import platform
import sys
from pathlib import Path

METADATA_DIR = Path("metadata")
METADATA_DIR.mkdir(parents=True, exist_ok=True)

environment = {
    "python":   sys.version,
    "platform": platform.platform(),
}

with (METADATA_DIR / "environment.json").open("w", encoding="utf-8") as file:
    json.dump(environment, file, indent=2)

environment
```

---

## The restart test

Notebooks allow cells to be run in any order. This means a notebook can appear to work while containing hidden dependencies on a particular execution history. The only reliable test is:

> Can the notebook run from a fresh runtime, top to bottom, with no manual steps in between?

In Colab:

```text
Runtime → Restart session and run all
```

Do not submit until this passes. If it fails after a restart but seemed to work before, you have a hidden execution-order dependency: find the cell that assumed something was already in memory and fix it.

---

## Notebook checks

Add a verification cell after the data download. This catches missing files and empty dataframes before the analysis reaches a confusing error ten cells later.

Verify required files and dataframe shape:

```python
from pathlib import Path

required_files = [
    DATA_DIR / "dataset.zip",
    METADATA_DIR / "data_provenance.json",
    METADATA_DIR / "environment.json",
]

missing_files = [path for path in required_files if not path.exists()]

if missing_files:
    raise ValueError(f"Missing required files: {missing_files}")

if df.shape[0] == 0:
    raise ValueError("The dataframe has no rows.")

print("All checks passed.")
```

{: .warning }
> **Do not use `assert` here either.** The same reasoning applies as for checksums: `assert` can be silently disabled at runtime. Use `raise ValueError` for any check that should halt execution when it fails.

---

## Notebook narrative

A reproducible notebook should be readable as a report, not just executable as a script. The [Ten Simple Rules for Writing and Sharing Computational Analyses in Jupyter Notebooks](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1007007) makes this point directly: notebooks should tell a story for an audience, not merely store code cells. Structure your markdown sections accordingly:

1. Research question or objective
2. Data source and why it was chosen
3. Data acquisition
4. Cleaning and preparation
5. Analysis
6. Visualization
7. Outputs and findings
8. Limitations and caveats

Each code cell should be preceded by a markdown cell that explains what the code does and why. A reader who cannot run the notebook should still be able to follow the argument.

Save at least one explicit output file so the result exists independently of the notebook runtime:

Save a derived output:

```python
OUTPUT_DIR = Path("outputs")
OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

summary_file = OUTPUT_DIR / "summary.csv"

summary.to_csv(summary_file, index=False)
```

---

## GitHub as project memory

Use GitHub as a record of what changed, when it changed, and why. For this project, the main practices are:

- One repository per project.
- A README that explains how to run the notebook.
- Commits at meaningful milestones, not after every cell edit.
- No private data, credentials, or API keys.
- No large files committed directly.
- Use GitHub to host the notebook so it can be opened in Colab from a stable URL.

A Colab notebook can be loaded from a GitHub URL via **File → Open notebook → GitHub**. This makes GitHub a natural place to version and share notebooks without requiring anyone to clone a repository.

---

## What comes next

The following tools are worth knowing but are not part of this course. They become relevant when working on larger projects with multiple collaborators, automated testing, or complex software dependencies.

| Stage | Focus |
| --- | --- |
| Now | Notebook fetches data, records provenance, saves outputs, freezes the environment with `pip freeze` into `requirements.txt`, runs top-to-bottom after a fresh restart. |
| Intermediate | Functions extracted to `.py` modules, `pytest` for unit tests, `venv` for isolated local environments, `uv` for faster package management outside Colab. |
| Advanced | `nox` or `tox` for automated testing across environments, GitHub Actions for CI, package-style project structure, Docker for full environment capture. |

Introducing Docker or GitHub Actions before you understand why environments differ turns reproducibility into ceremony. The right sequence is: first understand that the environment matters, then learn tools that capture it precisely.

---

## Checklist

Before submitting, verify every item.

- My notebook contains no path starting with `/Users/`, `C:\`, or `/content/drive/MyDrive/`.
- My notebook creates `data/`, `outputs/`, and `metadata/` in the setup cell.
- My notebook downloads data from a public URL, shared-file URL, raw GitHub URL, or API, not from a local file.
- The download uses `requests.get` with `stream=True` and `raise_for_status()`.
- My notebook writes a `data_provenance.json` recording the source URL and retrieval method.
- My repository includes a `requirements.txt` generated by `pip freeze`, and my notebook writes an `environment.json` recording the Python version and platform.
- My notebook saves at least one output file to `outputs/`.
- Verification checks use `raise ValueError`, not `assert`.
- My notebook has markdown cells explaining the workflow, data source, and findings.
- My notebook passes **Runtime → Restart session and run all** with no errors.
- My GitHub repository has a README that explains how to open and run the notebook.

---

## README template

Every repository should include a README that tells a new reader how to run the notebook and where the data came from.

README.md template:

```markdown
# Project title
short description of the goals of the project and what it delivers.

## How to run

1. Open `analysis.ipynb` in Google Colab.
2. Select Runtime → Restart session and run all.
3. The notebook creates local `data/`, `outputs/`, and `metadata/` folders.
4. The notebook downloads the required data automatically.

## Data

- **Dataset name:** [name]
- **Source:** [public source name]
- **Download URL:** [stable URL]
- **Date accessed:** [YYYY-MM-DD]
- **License:** [license or terms of use, if known]
- **File size:** [size]
- **Notes:** [any important limitations or version notes]

The data are not stored in this repository. The notebook downloads
them from the source above at runtime.

## Reproducibility

The notebook should run successfully after a clean restart:

    Runtime → Restart session and run all

If it fails, check that the data URL is still live and that the
checksum in the download cell matches the file at that URL.
```

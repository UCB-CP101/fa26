---
layout: page
title: Python Functions Lab
parent: Sandbox
grand_parent: Python Resources
nav_order: 2
permalink: /docs/tutorials/sandbox/functions_lab/
---

## Python Functions Lab

Functions are one of the most powerful tools in Python. They let you write a piece of logic once and reuse it across different inputs, eliminating the need to copy and paste the same code block every time your data changes. This is the foundation of automation in data work.

It also turns out you have been using functions all along. The libraries at the center of this course, i.e., `pandas`, `geopandas`, `shapely`, are fundamentally just large, carefully organized collections of pre-written functions and classes. Their closest cousins are **methods**: the commands you attach directly to your data using dot notation, like `df.head()` or `gdf.plot()`. Same idea, slightly different form.

This lab builds your mental model from the ground up: what a function is made of, how Python executes it, and how to write one correctly.

**What you will practice:**

- Reading a function signature and identifying its parts (name, parameters, type hints, return type)
- Assembling function bodies in the correct order with correct indentation
- Completing partially-written functions by filling in missing pieces
- Naming each structural element of a function using precise vocabulary
- Calling a function with your own inputs and seeing the real output

The lab has **seven activities** across four modes — *Assemble*, *Fill the Gaps*, *Matching*, and a *Try It* REPL at the bottom of every coding exercise that runs your assembled function directly in the browser. No install required.

---

Open the lab in a new tab:

<a href="{{ site.baseurl }}/docs/tutorials/Sandbox/python_functions_lab.html" rel="noopener noreferrer" style="display:inline-flex;align-items:center;gap:8px;padding:10px 16px;border-radius:8px;border:1px solid #2d2d3a;background:#1f1f2a;color:#f5f7ff;text-decoration:none;font-weight:600;font-size:14px;" target="_blank"> <svg aria-hidden="true" fill="none" height="15" viewbox="0 0 15 15" width="15" xmlns="http://www.w3.org/2000/svg"> <path clip-rule="evenodd" d="M3 2C2.44772 2 2 2.44772 2 3V12C2 12.5523 2.44772 13 3 13H12C12.5523 13 13 12.5523 13 12V8.5C13 8.22386 12.7761 8 12.5 8C12.2239 8 12 8.22386 12 8.5V12H3V3H6.5C6.77614 3 7 2.77614 7 2.5C7 2.22386 6.77614 2 6.5 2H3ZM12.8536 2.14645C12.9015 2.19439 12.9377 2.25031 12.9621 2.31041C12.9861 2.37011 12.9996 2.43482 13 2.50022L13 2.5V2.50002V5.5C13 5.77614 12.7761 6 12.5 6C12.2239 6 12 5.77614 12 5.5V3.70711L6.85355 8.85355C6.65829 9.04882 6.34171 9.04882 6.14645 8.85355C5.95118 8.65829 5.95118 8.34171 6.14645 8.14645L11.2929 3H9.5C9.22386 3 9 2.77614 9 2.5C9 2.22386 9.22386 2 9.5 2H12.4999H12.5C12.5678 2 12.6324 2.01349 12.6914 2.03794C12.7504 2.06234 12.805 2.09851 12.8518 2.14617L12.8536 2.14645Z" fill="currentColor" fill-rule="evenodd"></path> </svg> Open Python Functions Lab </a>

**Activities at a glance:**

| # | Mode | Function | What you practice |
| --- | --- | --- | --- |
| 1 | Assemble | `greet(name: str)` | Order and indent a 3-line function |
| 2 | Matching | `greet()` | Name every structural part of a function |
| 3 | Assemble | `clean_column_names(df)` | Chain `.str` accessor methods to vectorize column name cleaning |
| 4 | Assemble | `celsius_to_f(c: float)` | Arithmetic expression, single return |
| 5 | Fill the Gaps | `absolute_value(n: float)` | Conditional with early return |
| 6 | Fill the Gaps | `classify_grade(score: int)` | if / elif / else chain; type hints in signatures |
| 7 | Matching | `classify_grade()` | Name conditional structure: branch, elif, comparison operator |

---

Preview:

<div style="position:relative;border:1px solid #d0d7de;border-radius:12px;overflow:hidden;box-shadow:0 4px 24px rgba(0,0,0,.08);">
<iframe aria-hidden="true" loading="lazy" src="{{ site.baseurl }}/docs/tutorials/Sandbox/python_functions_lab.html" style="width:100%;height:600px;border:0;pointer-events:none;" tabindex="-1" title="Python Functions Lab Preview"></iframe>
<div style="position:absolute;inset:auto 0 0 0;padding:14px 16px;background:linear-gradient(to top,rgba(9,10,18,.90) 60%,rgba(9,10,18,0));color:#f8f9ff;font-size:13px;display:flex;align-items:center;justify-content:space-between;">
<span>Preview only — interactions are disabled.</span>
<a href="{{ site.baseurl }}/docs/tutorials/Sandbox/python_functions_lab.html" rel="noopener noreferrer" style="color:#e8a042;text-decoration:none;font-weight:600;font-size:13px;" target="_blank">Open full lab →</a>
</div>
</div>

<p style="margin-top:12px;color:#6b7280;font-size:13px;">© 2026 Maryam Hosseini</p>

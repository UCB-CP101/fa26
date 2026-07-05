---
layout: page
title: Final Project Success Tips
parent: Final Project
nav_order: 3
permalink: /docs/final_project/success/
---

# Final Project Success Tips

You have put a lot of work into this project. This guide covers the areas that most often hold strong work back. Go through it carefully before you submit.
You can then use the simple checklist below to track your progress.

<a href="{{ site.baseurl }}/docs/deliverables/final_project/final-project-guide.html" rel="noopener noreferrer" style="display:inline-block;padding:10px 14px;border-radius:8px;border:1px solid #2d2d3a;background:#6E635DFF;color:#f5f7ff;text-decoration:none;font-weight:600;" target="_blank">
    Open Submission Checklist (New Tab)
  </a>

---

## 1. Interpret Your Results, Don’t Just Report Them

Reporting a number or a pattern is not the same as interpreting it. For every finding in your project, you should address three things explicitly:

- **Meaning.** What does this result actually tell you in the context of your research question? Why does it matter?
- **Caveats.** Are there ways this result could be misleading? What does your analysis not account for?

There is a clear difference between description and interpretation. Description states what the data shows: “The median commute time in District 7 is 42 minutes.”
Interpretation explains what that means: why it matters, whether it is high or low relative to some reference point, and what it implies for the people or places your research question concerns.
Every finding in your report needs both.
A number without interpretation is not a result; it is an observation waiting to be analyzed.

{: .highlight }
> **What graders are looking for**
>
> - A plain-language explanation of each major finding, connected to your research question
> - An honest acknowledgment of what the analysis cannot tell you or is missing.
> - Plus: One follow-up question per major result that your analysis raises but does not answer

---

## 2. Justify Every Methodological Choice

Every decision in your analysis is a choice, not a default.
You should be able to explain why you made each one and acknowledge, at least briefly, what the alternative would have been and why you did not take it.

### Data cleaning

- Explain what rules you applied to remove or retain rows and why those rules are defensible given your data and research question.
- If you dropped rows with missing values — a practice called listwise deletion (removing any row that contains at least one missing field) — state why dropping was more appropriate than filling in an estimated value or keeping the row with a flag. This is addressed in detail in Section 3.

### Method and analytical choices

- If you summarized a distribution using a mean rather than a median, say why. For skewed data, these can differ substantially, and the choice affects what your result implies.
- If your project includes a regression or statistical model, briefly state the core assumptions the model requires and whether your data plausibly meets them. (If you are not running an inferential model, this does not apply.)
- Name at least one alternative approach for each major analytical decision and explain in one or two sentences why you did not use it.

### Aggregation level and spatial units

The choice of geographic unit is among the most consequential decisions in urban data analysis, and it must be addressed directly in your report.

{: .highlight }
> **Modifiable Areal Unit Problem (MAUP):** Results can change substantially depending on which spatial unit you aggregate to. A correlation that holds at the census tract level may disappear or reverse at the block group level, or strengthen at the ZIP code level. This is not an error in your analysis; it is an inherent property of spatial aggregation. You are **required** to acknowledge it.
>
> **Ecological fallacy:** A pattern observed at an aggregate level does not necessarily hold at the individual level. If your data show that tracts with higher median income also have higher park access, you cannot conclude that wealthier residents within those tracts are the ones benefiting from park access. Never draw individual-level conclusions from aggregate data without explicit qualification.
>
> **What your report must include:** State which spatial unit you used, explain why that unit was appropriate for your research question, and reflect on how your findings might change at a coarser or finer scale. For example: “We aggregated to the census tract level because our outcome variable (311 call rate) is only available at that resolution. At the block group level, small cell counts would produce unstable rates; at the ZIP code level, meaningful within-ZIP variation would be obscured.”

---

## 3. Take Missing Data Seriously

Missing data is not a footnote. How data goes missing affects what your results mean, and ignoring the question introduces bias you cannot quantify. A strong project will address all four of the following:

- **Quantify missingness.** Report how many rows or fields are affected and whether the pattern is concentrated in a particular subgroup, geography, or time period.
- **Identify the dark data type.** The course introduced five types of dark data, each with distinct causes and consequences for your analysis. For each variable or field with missing values, identify which type applies and explain your reasoning. Do not simply assert a type; show why the data is missing in that particular way given what you know about how the dataset was collected. Refer to your course notes and the assigned readings for the full definitions.
- **Assess the consequence.** Given the dark data type you identified, explain how the missingness could bias your results and in which direction. A dataset where lower-income neighborhoods have systematically fewer observations is not a neutral sample of the city.
- **Justify your handling.** State clearly what you did with missing values. The three most common approaches are: dropping the rows (listwise deletion), filling in an estimated value (imputation), or retaining the rows and flagging missingness as its own category. Whichever you chose, explain why it was the most defensible option given the dark data type you identified.

---

## 4. Make Every Visualization Earn Its Place

A figure that is hard to read or that does not directly support an analytical claim should not be in the report.
Before including any figure, ask yourself: what would the reader fail to understand without this? If you cannot answer that question clearly, cut the figure.

### Clarity and readability

- Label every axis, including units where applicable. Write “Median Household Income (2022 USD)”, not “income”. Write “Walk Score (0–100)”, not “score”.
- **Every figure must have a title and a caption.** The title names what the figure shows. The caption adds context: the data source, the geographic scope, the time period, and any transformations applied (e.g., log scale, normalization). A caption that merely repeats the title is not a caption.
- **Do not use default Matplotlib or pandas color palettes for categorical data.** These palettes are not designed for accessibility. Use a colorblind-safe palette: seaborn’s colorblind palette (`sns.set_palette('colorblind')`) or a ColorBrewer palette (available via `palettable` or directly at [colorbrewer2.org](https://colorbrewer2.org)) are reliable options.
- **Remove visual clutter.** Edward Tufte’s term for unnecessary graphical elements is “chartjunk.” Remove gridlines that serve no reference purpose, redundant axis tick marks, borders around plot areas, and legend entries for series that do not appear in the figure.

### Avoiding clutter

- As a rule of thumb, if a bar chart has more than about ten categories, consider whether a dot plot, a ranked horizontal bar chart, a small multiples layout, or a table would communicate the information more clearly.
- For choropleth maps, choose a classification scheme that reflects the distribution of your variable. Quantile, equal interval, and Jenks natural breaks (also called natural breaks) all produce different maps from the same data. State which scheme you used and why it is appropriate for your variable’s distribution.
- Avoid overplotting in scatter plots. If your dataset has more than roughly 500 points, use transparency (alpha), a hexbin plot, or a 2D density plot rather than raw scatter markers.

### Analytical purpose

- Every figure should correspond to a specific claim in your text. If you reference a figure, you must interpret it in the surrounding prose, not simply say “see Figure 3.”
- Do not include exploratory figures that you generated during analysis but that do not contribute to your final argument. The report is not a log of everything you tried.
- Code cells that produce figures should be clean and readable. A reader following your notebook should be able to understand what each figure is doing from the code alone, without needing to run cells out of order.

---

## 5. Make Your Project Fully Reproducible

A grader should be able to clone your repository, install your dependencies, and run your notebook from top to bottom with no errors and no manual steps. This is not a bonus expectation; it is a baseline requirement.

### Repository structure

This may seem like a minor detail, but it is not. How you organize a project repository is one of the first things a colleague, a supervisor, or a client will see when they open your work. A well-structured repository signals that you understand how collaborative technical work actually functions. A disorganized one signals the opposite, regardless of how good the analysis inside it is. Every professional data role you will encounter — in a city agency, a planning firm, a research lab, or a tech company — requires this. It is worth getting right now.

- Organize your files clearly. At minimum: a top-level README that explains what the project does and how to run it, a data folder, a notebooks or src folder, and a separate folder for output files.
- Include a `requirements.txt` or `environment.yml` that lists every library your notebook imports, with version numbers. If the grader cannot install your dependencies, they cannot run your notebook.
- **Do not commit raw data files larger than about 50 MB to GitHub** (GitHub will reject files over 100 MB entirely). For larger datasets, include a download script or a direct link to the source in your README.

### Notebook hygiene and readability

- **Before submitting, restart the kernel and run all cells from top to bottom in order.** A notebook whose cells were run in a different order during development may appear to work but will fail when run cleanly. Submit only a notebook that passes a clean top-to-bottom run.
- Remove dead code: commented-out blocks, scratch cells, and cells with error outputs should not appear in your final submission.
- Use descriptive variable names. A reader should be able to understand what a variable contains from its name alone, without tracing back through earlier cells. Names like `tract_median_income` or `walk_score_2022` are clear; names like `df2`, `temp`, or `x` are not.

---

## 6. Write and Present Professionally

The final project is a polished deliverable, not a lab notebook.
Apply the same standards you would to a report you were submitting to a client or a city agency.

### Precision and accuracy

- Proofread. Typographical and grammatical errors in a technical report undermine the reader’s confidence in the analysis, regardless of its quality.
- Write precisely. Avoid vague qualifiers like “very,” “a lot,” or “somewhat”; quantify instead: not “much higher” but “2.4 times higher” or “18 percentage points higher.” Always state your baseline. Higher than what?
- **Do not overclaim.** If your analysis shows a correlation, do not describe it as a causal relationship. If your sample covers one city or one year, do not generalize the findings to other cities or time periods without explicit qualification.
- Respect page limits. A report that exceeds the page limit will be penalized. Edit ruthlessly.

### Narrative coherence

- The report should read as a single unified argument, not a sequence of disconnected tasks. Each section should set up the next, and the logic connecting them should be explicit.
- Your introduction must state your research question clearly and explain why it matters. Your conclusion must return to that question and answer it directly, with appropriate qualifications, using the evidence your analysis produced.
- **Every empirical claim in the text must be supported by a figure, a table, or a cited source.** Methodological explanations and definitions do not require citations, but any claim about the world — about a place, a population, a trend, or a pattern — does.

---

## Quick Reference: Where Points Are Most Often Lost

| Area | Common Failure Mode |
| --- | --- |
| **Interpretation** | Reporting numbers or patterns without explaining what they mean for the research question |
| **Methodological reasoning** | Presenting analytical decisions as obvious defaults rather than justified choices with named alternatives |
| **Spatial unit / MAUP** | Not explaining why a particular geographic unit was chosen, or not acknowledging that results could differ at another scale |
| **Ecological fallacy** | Drawing conclusions about individuals from data aggregated to the neighborhood or tract level |
| **Missing data** | Dropping rows without identifying the dark data type or discussing how it could bias results |
| **Visualizations** | Unlabeled axes, angled labels, wrong type for the story, missing captions, cluttered or purposeless figures, or non-accessible color palettes, legends or annotations too small to read |
| **Map classification** | Not stating or justifying the classification scheme (Jenks, quantile, equal interval) used for choropleth maps |
| **Reproducibility** | Notebook fails when run from top to bottom; dependencies not listed; raw data missing from repository |
| **Overclaiming** | Describing a correlation as a cause, or generalizing findings beyond the data’s actual scope |
| **Writing** | Vague language, unsupported empirical claims, or exceeding the page limit |

<p style="margin-top:10px;color:#6b7280;font-size:13px;">© 2026 Maryam Hosseini</p>

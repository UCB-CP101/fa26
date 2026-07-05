---
layout: page
title: Pandas Data Exploration
parent: Basic Tutorials
grand_parent: Python Resources
nav_order: 5
permalink: /docs/tutorials/basic/pandas_data_explore/
---

## Pandas Data Exploration: Essential Sanity Checks

### 1. Initial Setup Checks

Before analyzing data, ensure that the dataset is properly loaded and structured.

- Check basic structure: Use `df.head()`, `df.tail()`, and `df.info()` to inspect the first and last few rows, data types, and overall shape.
- Check `df.sample()` to see a random sample.
- **Inspect Column Names (`.columns`)**
  - Check for **unwanted characters** such as `#`, `%`, `@`, etc.
  - Identify and **remove whitespaces** for easier column access.
  - Standardize **case formatting** (lowercase is generally easier to handle).
  - If necessary, rename columns systematically.
- Check index (`df.index`):
  - Ensure uniqueness (`df.index.is_unique`).
  - Identify index data type (string, numeric, timestamp) to check for consistency.
  - Reset the index if necessary (`df.reset_index(drop=True)`).
  - Set an appropriate column as an index if required (`df.set_index("column_name")`).

### 2. Data Quality Checks

Identify and fix common data issues to ensure accuracy.

- **Duplicates:** Count duplicate rows (`df.duplicated().sum()`) and remove if needed (`df.drop_duplicates()`).
- **Missing values:** Detect nulls (`df.isnull().sum()`) and assess impact.
- **Invalid values:** Look for impossible or inconsistent entries (e.g., negative prices, incorrect dates).
- **String formatting:** Standardize capitalization, trim whitespace.
- **Data types:** Ensure numbers are stored as numeric types (`df.dtypes`).

### 3. Data Distribution & Summary Statistics

Understand overall patterns and variations in the data.

- **Basic stats:** Use `df.describe()` for summary statistics like mean, median, min, and max. This is good to have some sense, we will see the pitfalls of relying on these later.
- **Histograms:** Visualize distributions (`df.hist()`). (Normal, Skewed?)

### 4. Outlier & Anomaly Detection

Find unusual values that could distort analysis:

- **Box plots:** Identify outliers visually (`sns.boxplot(x=df["column_name"])`).
- **IQR method:** Identify values outside `[Q1 - 1.5*IQR, Q3 + 1.5*IQR]` (`interquartile range(IQR) = Q3 - Q1`)
- **Domain checks:** Use subject knowledge to validate anomalies (e.g., a person’s height should not be 10 feet).

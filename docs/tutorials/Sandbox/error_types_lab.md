---
layout: page
title: Python Error Types
parent: Sandbox
grand_parent: Python Resources
nav_order: 3
permalink: /docs/tutorials/sandbox/error_types_lab/
---

## Python error types

Every error Python raises falls into one of three categories. Understanding which category you’re dealing with tells you immediately where to look and what to expect.

**Syntax errors** occur before your code runs at all. When you run a Python file, Python first scans the raw text and breaks it into tokens, the smallest meaningful units of the language: keywords, variable names, operators, parentheses. This is called **lexing** (the scanning stage in the diagram below). It then attempts to arrange those tokens into a tree that represents the structure of your program according to Python’s grammar rules, this is called **parsing** (the syntax check stage). A syntax error means Python failed at the parsing stage: the token sequence it found does not match any valid grammatical structure. Because the file cannot be fully parsed, Python refuses to execute any of it. Not a single line runs, even if the rest of the file is perfectly correct.

**Runtime errors** (also called exceptions) occur while your code is running. The syntax was valid, Python successfully parsed and compiled the file, but something went wrong during execution. Python stops immediately at the point of failure and prints a **traceback**: a record of every function call that led to the crash. The traceback is printed from outermost to innermost, so you read it **bottom to top**: the last two lines tell you the error type and exactly where it occurred, and the lines above show the chain of calls that got you there. The crash site is not always in your own code, it may be inside a library. In that case, scan upward through the traceback until you find the last line that references your file. That is where the bug is.

**Semantic errors** are the hardest category to detect. The code is syntactically valid and runs from start to finish without raising any exception, but it produces the wrong result. Python executed your instructions faithfully; the problem is that your instructions did not correctly express your intent. There is no error message, no traceback, no signal of any kind. The only way to catch a semantic error is to verify your output against what you expected.

Click any bar in the lab below to explore each error type interactively.

Open the lab in a new tab:

<a href="{{ site.baseurl }}/docs/tutorials/Sandbox/error_types_lab_app.html" rel="noopener noreferrer" style="display:inline-block;padding:10px 14px;border-radius:8px;border:1px solid #2d2d3a;background:#1f1f2a;color:#f5f7ff;text-decoration:none;font-weight:600;" target="_blank">
    Open Python Error Types Lab (New Tab)
  </a>

Preview:

<div style="position:relative;border:1px solid #d0d7de;border-radius:12px;overflow:hidden;">
<iframe aria-hidden="true" loading="lazy" src="{{ site.baseurl }}/docs/tutorials/Sandbox/error_types_lab_app.html?preview=1" style="width:100%;height:480px;border:0;pointer-events:none;" tabindex="-1" title="Python Error Types Lab Preview"></iframe>
<div style="position:absolute;inset:auto 0 0 0;padding:10px 12px;background:linear-gradient(to top,rgba(9,10,18,.86),rgba(9,10,18,0));color:#f8f9ff;font-size:14px;">
    Preview only. Open the full interactive lab in a new tab.
  </div>
</div>

<p style="margin-top:10px;color:#6b7280;font-size:13px;">© 2026 Maryam Hosseini</p>

---
layout: page
title: Strings
parent: Basic Tutorials
grand_parent: Python Resources
nav_order: 3
permalink: /docs/tutorials/basic/strings/
---

# Strings in Python

### Introduction to Strings

Textual data in Python is managed using `str` objects, also known as strings.

---

### String Creation

Strings can be created in several ways:

- **Single quotes:** `'allows embedded "double" quotes'`
- **Double quotes:** `"allows embedded 'single' quotes'`
  - **Use case for double quotes:** When the string contains single quotes, such as “don’t”:

    ```python
    my_string = "don't worry"
    print(my_string)  # Output: don't worry
    ```
  - **What happens without double quotes:**

    ```python
    my_string = 'don't'  # SyntaxError: invalid syntax
    ```

---

### Key Features of Strings

1. **Strings are immutable:** Once created, they cannot be changed.
2. **Indexing returns a string of length 1:**

   ```python
   my_string = "hello"
   print(my_string[0])  # Output: 'h'
   ```
3. **Strings support slicing and sequence operations:**
   - Example of slicing:

     ```python
     my_string = "hello"
     print(my_string[1:4])  # Output: 'ell'
     ```
   - Slicing options:
     - `my_string[start:end]`: Extract characters from `start` to `end` (not inclusive).
     - `my_string[:end]`: Extract from the start to `end`.
     - `my_string[start:]`: Extract from `start` to the end.
     - `my_string[:]`: Extract the entire string.
     - `my_string[start:stop:step]`: Extract characters from `start` to `end` (not inclusive), incrementing every `step`
     - `my_string[::2]`: Extract every second character from the entire string, starting from index 0.
   - Sequence operations:
     1. **Concatenation** (`+`):

        ```python
        print("hello" + " world")  # Output: 'hello world'
        ```
     2. **Repetition** (`*`):

        ```python
        print("ha" * 3)  # Output: 'hahaha'
        ```
     3. **Membership Testing** (`in`):

        ```python
        print("ell" in "hello")  # Output: True
        ```

---

### Essential String Methods

Strings implement common sequence operations and additional methods for text manipulation.

**1. `str.capitalize()`**: Capitalizes the first character and lowers others.

```python
   print("hello world".capitalize())  # Output: 'Hello world'
```

**2. `str.casefold()`**: Case-insensitive string comparison.

```python
   print("ß".casefold())  # Output: 'ss'
```

**3. `str.center(width, fillchar=' ')`**: Centers the string.

```python
   print("hello".center(10, "*"))  # Output: '**hello***'
```

**4. `str.count(sub)`**: Counts occurrences of a substring.

```python
   print("banana".count("a"))  # Output: 3
```

**5. `str.endswith(suffix)`**: Checks if the string ends with `suffix`.

```python
   print("hello.py".endswith(".py"))  # Output: True
```

**6. `str.expandtabs(tabsize)`**: Replaces tabs with spaces.

```python
   print("01\t012".expandtabs(4))  # Output: '01  012'
```

**7. `str.find(sub)`**: Returns the lowest index of `sub` or `-1`.

```python
   print("hello world".find("world"))  # Output: 6
```

**8. `str.join(iterable)`**: Joins elements of an iterable with a separator.

```python
   print(", ".join(["apple", "banana"]))  # Output: 'apple, banana'
```

**9. `str.split(sep)`**: Splits the string by `sep`. Here we are splitting by “,”

Note that split method will create a list of strings.

```python
   print("1,2,3".split(","))  # Output: ['1', '2', '3']
```

**10. `str.title()`**: Returns a title-cased string.
`python
print("hello world".title()) # Output: 'Hello World'`

**11. `str.zfill(width)`**: Pads the string with zeros.
`python
print("42".zfill(5)) # Output: '00042'`

**12. `str.replace(old, new, count)`**: Replaces occurrences of `old` with `new`.
`python
print("banana".replace("a", "o", 2)) # Output: 'bonona'`

---

### Case Conversion

- **`str.upper()`**: Converts all characters to uppercase.
- **`str.lower()`**: Converts all characters to lowercase.
- **`str.swapcase()`**: Swaps the case of all characters.
- **`str.istitle()`**: Checks if the string is title-cased.

---

### String Testing Methods

1. **`str.isalpha()`**: Checks if all characters are alphabetic.
2. **`str.isdigit()`**: Checks if all characters are digits.
3. **`str.isalnum()`**: Checks if all characters are alphanumeric.
4. **`str.isspace()`**: Checks if all characters are whitespace.

---

### Cleaning User Input

To ensure consistent and clean input:

1. Use `.strip()` to remove spaces.
2. Apply `.title()` for capitalization.

#### Example:

```python
name = input("What's your name? ").strip().title()
print(f"Hello, {name}")
```

---

### Online quiz : [Python Strings](ttps://www.w3schools.com/python/python_strings_exercises.asp)

---

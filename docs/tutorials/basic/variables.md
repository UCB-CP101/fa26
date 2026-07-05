---
layout: page
title: Variables
parent: Basic Tutorials
grand_parent: Python Resources
nav_order: 2
permalink: /docs/tutorials/basic/variables/
---

# Variables in Python

## **Definition**

A **variable** is a *name* that refers to a value.
It lets you reuse data without rewriting it.
Think of it as a label you can assign to an object.
You can assign multiple labels to an object, all of them are referencing the same thing.

### **Why Use Variables?**

Variables allow programmers to:

- **Reference and reuse values**: Avoid the need to retype values throughout the code.
- **Make code readable**: Meaningful labels like `name` or `age` clarify the purpose of the data being used.
- **Easily modify references**: Change which object a variable points to without affecting other parts of the program.

## 1) Creating a variable (assignment)

You can create a variable by writing a name, an equals sign `=`, and a value.
In other words, in Python, you assign a value to a variable using the **assignment operator** (`=`):

```python
name = "Sam"
age = 25
```

- **Name:** `name`, `age`
- **Value:** `"Sam"`, `25`
- **`=` means assignment**, not “mathematically equal.”

The value can also be an output of a function like `input()`.

```python
name = input("What's your name? ")
```

Here:

- `name` is the variable.
- `input("What's your name? ")` captures user input and assigns it to the variable `name`.

The **equal sign** (`=`) in `name = input(...)` does not mean equality.
It assigns the value on the right to the variable on the left by creating a reference or pointer to the data in memory.

### **Understanding Variables as References**

When you assign a value to a variable in Python, you’re creating a reference to an object stored in memory, not directly storing the value itself.

#### Example:

```python
num1 = 42  # 'num1' references the integer object 42
num2 = num1   # 'num2' now references the same integer object as 'x'

print(num1, num2)  # Outputs: 42 42

# Modify 'num1'
num1 = 100  # 'num1' now points to a different integer object
print(num1, num2)  # Outputs: 100 42
```

Here:

1. Initially, `num1` and `num2` both reference the same object (`42`).
2. When `num1` is reassigned, it now references a new object (`100`), leaving `num2` unchanged.

---

### **Types of Objects Referenced by Variables**

A variable can name **any Python value (object)**: a number, text, a Boolean value, or more complex things like collections of all those different types of values in structured as a list, or a dictionary (key, value), or table.

When we talk about **types**, we’re talking about the *kind of value* the variable currently refers to.

So: Python variables can reference different types of objects, and Python dynamically determines the object type at runtime.

Examples include:

- **Integer (`int`)**: Whole numbers.

  ```python
  age = 25
  ```
- **Floating-point (`float`)**: Numbers with decimals.

  ```python
  height = 5.9
  ```
- **String (`str`)**: Text data.

  ```python
  greeting = "Hello, World!"
  ```
- **Boolean (`bool`)**: Logical values (`True` or `False`).

  ```python
  is_active = True
  ```

---

### **Identity and Equality**

Python provides two operators to clarify the distinction between references and values:

- **`is`**: Checks if two variables reference the same object in memory.
- **`==`**: Checks if two variables have equal values (object content).

#### Example:

```python
original_list = [1, 2, 3]
referenced_original = original_list
independent_copy = [1, 2, 3]

print(original_list is referenced_original)  # True: Both reference the same object
print(original_list == independent_copy)       # True: Both have the same content
print(original_list is independent_copy)       # False: They reference different objects
```

## 3) Variable naming rules and conventions

### Rules (Python will error if you break these)

- Must start with a letter or underscore: `student_id`, `_temp`
- Can contain letters, digits, underscores: `user2`, `street_name`
- Cannot start with a digit: `1st_place` is invalid
- Cannot use reserved words: `if`, `for`, `class`, `import`, …

### Conventions (humans will thank you)

1. **Use meaningful names**:  
   Avoid generic names like `x`, `y`, or `data`. Instead, use descriptive names such as `user_age` or `total_score` to make the code self-explanatory.

   **Example**:

   ```python
   # Avoid
   x = 5

   # Better
   user_age = 5
   ```
2. **Stick to a naming convention**:
   - Use **snake\_case** (lowercase with underscore between parts): `my_favorite_color` (preferred in Python).
   - Reserve `UPPERCASE` for constants.
3. **Avoid reserved keywords**:  
   Python has a set of keywords that cannot be used as variable names (e.g., `def`, `class`, `if`, `int`, `float`, `str`).  
   You can check them by importing the `keyword` module:

   ```python
    import keyword
      
    print(keyword.kwlist)
   ```
4. **Avoid single-character variables**:  
   Use single-character names like `i`, `j`, or `k` sparingly, mainly in contexts like loops.

---

### **Dynamic Typing in Action**

Python variables are not bound to a fixed type, allowing reassignment of values of different types to the same variable:

```python
num = 10         # Integer
print(type(num)) # <class 'int'>

text = "Hello"    # Now a string
print(type(text)) # <class 'str'>
```

However, frequent type changes can make code harder to understand, so use this feature judiciously.

---

## **Advanced Tip: Multiple Assignments**

Python supports assigning multiple variables in a single line:

```python
x_coordinate, y_coordinate, z_coordinate = 1, 2, 3  # Assigns values to 3D coordinates
print(x_coordinate, y_coordinate, z_coordinate)     # Outputs: 1 2 3

# Assign the same value to multiple variables
initial_value = default_value = shared_value = 42  # Assigns the same value to all
print(initial_value, default_value, shared_value)  # Outputs: 42 42 42
```

---

### **Common Pitfalls to Avoid**

1. **Unintended mutation**:
   Be cautious when multiple variables reference the same mutable object. Use `.copy()` or `deepcopy()` to create independent copies if needed.

   ```python
   import copy
   lst1 = [1, 2, 3]
   lst2 = copy.deepcopy(lst1)
   lst1.append(4)
   print(lst1, lst2)  # Outputs: [1, 2, 3, 4] [1, 2, 3]
   ```
2. **Using `is` for equality checks**:
   Reserve `is` for identity checks (e.g., comparing with `None`), not value equality.

   ```python
   var1 = None
   if var1 is None:  # Preferred
       print("var1 is None")
   ```
3. **Immutable default arguments**:
   Use immutable objects (like `None`) for default arguments to avoid unexpected mutations.

   ```python
   def func(lst=None):
       if lst is None:
           lst = []
       lst.append(1)
       return lst
   ```

### Read and practice more: [Python variables](https://www.w3schools.com/python/python_variables.asp)

---

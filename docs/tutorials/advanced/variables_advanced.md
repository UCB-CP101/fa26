---
layout: page
title: Variables
parent: Advanced Tutorials
grand_parent: Python Resources
nav_order: 1
permalink: /docs/tutorials/advanced/variables/
---

# Variables in Python - Advanced Topics

## 1. Mutability: Mutable vs. Immutable Objects

### Core Concept

In Python, data types are either mutable (can be changed after creation) or immutable (cannot be changed).

- **Immutable Types**: `int`, `float`, `str`, `tuple`
- **Mutable Types**: `list`, `dict`, `set`

#### Example

```python
# Immutable Example
num = 10
print(id(num))  # Memory address of num
num = 20
print(id(num))  # New memory address

# Mutable Example
lst = [1, 2, 3]
print(id(lst))  # Memory address of lst
lst.append(4)
print(id(lst))  # Same memory address, content changed
```

- Immutable types are safer for concurrent programming.
- Mutable types are more flexible but require caution to avoid unintended changes.

---

## 2. Scoping Rules: LEGB (Local, Enclosing, Global, Built-in)

### Core Concept

Python uses the LEGB rule (Local, Enclosing, Global, Built-in) to determine the scope of a variable. Refer to the provided example and consider creating your own flowchart to visualize how Python resolves variable scope.

#### Definitions

1. **Local**: Defined inside a function.
2. **Enclosing**: Defined in the enclosing function for nested functions.
3. **Global**: Defined at the top level of a script/module.
4. **Built-in**: Predefined by Python (e.g., `print`, `len`).

#### Example

```python
def outer() -> None:
    mytext = 'enclosing'
    def inner():
        nonlocal mytext
        mytext = 'modified enclosing'
        print(mytext)  # Prints: modified enclosing
    inner()
    print(mytext)  # Prints: modified enclosing

mytext = 'global' #not a good practice at all, only for explaining the concept
outer()
print(mytext)  # Prints: global
```

Understanding scope prevents bugs caused by unintended variable shadowing or overwriting.

---

## 3. Dynamic Typing and Type Hints

### Core Concept

Python variables are dynamically typed, meaning a variable can change its type during runtime. This flexibility is one of Python’s core features but requires careful handling to avoid type-related errors.

### Example

```python
num = 10  # Integer
mytext = "Hello"  # String
lst = [1, 2, 3]  # List
```

### Type Hints

Type hints provide clarity and can help with debugging.

```python
def greet(name: str) -> str:
    return f"Hello, {name}!"
```

Dynamic typing offers flexibility, while type hints improve readability and debugging. Tools like `mypy` can catch type mismatches during development, enhancing code reliability. For example, in large collaborative projects, type hints help team members understand expected inputs and outputs of functions without additional documentation.

---

## 4. Custom Objects as Variables

### Core Concept

Variables in Python can reference objects of custom classes.

#### Example

```python
class Person:
    def __init__(self, name: str, age: int):
        self.name = name
        self.age = age

person = Person("Alice", 30)
print(person.name, person.age)
```

Custom objects enable encapsulation and reusability in your code. For instance, in a payroll system, defining an `Employee` class with attributes like `name` and `salary` streamlines operations compared to using separate variables for each employee.

---

## 5. Debugging Common Variable Errors

### Example Errors

1. **UnboundLocalError**: Referencing a local variable before assignment. This error occurs because Python treats variables assigned within a function as local, even if they share the same name as a global variable.

   ```python
   def foo():
       print(num)
       num = 10
   foo()
   ```
2. **TypeError**: Unsupported operations between types.

### Debugging Tips

- Use `print()` statements to check variable values.
- Use a debugger (e.g., `pdb` or an IDE).

---

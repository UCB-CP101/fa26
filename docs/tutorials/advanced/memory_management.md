---
layout: page
title: Python Memory Management
parent: Advanced Tutorials
grand_parent: Python Resources
nav_order: 4
permalink: /docs/tutorials/advanced/memory_management/
---

# Python Memory Management: Variable Updates and Garbage Collection

### **1. Variable Assignment and References**

When you assign a value to a variable in Python, the variable acts as a reference to an object stored in memory.

### Example:

```python
radius = 4  # `radius` references the integer object **4**
```

- Here, the integer **4** is an immutable object.
- The variable `radius` does not store the value **4** directly; it holds a reference (or pointer) to the memory location where **4** is stored.

---

### **2. Updating the Variable**

When you update the value of `radius` using an operation like `radius += 1`, the following occurs:

### Example:

```python
radius = 4        # `radius` references the object **4**
radius += 1       # `radius` now references a new object **5**
```

### Step-by-Step Explanation:

1. Initially, `radius` points to the memory location of the object **4**.
2. When `radius += 1` is executed, a new integer object **5** is created in memory.
3. The reference `radius` is updated to point to the new object **5**.
4. The old value (**4**) is no longer referenced by `radius`.

---

### **3. What Happens to the Old Value (**4**)?**

Once `radius` is updated to point to **5**, the reference count of the object **4** decreases.
If no other variable or object is referencing **4**, it becomes eligible for garbage collection.

### Example with Multiple References:

```python
radius = 4
another_variable = radius  # Both `radius` and `another_variable` reference **4**

radius += 1  # `radius` now references **5**, but `another_variable` still references **4**
```

- In this case, the integer **4** remains in memory because `another_variable` still references it.
- Only when all references to **4** are removed will it be eligible for garbage collection.

---

### **4. Garbage Collection in Python**

Python uses **reference counting** to manage memory:

1. Each object has a reference count.
2. When the reference count drops to zero, the object becomes eligible for garbage collection.
3. Python’s garbage collector runs periodically to reclaim memory from such unreferenced objects.

### Key Point:

Garbage collection does not happen immediately when an object becomes unreferenced. It occurs during the next garbage collection cycle.

---

### **5. Small Integer Caching**

In CPython (the most common Python implementation), integers between **-5** and **256** are **cached** and never garbage-collected.
These objects are reused to optimize memory usage and performance.

### Example:

```python
radius = 4
radius += 1

# The integer `4` is not removed from memory because it is part of the small integer cache.
```

This means that even if no variable references **4**, it will remain in memory because Python caches small integers for reuse.

---

### **6. Tracing the Process**

Here’s a simple trace to understand:

### Initial State:

```
radius = 4

Memory:
Object `4` -> Referenced by `radius`
```

### After `radius += 1`:

```
radius = 5

Memory:
Object `4` -> No references (eligible for garbage collection)
Object `5` -> Referenced by `radius`
```

### With Small Integer Caching:

```
radius = 4

Memory:
Object `4` -> Cached and reused by Python, not garbage-collected
```

---

### **7. Example**

```python
import sys

# Initial assignment
radius = 4
print(f"radius points to {radius}, id: {id(radius)}")

# Update the variable
radius += 1
print(f"radius now points to {radius}, id: {id(radius)}")

# Check reference count
import ctypes
ref_count = ctypes.c_long.from_address(id(4)).value
print(f"Reference count of 4: {ref_count}")
```

### Explanation of `ctypes` Usage:

- **`id(4)`**: Returns the memory address of the object **4**.
- **`ctypes.c_long.from_address(id(4))`**: Accesses the reference count stored at the memory address of **4**.
- **`value`**: Retrieves the reference count.

By checking the reference count, you can indirectly confirm if the object is still in memory. If the count is greater than zero, at least one variable or cached mechanism is still referencing it.

### Example with **257**:

To observe the behavior of non-cached integers, consider the following example:

```python
x = 257
print(f"x points to {x}, id: {id(x)}")
y = 257
print(f"y points to {y}, id: {id(y)}")

# Check if x and y point to the same object
print(f"x is y: {x is y}")  # False, as 257 is not cached

# Check reference count for 257
ref_count_257 = ctypes.c_long.from_address(id(257)).value
print(f"Reference count of 257: {ref_count_257}")
```

### Explanation:

- For integers outside the cached range (e.g., **257**), Python creates a new object each time they are assigned
  unless explicitly reused.
- `x is y` evaluates to `False` because `x` and `y` are two distinct objects.
- The reference count of **257** is specific to its instantiation during the program execution.

### Output:

- `x points to 257, id: <some id>`
- `y points to 257, id: <different id>`
- `x is y: False`
- `Reference count of 257: 1`

---

### **Key Takeaways**

1. Variables in Python are references to objects, not the objects themselves.
2. When a variable is updated, it points to a new object, and the old object may become eligible for garbage collection.
3. Python uses reference counting and garbage collection to manage memory efficiently.
4. Small integers (between **-5** and **256**) are cached and reused, so they are not garbage-collected.
5. Non-cached integers like **257** demonstrate the dynamic object creation behavior of Python.
6. You can use `ctypes` to inspect the reference count of an object, indirectly confirming if it is still in memory.

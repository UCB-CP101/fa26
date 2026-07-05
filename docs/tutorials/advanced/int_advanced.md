---
layout: page
title: int - Advanced Topics
parent: Advanced Tutorials
grand_parent: Python Resources
nav_order: 2
permalink: /docs/tutorials/advanced/int/
---

# Advanced Topics on Integer and Float

## Integer Methods

### 1- `int.bit_length()`

Returns the number of bits necessary to represent an integer in binary, excluding the sign and leading zeros.

#### Example:

```python
num = -37
print(bin(num))  # Output: '-0b100101'
print(num.bit_length())  # Output: 6
```

#### Details:

- For a nonzero integer `x`, `x.bit_length()` returns the unique positive integer `k` such that `2**(k-1) <= abs(x) < 2**k`.
- For zero, it returns `0`.

Equivalent to:

```python
def bit_length(num: int) -> int:
    num_strip = bin(num).lstrip('-0b')  # Remove leading zeros and minus sign
    return len(num_strip)
```

### 2- `int.bit_count()`

Returns the number of `1`s in the binary representation of the absolute value of the integer (also known as the population count).

#### Example:

```python
num = 19
print(bin(num))  # Output: '0b10011'
print(num.bit_count())  # Output: 3
```

Equivalent to:

```python
def bit_count(num: int) -> int:
    return bin(num).count("1")
```

### 3- `int.to_bytes(length, byteorder, *, signed=False)`

Converts an integer to an array of bytes.

#### Example:

```python
print((1024).to_bytes(2, byteorder='big'))  # Output: b'\x04\x00'
print((-1024).to_bytes(10, byteorder='big', signed=True))  # Output: b'\xff\xff\xff\xff\xff\xff\xff\xff\xfc\x00'
```

#### Parameters:

- `length`: Number of bytes.
- `byteorder`: `'big'` or `'little'`.
- `signed`: Whether to use two’s complement representation for negative numbers (default is `False`).

### 4- `int.from_bytes(bytes, byteorder, *, signed=False)`

Converts a bytes object to an integer.

#### Example:

```python
print(int.from_bytes(b'\x00\x10', byteorder='big'))  # Output: 16
print(int.from_bytes(b'\xfc\x00', byteorder='big', signed=True))  # Output: -1024
```

#### Parameters:

- `bytes`: Bytes-like object or iterable producing bytes.
- `byteorder`: `'big'` or `'little'`.
- `signed`: Whether to interpret the integer as signed.

### 5- `int.as_integer_ratio()`

Returns a tuple `(numerator, denominator)` such that the ratio equals the integer.

#### Example:

```python
print((5).as_integer_ratio())  # Output: (5, 1)
```

### 6- `int.is_integer()`

Returns `True` for integer instances.

#### Example:

```python
print((5).is_integer())  # Output: True
```

## Float Methods

### 1- `float.as_integer_ratio()`

Returns a tuple `(numerator, denominator)` whose ratio equals the float.

#### Example:

```python
print((3.5).as_integer_ratio())  # Output: (7, 2)
```

### 2- `float.is_integer()`

Returns `True` if the float has an integral value, `False` otherwise.

#### Example:

```python
print((-2.0).is_integer())  # Output: True
print((3.2).is_integer())  # Output: False
```

### 3- `float.hex()` and `float.fromhex(s)`

Converts a float to and from a hexadecimal string representation.

#### Example:

```python
print((3740.0).hex())  # Output: '0x1.d380000000000p+11'
print(float.fromhex('0x3.a7p10'))  # Output: 3740.0
```

### Reference:

[Python Documentation](https://docs.python.org/3/library/stdtypes.html#additional-methods-on-integer-types)

---

---

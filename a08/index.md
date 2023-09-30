<!-- omit in toc -->
# Table of Contents
- [Notes](#notes)
    - [Memory Model](#memory-model)
    - [Function Design](#function-design)
    - [Types](#types)
        - [Num/Str Operations](#numstr-operations)
        - [Tuple](#tuple)
- [Documentation](#documentation)
    - [String](#string)
    - [List](#list)
        - [Methods](#methods)

# Notes
## Memory Model
> always create new places in memory when assigning


<details><summary>variable assign</summary>

```python
a = 5
# a: id1    id1: 5
a = 3
# a: id2    id2: 3
b = a
# a: id2    id2: 3
# b: id2
```

```py
a = 5
# a: id1    id1: 5
b = a + 2
# a: id1    id1: 5
# b: id2    id2: 7
a = 10
# a: id3    id3: 10
# b: id2    id2: 7
```
</details>

<details>
    <summary>list</summary>

```py
l = [12, 23]
# l: id1    id2: 12
#           id3: 23
#           id1: { 0: id2, 1: id3 }
```

```py
l[1] = 34
# l: id1    id2: 12
#           id1: { 0: id2, 1: id4 }
#           id4: 34
```

```py
l += [56] # create new list
# l: id6    id2: 12
#           id4: 34
#           id7: 56
#           id6: { 0: id2, 1: id4 }
```

```py
a = l # copy reference aka alias
# l: id6    id2: 12
# a: id6    id4: 34
#           id7: 56
#           id6: { 0: id2, 1: id4 }
```

```py
b = l + [78] # copy by value
# l: id6    id2: 12
# b: id9    id4: 34
#           id7: 56
#           id8: { 0: id2, 1: id4 }
#           id9: { 0: id2, 1: id4, 2: id10 }
#           id10: 78
```
</details>


## Function Design
<details>
    <summary><strong>doctest</strong></summary>

```py
"""
>>> is_odd(2)
False
>>> is_odd(17)
True
"""
```
</details>

<details>
    <summary><strong>header</strong></summary>

```py
def is_odd(n: int) -> bool:
    """(doctest from step 1)"""
```
</details>

<details>
    <summary><strong>description</strong></summary>

- should mention all variables
```py
def is_odd(n:int)->bool:
    """
    Return True if n is odd.
    (doctest)
    """
```
</details>

<details>
    <summary><strong>body</strong></summary>


```py
def is_odd(n:int)->bool:
    """(docstring from step 3)"""
    return n % 2
```
</details>


## Types
### Num/Str Operations
```py
float('45.0') == 45.0
8 == 8.0
```

### Tuple
> list but immutable

# Documentation
## String
> string is *immutable*
- [`str.find(sub[, start[, end]])`](https://docs.python.org/3/library/stdtypes.html#str.find)
  - return the lowest index in the string where substring sub is found within the slice `s[start:end]`
  - *start* and *end*: in slice notation
  Return `-1` if sub is not found.
  - should only be used to get the position

## [List]((https://docs.python.org/3/tutorial/datastructures.html))
- slicing always return `list`
- `b = a` copies **reference**
- list passes **reference** to functions
- use `List[str]` or `list` as type hint in functions

### Methods
- `list.append(x)`
    - aka `vector::push_back(x)`
- `list.extend(iterable)`
    - aka `a += iterable`
- `list.insert(i, x)`
    - aka `a = a[:i] + [x] + a[i:]` (`x` become `i`-th element)
- `list.remove(x)`
    - remove first item of value `x` from the list, or `ValueError`
- `list.pop([i])`
    - remove the last or `i`-th item and return it
- `list.sort()`
    - sort self
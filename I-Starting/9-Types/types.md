# Derived Types
Derived types are personalized data structures that can group different data types in a single object. It is equivalent to (simplified) Python `class`

## Use
**Definition:**
```fortran
TYPE :: Point
    REAL :: x
    REAL :: y
    REAL :: z
END TYPE Point
```

**Declaration:**
```fortran
TYPE(Point) :: p1, p2
```

**Components:**
```fortran
p1%x = 1.0
p1%y = 2.0
p1%z = 3.0
```

or

```fortran
p = Point(1, 2.5, 4.1)
p = Point(x = 0.65)
```

## More information
[Link](https://fortran-lang.org/en/learn/quickstart/derived_types/)
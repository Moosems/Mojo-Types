# pair
*Module*
<br>

Implements the `Pair` struct.

### **Purpose:**
This struct is used when you want to store a pair of values.

<br>
This is NOT a Mojo builtin, so it needs to be imported
<br>
## `Pair`
This section defines a special `Pair` type.
<br>
It is a pair of two values.

**Notes: **
<br>
Some types don't work as they should due to traits not being implemented yet, this requires some dodgy types to be added.
<br>
E.G. "candidate not viable: argument #1 cannot bind generic !mlirtype to memory-only type 'String'".
<br>
---
|Type|Status|
|---|---|
|`Int`|Works without dodgy types|
|`FloatLiteral`|Works without dodgy types|
|`Bool`|Works without dodgy types|
|`Tuple`|Works without dodgy types|
|`String`|Needs dodgy types (Implemented as `DodgyString`)|

### **Parameters:**
 - T (`AnyType`): The first element
 - T2 (`AnyType`): The second element

### **Fields:**
    - inner_list (`ListLiteral[T, T2]`): The actual pair of elements

### **Functions:**

#### `__init__`
> `fn __init__(inout self, first: T, second: T2) -> None:`
Constructs a new `Pair` with two values.
##### **Args:**
 - first (`T`): The first value
 - second (`T2`): The second value

##### **Returns:** 
 - `None`

#### `__copyinit__`
> `fn __copyinit__(inout self, other: Self) -> None:`
Copies the contents of another `Pair` into this one.

##### **Args:**
 - other (`Self`): The `Pair` to copy

##### **Returns:**
    - `None`

#### `__getitem__`
> `fn __getitem__[i: Int, T: AnyType](borrowed self) -> T:`
Gets an element from the pair.

##### **Args:**
 - i (`Int`): The index of the element to get

##### **Returns:**
    - `T`: The element at the given index

#### `apply_function`
> `fn apply_function[T3: AnyType, T4: AnyType, func: fn(T, T2) -> ListLiteral[T3, T4]](owned self) -> Pair[T3, T4]:`
Applies a function to the pair.

##### **Args:**
 - func (`fn(T, T2) -> ListLiteral[T3, T4]`): The function to apply

##### **Returns:**
    - `Pair[T3, T4]`: The new pair with the function applied to it

<br>

### **Example:**
```mojo
from types.pair.pair import Pair

fn main():
    let pair = Pair[Int, FloatLiteral](1, 3.14)

    @noncapturing
    fn add_one_and_two(num: Int, num2: FloatLiteral) -> ListLiteral[Int, FloatLiteral]:
        return ListLiteral[Int, FloatLiteral](num + 1, num2 + 2.0)

    let new_pair = pair.apply_function[Int, FloatLiteral, add_one_and_two]()
```

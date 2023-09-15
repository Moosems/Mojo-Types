# array
*Module*
<br>

Implements the `Array`` struct.
<br>
This is NOT a Mojo builtin, so it needs to be imported
<br>
## `Array`
This section defines a special `Array` type.
<br>
It is a dynamic array that can hold any type.

### **Notes:**
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
|`Tuple`|Needs dodgy types (Not implemented yet)|
|`String`|Needs dodgy types (Implemented as `DodgyString`)|

### **Parameters:**
 - T (`AnyType`): The elements 

### **Fields:**
 - real_list (`Pointer[T]`): The actual list of elements
 - list_len (`Int`): The number of elements in the list
 - capacity (`Int`): The number of elements that can be stored in the list

### **Functions:**

#### `__init__`
> `fn __init__(inout self, default_value: T, capacity: Int = 10) -> None:`
Constructs a new `Array` with a default value and a capacity.
##### **Args:**
 - default_value (`T`): The default value to fill the array with
 - capacity (`Int`): The initial capacity of the array

##### **Returns:**
 - `None`

#### `__init__`
> `fn __init__(inout self, capacity: Int = 10) -> None:`
Constructs a new `Array` with a capacity.

##### **Args:**
 - capacity (`Int`): The initial capacity of the array

##### **Returns:**
 - `None`

#### `__getitem__`
> `fn __getitem__(borrowed self, i: Int) -> T:`
Gets an element from the array.

##### **Args:**
 - i (`Int`): The index of the element to get

##### **Returns:**
 - `T`: The element at the given index

#### `__setitem__`
> `fn __setitem__(borrowed self, loc: Int, item: T):`
Sets an element in the array.

##### **Args:**
 - loc (`Int`): The index of the element to set
 - item (`T`): The value to set the element to

##### **Returns:**
 - `None`

#### `push_back`
> `fn push_back(inout self, item: T):`
Adds an element to the end of the array.

##### **Args:**
 - item (`T`): The element to add

##### **Returns:**
 - `None`

#### `__copyinit__`
> `fn __copyinit__(inout self, other: Self):`
Copies the contents of another `Array` into this one.

##### **Args:**
 - other (`Self`): The `Array` to copy

##### **Returns:**
 - `None`

#### `apply_function`
> `fn apply_function[T2: AnyType, func: fn(T) -> T2](owned self) -> Array[T2]:`
Applies a function to every element in the array.

##### **Args:**
 - func (`fn(T) -> T2`): The function to apply

##### **Returns:**
 - `Array[T2]`: The new array with the function applied to every element
<br>

### **Example:**
```mojo
from types.array import Array
from type.dodgy import DodgyString

fn main():
    let array_capacity = 5
    let dodgystrings = Array[DodgyString](DodgyString("1"), array_capacity)
    fn str_to_int(str: DodgyString) -> Int:
        return str.to_string().to_int()
    let ints = dodgystrings.apply_function[Int, str_to_int]()
    let ints = Array[Int](1), array_capacity)
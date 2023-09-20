# array
*Module*
<br>

Implements the `Array`` struct.

### Purpose:

This struct is used when you want to store a dynamic array of values.

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
> `fn __init__[*Ts: AnyType](inout self, given_list: ListLiteral[Ts]) -> None:`
Constructs a new `Array` from a list literal.

##### **Args:**
 - given_list (`ListLiteral[Ts]`): The list literal to construct the array from

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

#### `__del__`
> `fn __del__(owned self):`
Frees the memory used by the array.

##### **Args:**
 - `None`

##### **Returns:**
 - `None`

#### `__len__`
> `fn __len__(borrowed self) -> Int:`
Gets the length of the array.

##### **Args:**
 - `None`

##### **Returns:**
 - `Int`: The length of the array

#### `__copyinit__`
> `fn __copyinit__(inout self, other: Self):`
Copies the contents of another `Array` into this one.

##### **Args:**
 - other (`Self`): The `Array` to copy

##### **Returns:**
 - `None`

#### `__moveinit__`
> `fn __moveinit__(inout self, owned other: Self):`
Moves the contents of another `Array` into this one.

##### **Args:**
 - other (`Self`): The `Array` to move

##### **Returns:**
 - `None`

#### `push_back`
> `fn push_back(inout self, item: T):`
Adds an element to the end of the array.

##### **Args:**
 - item (`T`): The element to add

##### **Returns:**
 - `None`

#### `append`
> `fn append(inout self, item: T):`
Adds an element to the end of the array (thin wrapper around `push_back`).

##### **Args:**
 - item (`T`): The element to add

##### **Returns:**
- `None`

#### `__iter__`
> `fn __iter__(self) -> ListIterator[T]:`
Gets an iterator for the array.

##### **Args:**
 - `None`

##### **Returns:**
 - `ListIterator[T]`: The iterator

#### `apply_function`
> `fn apply_function[T2: AnyType, func: fn(T) -> T2](owned self) -> Array[T2]:`
Applies a function to every element in the array.

##### **Args:**
 - func (`fn(T) -> T2`): The function to apply

##### **Returns:**
 - `Array[T2]`: The new array with the function applied to every element

#### `remove_at`
> `fn remove_at(inout self, loc: Int):`
Removes an element from the array.

##### **Args:**
 - loc (`Int`): The index of the element to remove

##### **Returns:**
 - `None`
<br>

### **Example:**
```mojo
from types import Array
from types import DodgyString

fn main():
    let array_capacity = 5
    let dodgystrings = Array[DodgyString](DodgyString("1"), array_capacity)
    fn str_to_int(str: DodgyString) -> Int:
        return str.to_string().to_int()
    let ints = dodgystrings.apply_function[Int, str_to_int]()
    let ints = Array[Int](1, array_capacity))

    let floats: Array[FloatLiteral] = [3.14, .3000000004]
```

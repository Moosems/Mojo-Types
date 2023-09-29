# matrix
*Module*
<br>

Implements the `Matrix` struct.

### **Purpose:**
This struct is used when you want to store a 2D matrix of Float32 values.

<br>
This is NOT a Mojo builtin, so it needs to be imported
<br>
## `Matrix`
This section defines a special `Matrix` type.
<br>
It is a 2D matrix of values.

**Notes: **
<br>
The `Matrix` type is implemented as a single long `Pointer` that uses some simple math to manage memory.

### **Fields:**
 - data (`Pointer[Float32]`): The actual matrix of elements
 - height (`Int`): The height of the matrix
 - width (`Int`): The width of the matrix
 - total_items (`Int`): The total number of items in the matrix

### **Functions:**

#### `__init__`
> `fn __init__(inout self, owned default_value: Float32, height: Int, width: Int) -> None:`
Constructs a new `Matrix` with a default value, height and width.

##### **Args:**
 - default_value (`Float32`): The default value to fill the matrix with
 - height (`Int`): The height of the matrix
 - width (`Int`): The width of the matrix

##### **Returns:**
 - `None`

#### `__getitem__`
> `fn __getitem__[row: Int, column: Int](borrowed self) -> Float32:`
Gets an element from the matrix.

##### **Args:**
 - row (`Int`): The row of the element to get
 - column (`Int`): The column of the element to get

##### **Returns:**
 - `Float32`: The element at the given row and column

#### `__setitem__`
> `fn __setitem__[row: Int, column: Int](inout self, item: Float32) -> None:`
Sets an element in the matrix.

##### **Args:**
 - row (`Int`): The row of the element to set
 - column (`Int`): The column of the element to set
 - item (`Float32`): The value to set the element to

##### **Returns:**
 - `None`

#### `__del__`
> `fn __del__(owned self) -> None:`
Frees the memory used by the matrix.

##### **Returns:**
 - `None`

#### `__len__`
> `fn __len__(borrowed self) -> Int:`
Gets the total number of items in the matrix.

##### **Returns:**
 - `Int`: The total number of items in the matrix

#### `__copyinit__`
> `fn __copyinit__(inout self, other: Self) -> None:`
Copies the contents of another `Matrix` into this one.

##### **Args:**
 - other (`Self`): The `Matrix` to copy

##### **Returns:**
 - `None`

#### `__moveinit__`
> `fn __moveinit__(inout self, owned other: Self) -> None:`
Moves the contents of another `Matrix` into this one.

##### **Args:**
 - other (`Self`): The `Matrix` to move

##### **Returns:**
 - `None`

#### `__lt__`
> `fn __lt__(borrowed self, rhs: Matrix) -> Bool:`
Checks if this `Matrix` is less than another `Matrix`.

##### **Args:**
 - rhs (`Matrix`): The `Matrix` to compare to

##### **Returns:**
 - `Bool`: Whether this `Matrix` is less than the other `Matrix`

#### `__gt__`
> `fn __gt__(borrowed self, rhs: Matrix) -> Bool:`
Checks if this `Matrix` is greater than another `Matrix`.

##### **Args:**
 - rhs (`Matrix`): The `Matrix` to compare to

##### **Returns:**
 - `Bool`: Whether this `Matrix` is greater than the other `Matrix`

#### `__eq__`
> `fn __eq__(borrowed self, rhs: Matrix) -> Bool:`
Checks if this `Matrix` is equal to another `Matrix`.

##### **Args:**
 - rhs (`Matrix`): The `Matrix` to compare to

##### **Returns:**
 - `Bool`: Whether this `Matrix` is equal to the other `Matrix`

#### `__ne__`
> `fn __ne__(borrowed self, rhs: Matrix) -> Bool:`
Checks if this `Matrix` is not equal to another `Matrix`.

##### **Args:**
 - rhs (`Matrix`): The `Matrix` to compare to

##### **Returns:**
 - `Bool`: Whether this `Matrix` is not equal to the other `Matrix`

#### `__ge__`
> `fn __ge__(borrowed self, rhs: Matrix) -> Bool:`
Checks if this `Matrix` is greater than or equal to another `Matrix`.

##### **Args:**
 - rhs (`Matrix`): The `Matrix` to compare to

##### **Returns:**
 - `Bool`: Whether this `Matrix` is greater than or equal to the other `Matrix`

#### `__le__`
> `fn __le__(borrowed self, rhs: Matrix) -> Bool:`
Checks if this `Matrix` is less than or equal to another `Matrix`.

##### **Args:**
 - rhs (`Matrix`): The `Matrix` to compare to

##### **Returns:**
 - `Bool`: Whether this `Matrix` is less than or equal to the other `Matrix`

#### `__add__`
> `fn __add__(borrowed self, rhs: Matrix) -> Matrix:`
Adds this `Matrix` to another `Matrix`.

##### **Args:**
 - rhs (`Matrix`): The `Matrix` to add to

##### **Returns:**
 - `Matrix`: The result of adding this `Matrix` to the other `Matrix`

#### `__sub__`
> `fn __sub__(borrowed self, rhs: Matrix) -> Matrix:`
Subtracts another `Matrix` from this `Matrix`.

##### **Args:**
 - rhs (`Matrix`): The `Matrix` to subtract from this `Matrix`

##### **Returns:**
 - `Matrix`: The result of subtracting the other `Matrix` from this `Matrix`

#### `__mul__`
> `fn __mul__(borrowed self, rhs: Matrix) -> Matrix:`
Multiplies this `Matrix` by another `Matrix`.

##### **Args:**
 - rhs (`Matrix`): The `Matrix` to multiply by

##### **Returns:**
 - `Matrix`: The result of multiplying this `Matrix` by the other `Matrix`

#### `__truediv__`
> `fn __truediv__(borrowed self, rhs: Matrix) -> Matrix:`
Divides this `Matrix` by another `Matrix`.

##### **Args:**
 - rhs (`Matrix`): The `Matrix` to divide by

##### **Returns:**
 - `Matrix`: The result of dividing this `Matrix` by the other `Matrix`

#### `__add__`
> `fn __add__(borrowed self, rhs: Float32) -> Matrix:`
Adds a `Float32` to this `Matrix`.

##### **Args:**
 - rhs (`Float32`): The `Float32` to add to this `Matrix`

##### **Returns:**
 - `Matrix`: The result of adding the `Float32` to this `Matrix`

#### `__sub__`
> `fn __sub__(borrowed self, rhs: Float32) -> Matrix:`

Subtracts a `Float32` from this `Matrix`.

##### **Args:**
 - rhs (`Float32`): The `Float32` to subtract from this `Matrix`

##### **Returns:**
 - `Matrix`: The result of subtracting the `Float32` from this `Matrix`

#### `__mul__`
> `fn __mul__(borrowed self, rhs: Float32) -> Matrix:`
Multiplies this `Matrix` by a `Float32`.

##### **Args:**
 - rhs (`Float32`): The `Float32` to multiply this `Matrix` by

##### **Returns:**
 - `Matrix`: The result of multiplying this `Matrix` by the `Float32`

#### `__truediv__`
> `fn __truediv__(borrowed self, rhs: Float32) -> Matrix:`
Divides this `Matrix` by a `Float32`.

##### **Args:**
 - rhs (`Float32`): The `Float32` to divide this `Matrix` by

##### **Returns:**
 - `Matrix`: The result of dividing this `Matrix` by the `Float32`

#### `apply_function`
> `fn apply_function[func: fn(Float32) -> Float32](borrowed self) -> Matrix:`
Applies a function to this `Matrix`.

##### **Parameters:**
 - func (`fn(Float32) -> Float32`): The function to apply

##### **Returns:**
 - `Matrix`: The result of applying the function to this `Matrix`

#### `print_all`
> `fn print_all(borrowed self) -> None:`
Prints the contents of the matrix to the console.

##### **Returns:**
 - `None`

<br>

### **Example:**
```mojo
from types import Matrix

fn main():
    var matrix = Matrix(Float32(0.0), 2, 3)

    @noncapturing
    fn add_one(num: Float32) -> Float32:
        return num + 1.0

    matrix = matrix.apply_function[add_one]()
    matrix.print_all()
```

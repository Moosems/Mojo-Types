# dodgy
*Module*
<br>

Implements the `DodgyString` struct (will include more dodgy types in the future).
<br>
This is NOT a Mojo builtin, so it needs to be imported
<br>

## `DodgyString`
This section defines a special `DodgyString` type.
<br>
It is a wrapper around `String` that allows it to be used in an `Array`.

### **Parameters:**
 - None

### **Fields:**
 - data (`Pointer[Int8]`): The actual string data
 - len (`Int`): The length of the string

### **Functions:**

#### `__init__`
> `fn __init__(str: StringLiteral) -> DodgyString:`
Constructs a new `DodgyString` from a `StringLiteral`.

##### **Args:**
 - str (`StringLiteral`): The string literal to construct the `DodgyString` from

##### **Returns:**
 - `DodgyString`: The new `DodgyString`

#### `to_string`
> `fn to_string(self) -> String:`
Converts the `DodgyString` to a `String`.

##### **Args:**
 - self (`DodgyString`): The `DodgyString` to convert

##### **Returns:**
 - `String`: The `String` representation of the `DodgyString`

<br>

### **Example:**
```mojo
from types.dodgy import DodgyString

fn main():
    let dodgy = DodgyString("Hello, world!")
    let string = dodgy.to_string()
    print(string)
```
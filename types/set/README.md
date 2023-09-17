# Set

_Module_

Implements a very simple `SetInt` struct. This struct can be use when you want to store unique values (no duplicates), and you want to be able to check if a value exists in O(1) amortized time

<br>
This is NOT a Mojo builtin, so it needs to be imported
<br>

### **Parameters:**

-   None

### **Fields:**

-   None

### **Functions:**

#### `__init__`

> `fn __init__(inout self) -> None:`

Constructs a new `SetInt` with a default capacity (capacity_default = 11).

##### **Args:**

-   `None`

##### **Returns:**

-   `None`

#### `__del__`

> `fn __del__(owned self) -> None:`

Destructs a `SetInt`.

##### **Args:**

-   `None`

##### **Returns:**

-   `None`

#### `contains`

> `fn contains(self, value: Int) -> Bool`

Checks if value is already in `SetInt`.

##### **Args:**

-   value(`Int`): The value to check.

##### **Returns:**

-   `Bool`: True if value is in `SetInt`, False otherwise.

#### `add`

> `fn add(self, value: Int) -> None:`

Add a value to `SetInt`.

##### **Args:**

-   value(`Int`): The value to add.

##### **Returns:**

-   `None`

#### `remove`

> `fn remove(self, value: Int) -> None:`

Remove a value from `SetInt`.

##### **Args:**

-   value(`Int`): The unique value to remove.

##### **Returns:**

-   `None`

#### `print_all`

> `fn print_all(self) -> None:`

Print all values in `SetInt`.

##### **Args:**

-   `None`

##### **Returns:**

-   `None`

### **Example:**

```mojo
from set import SetInt

fn main():
    var set = SetInt()

    set.add(1)
    set.add(2)

    if set.contains(1):
        print("Set contains 1")

    set.remove(1)
```

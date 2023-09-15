# input
*Module*
<br>

Implements the `input` function.
<br>
This is NOT a Mojo builtin, so it needs to be imported
<br>
## `input`
> `fn input(prompt: StringLiteral) -> String:`
This section defines a special `input` function.
<br>
It is a wrapper around the Python `input` function.

### **Parameters:**
 - prompt (`StringLiteral`): The prompt to display to the user

### **Returns:**
 - `String`: The user's input

## `input`
> `fn input(prompt: String = String("")) -> String:`
This section defines a special `input` function.
<br>
It is a wrapper around the Python `input` function.

### **Parameters:**
 - prompt (`String`): The prompt to display to the user

### **Returns:**
 - `String`: The user's input

<br>

### **Example:**
```mojo
from input import input

fn main():
    let user_input = input("Enter something: ")
    print(user_input)
```
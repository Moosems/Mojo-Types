# input
*Module*
<br>

Implements the `input` function.

### **Purpose:**
This function is used when you want to get input from the user.

<br>
This is NOT a Mojo builtin, so it needs to be imported
<br>
## `input`
> `fn input(prompt: StringLiteral) -> String:`
This section defines a special runtime `input` function.
<br>
It is a wrapper around the Python `input` function.

### **Parameters:**
 - prompt (`StringLiteral`): The prompt to display to the user

### **Returns:**
 - `String`: The user's input

## `input`
> `fn input(prompt: String = String("")) -> String:`
This section defines a special runtime `input` function.
<br>
It is a wrapper around the Python `input` function.

### **Parameters:**
 - prompt (`String`): The prompt to display to the user

### **Returns:**
 - `String`: The user's input

## `input`
> `fn input[prompt: StringLiteral]() -> String:`
This section defines a special compile-time `input` function.
<br>
It is a wrapper around the Python `input` function.

### **Parameters:**
 - prompt (`StringLiteral`): The prompt to display to the user

### **Returns:**
    - `String`: The user's input

## `input`
> `fn input[prompt: String]() -> String:`
This section defines a special compile-time `input` function.
<br>
It is a wrapper around the Python `input` function.

### **Parameters:**
 - prompt (`String`): The prompt to display to the user

### **Returns:**
    - `String`: The user's input

<br>

### **Example:**
```mojo
from types.input import input

fn main():
    let user_input: String = input("Enter something: ")
    print("You entered: " + user_input)
    let user_input2: String = input()
    print("You entered: " + user_input2)
    if user_input == user_input2:
        print("They're the same!")
    else:
        print("They're different!")
```

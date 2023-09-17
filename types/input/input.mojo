from python import Python, PythonObject

fn input(prompt: StringLiteral) -> String:
    try:
        let builtins = Python.import_module("builtins")
        let input_function = builtins.input
        let user_input: PythonObject = input_function(String(prompt))
        return user_input.to_string()
    except:
        return String("")

fn input(prompt: String = String("")) -> String:
    try:
        let builtins = Python.import_module("builtins")
        let input_function = builtins.input
        let user_input: PythonObject = input_function(prompt)
        return user_input.to_string()
    except:
        return String("")

fn input[prompt: StringLiteral]() -> String:
    try:
        let builtins = Python.import_module("builtins")
        let input_function = builtins.input
        let user_input: PythonObject = input_function(String(prompt))
        return user_input.to_string()
    except:
        return String("")

fn input[prompt: String]() -> String:
    try:
        let builtins = Python.import_module("builtins")
        let input_function = builtins.input
        let user_input: PythonObject = input_function(prompt)
        return user_input.to_string()
    except:
        return String("")

from .array import Array

fn test_array() -> None:
    # Test basic usage
    var a = Array[Int](0, 10)
    for i in range(10):
        a[i] = i

    @noncapturing
    fn square(x: Int) -> Int:
        return x * x

    # Test function application
    let b = a.apply_function[Int, square]()
    for item in b:
        print(item)
        
    # Test lengths
    debug_assert(a.__len__() == b.__len__(), "Length should be the same")
    
    # Test usage of list
    var c: Array[Int] = [2, 5]
    for i in range(9):
        c.append(i)

    # Test item removal
    c.remove_at(5)
    debug_assert(c[5] == 4, "Item should be 6")
    debug_assert(c.__len__() == 10, "Should be ten long")
    
    # Test moveinit
    let d: Array[Int] = c^
    
    # Test copyinit
    var e = d
    let f = e.apply_function[Int, square]()
    e[0] = 25
    debug_assert(e[0] != f[0], "Values should not change in f")
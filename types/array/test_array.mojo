fn test_array() -> None:
    let a = Array[Int](0, 10)
    for i in range(10):
        a[i] = i

    @noncapturing
    fn square(x: Int) -> Int:
        return x * x

    let b = a.apply_function[Int, square]()
    for i in range(10):
        print(b[i])
    debug_assert(a.__len__() == b.__len__(), "Length should be the same")
    print("Lengths match!")

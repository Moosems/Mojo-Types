struct Pair[T: AnyType, T2: AnyType]:
    var inner_list: ListLiteral[T, T2]

    fn __init__(inout self, first: T, second: T2) -> None:
        self.inner_list = ListLiteral[T, T2](first, second)

    fn __copyinit__(inout self, other: Self) -> None:
        self.inner_list = ListLiteral[T, T2](other.inner_list.get[0, T](), other.inner_list.get[1, T2]())

    fn __getitem__[i: Int, T: AnyType](borrowed self) -> T:
        return self.inner_list.get[i, T]()

    fn apply_function[T3: AnyType, T4: AnyType, func: fn(T, T2) -> ListLiteral[T3, T4]](owned self) -> Pair[T3, T4]:
        let result = func(self.inner_list.get[0, T](), self.inner_list.get[1, T2]())
        return Pair[T3, T4](result.get[0, T3](), result.get[1, T4]())

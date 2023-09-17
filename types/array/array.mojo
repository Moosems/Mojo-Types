from memory.unsafe import Pointer
from memory.memory import memcpy

struct Array[T: AnyType]:
    var real_list: Pointer[T]
    var list_len: Int
    var capacity: Int

    fn __init__(inout self, default_value: T, capacity: Int = 10) -> None:
        self.list_len = 0
        self.capacity = capacity * 2
        self.real_list = Pointer[T].alloc(self.capacity)
        for i in range(capacity):
            self.push_back(default_value)

    fn __init__(inout self, capacity: Int = 10) -> None:
        self.list_len = 0
        self.capacity = capacity * 2
        self.real_list = Pointer[T].alloc(self.capacity)

    fn __getitem__(borrowed self, i: Int) -> T:
        if i >= self.list_len:
            print("Warning: you're trying to get an index out of bounds, memory violation")
        return self.real_list.load(i)

    fn __setitem__(borrowed self, loc: Int, item: T):
        if loc > self.capacity:
            print("Warning: you're trying to set an index out of bounds, doing nothing")
            return
        self.real_list.store(loc, item)

    fn __del__(owned self) -> None:
        self.real_list.free()

    fn __len__(borrowed self) -> Int:
        return self.list_len

    fn __copyinit__(inout self, other: Self) -> None:
        self.list_len = other.list_len
        self.capacity = self.list_len * 2
        self.real_list = Pointer[T].alloc(self.capacity)
        memcpy[T](self.real_list, other.real_list, self.list_len)

    fn push_back(inout self, item: T) -> None:
        # If list has grown beyond allocated capacity, allocate a new list
        if self.list_len >= self.capacity:
            let new_capacity = self.list_len + 1 * 2
            let new_list = Pointer[T].alloc(new_capacity)
            memcpy(new_list, self.real_list, self.list_len)
            self.real_list.free()
            self.real_list = new_list
            self.capacity = new_capacity

        self.real_list.store(self.list_len, item)
        self.list_len += 1

    fn apply_function[T2: AnyType, func: fn(T) -> T2](owned self) -> Array[T2]:
        var result = Array[T2](self.capacity)
        result.list_len = self.list_len
        for i in range(self.list_len):
            result[i] = func(self[i])
        return result

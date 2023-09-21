from memory.unsafe import Pointer
from memory.memory import memcpy

struct Array[T: AnyType]:
    var real_list: Pointer[T]
    var list_len: Int
    var capacity: Int

    fn __init__(inout self, default_value: T, capacity: Int = 10) -> None:
        self.list_len = capacity if capacity > 0 else 1
        self.capacity = self.list_len * 2
        self.real_list = Pointer[T].alloc(self.capacity)
        for i in range(self.list_len):
            self[i] = default_value
            
    fn __init__[*Ts: AnyType](inout self, owned given_list: ListLiteral[Ts]) -> None:
        let given_list_len = len(given_list)
        self.list_len = 0
        self.capacity = given_list_len * 2
        self.real_list = Pointer[T].alloc(self.capacity)
        let src = Pointer.address_of(given_list).bitcast[T]()
        for i in range(given_list_len):
            self.push_back(src.load(i))

    fn __getitem__(borrowed self, i: Int) -> T:
        if i >= self.list_len:
            print("Warning: you're trying to get an index out of bounds, memory violation")
            return self.real_list.load(0)
        return self.real_list.load(i)

    fn __setitem__(inout self, loc: Int, item: T) -> None:
        if loc > self.capacity:
            print("Warning: you're trying to set an index out of bounds, doing nothing")
            return
        if loc > self.list_len:
            let old_len = self.list_len
            self.list_len = loc + 1
            for i in range(old_len, self.list_len):
                self.real_list.store(i, item)
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
        
    fn __moveinit__(inout self, owned other: Self) -> None:
        self.real_list = other.real_list
        self.list_len = other.list_len
        self.capacity = other.capacity
        memcpy[T](self.real_list, other.real_list, self.list_len)

    fn push_back(inout self, item: T) -> None:
        # If list has grown beyond allocated capacity, allocate a new list
        if self.list_len >= self.capacity:
            let new_capacity = self.list_len + 1
            let new_list = Pointer[T].alloc(new_capacity)
            memcpy(new_list, self.real_list, self.list_len)
            self.real_list.free()
            self.real_list = new_list
            self.capacity = new_capacity

        self.real_list.store(self.list_len, item)
        self.list_len += 1
        
    fn append(inout self, item: T) -> None:
        self.push_back(item)
        
    fn __iter__(self) -> ListIterator[T]:
        return ListIterator[T](self.real_list, self.list_len)

    fn apply_function[T2: AnyType, func: fn(T) -> T2](owned self) -> Array[T2]:
        var result = Array[T2](func(self[0]), self.capacity)
        result.list_len = self.list_len
        for i in range(self.list_len):
            result[i] = func(self[i])
        return result
    
    fn remove_at(inout self, loc: Int) -> None:
        if loc >= self.list_len:
            print("Warning: you're trying to remove an index out of bounds, doing nothing")
            return
        for i in range(loc, self.list_len - 1):
            self[i] = self[i + 1]
        self.list_len -= 1
    
struct ListIterator[T: AnyType]:
    var storage: Pointer[T]
    var offset: Int
    var max: Int
    
    fn __init__(inout self, storage: Pointer[T], max: Int):
        self.offset = 0
        self.max = max
        self.storage = storage
    
    fn __len__(self) -> Int:
        return self.max - self.offset
    
    fn __next__(inout self) -> T:
        let ret = self.storage.load(self.offset)
        self.offset += 1
        return ret
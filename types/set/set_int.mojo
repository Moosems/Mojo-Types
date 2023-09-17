from memory.unsafe import Pointer
from memory import memcpy, memset_zero
from math import abs


struct SetInt:
    alias min_size = 10

    var size: Int
    var _filled: Int
    var data: Pointer[Int]
    var flag_for_zero_value: Bool

    fn __init__(inout self):
        self.size = self.min_size
        self._filled = 0
        self.flag_for_zero_value = False

        self.data = Pointer[Int].alloc(self.min_size)
        memset_zero(self.data, self.min_size)

    fn __init__(inout self, new_min_size: Int):
        self.size = new_min_size
        self._filled = 0
        self.flag_for_zero_value = False

        self.data = Pointer[Int].alloc(self.min_size)
        memset_zero(self.data, self.min_size)

    fn __del__(owned self):
        self.data.free()

    fn __hash(self, value: Int) -> Int:
        return abs(value) % self.size

    fn __contains(self, value: Int) -> Int:
        if value == 0 and not self.flag_for_zero_value:
            return -1

        for i in range(self.size):
            let index = (self.__hash(value) + i) % self.size
            if self.data[index] == value:
                return index

        return -1

    fn contains(self, value: Int) -> Bool:
        return self.__contains(value) >= 0

    fn add(inout self, value: Int):
        if value == 0:
            self.flag_for_zero_value = True
            return

        if not self.contains(value):
            self._filled += 1

            for i in range(self.size):
                let index = (self.__hash(value) + i) % self.size
                if self.data[i] == 0:
                    self.data.store(i, value)
                    break

        self.__resize()

    fn remove(inout self, value: Int):
        let index = self.__contains(value)

        if index >= 0 and value == 0:
            self.flag_for_zero_value = False
        elif index >= 0:
            self._filled -= 1

            for i in range(self.size):
                let index = (self.__hash(value) + i) % self.size

                if self.data[index] == value:
                    self.data.store(index, 0)
                    break

        self.__resize()

    fn __resize(inout self):
        # in the array we always want to have more space than the number of elements in the set to reduce collisions
        let capacity_ratio = self._filled / self.size  # we first check the capacity ratio before resizing (So how many values we have in the array compared to the size of the array)

        # if the capacity ratio is less than the resize factor down (0.25) we reduce the size of the array
        if capacity_ratio < .25 and self.size // 2 >= self.min_size:
            self._resize_array(self.size // 2)
        # if the capacity ratio is more than the resize factor up (0.5) we increase the size of the array
        if capacity_ratio > 0.5:
            self._resize_array(self.size * 2 + 1)

    fn _resize_array(inout self, new_size: Int):
        let new_data = Pointer[Int].alloc(new_size)

        memset_zero(new_data, new_size)
        memcpy(new_data, self.data, self.size)

        self.data.free()
        self.data = new_data
        self.size = new_size

    fn print_all(self):
        print_no_newline("[")
        for i in range(self.size):
            if self.data[i] != 0:
                print_no_newline(self.data[i], ",")
        if self.flag_for_zero_value:
            print_no_newline(0, ",")
        print("]")

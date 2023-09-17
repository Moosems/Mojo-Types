from memory.unsafe import DTypePointer
from memory import memcpy, memset_zero
from math import abs


struct SetInt:
    alias resize_factor_up = 0.5
    alias resize_factor_down = 0.25
    alias min_size = 11

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
        let capacity_ratio = self._filled / self.size

        if capacity_ratio < self.resize_factor_down and self.size // 2 >= self.min_size:
            self._resize_array(self.size // 2)
        if capacity_ratio > self.resize_factor_up:
            self._resize_array(self.size * 2 + 1)

    fn _resize_array(inout self, new_size: Int):
        let new_data = Pointer[Int].alloc(new_size)

        memset_zero(new_data, new_size)
        memcpy(new_data, self.data, self.size)

        self.data.free()
        self.data = new_data
        self.size = new_size

    fn print_all(self):
        print("[")
        for i in range(self.size):
            if self.data[i] != 0:
                print_no_newline(self.data[i], ",")
        if self.flag_for_zero_value:
            print_no_newline(0, ",")
        print("]")

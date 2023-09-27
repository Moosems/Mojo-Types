from memory.unsafe import Pointer

struct Matrix:
    """Simple 2D Matrix that uses Float32"""
    var data: Pointer[Float32] # Get around traits limitation,
    # in reality it just contains T.
    var height: Int
    var width: Int
    # [
    #     [item, item, item],
    #     [item, item, item]
    # ]
    # 2x3
    # height: 2
    # width: 3
    # In reality however, this is just a single long Pointer that
    # uses some simple math to manage memory.
    var total_items: Int

    fn __init__(inout self, owned default_value: Float32, height: Int, width: Int) -> None:
        self.height = height if height > 0 else 1
        self.width = width if width > 0 else 1
        self.total_items = self.height * self.width
        self.data = Pointer[Float32].alloc(self.total_items)
        for i in range(self.total_items):
            self.data.store(i, default_value)

    # fn __init__[*Ts: ListLiteral[Float32]](inout self, owned given_list: ListLiteral[Ts]) -> None:
    #     self.height = given_list.__len__()
    #     self.width = given_list.get[0, ListLiteral[Float32]]().__len__()
    #     self.total_items = self.height * self.width
    #     self.data = Pointer[Float32].alloc(self.total_items)
    #     let lists = Pointer.address_of(given_list).bitcast[ListLiteral[Float32]]()
    #     var current_loc = 0
    #     for i in range(self.height):
    #         var current_list: ListLiteral[Float32] = lists.load(i)
    #         let list_elems = Pointer.address_of(current_list).bitcast[Float32]()
    #         for j in range(self.width):
    #             self.data.store(current_loc, list_elems.load(j))
    #             current_loc += 1

    fn __getitem__(borrowed self, row: Int, column: Int) -> Float32:
        let loc: Int = (row * self.width) + column
        if loc > self.total_items:
            print("Warning: you're trying to get an index out of bounds, memory violation")
            return self.data.load(0)
        return self.data.load(loc)

    fn __setitem__(inout self, row: Int, column: Int, item: Float32) -> None:
        let loc: Int = (row * self.width) + column
        if loc > self.total_items:
            print("Warning: you're trying to set an index out of bounds, doing nothing")
            return
        self.data.store(loc, item)

    fn __del__(owned self) -> None:
        self.data.free()

    fn __len__(borrowed self) -> Int:
        return self.total_items

    fn __copyinit__(inout self, other: Self) -> None:
        self.height = other.height
        self.width = other.width
        self.total_items = other.total_items
        self.data = Pointer[Float32].alloc(self.total_items)
        memcpy[Float32](self.data, other.data, self.total_items)

    fn __moveinit__(inout self, owned other: Self) -> None:
        self.height = other.height
        self.width = other.width
        self.total_items = other.total_items
        self.data = Pointer[Float32].alloc(self.total_items)
        memcpy[Float32](self.data, other.data, self.total_items)

    fn __lt__(borrowed self, rhs: Matrix) -> Bool:
        # Expects the other Matrix has the same dimensions
        for i in range(self.height):
            for j in range(self.width):
                if self[i, j] < rhs[i, j]:
                    return True
        return False

    fn __gt__(borrowed self, rhs: Matrix) -> Bool:
        # Expects the other Matrix has the same dimensions
        for i in range(self.height):
            for j in range(self.width):
                if self[i, j] > rhs[i, j]:
                    return True
        return False

    fn __eq__(borrowed self, rhs: Matrix) -> Bool:
        # Expects the other Matrix has the same dimensions
        for i in range(self.height):
            for j in range(self.width):
                let self_val: Float32 = self[i, j]
                let rhs_val: Float32 = rhs[i, j]
                if self_val < rhs_val or self_val > rhs_val:
                    return False
        return True

    fn __ne__(borrowed self, rhs: Matrix) -> Bool:
        # Expects the other Matrix has the same dimensions
        return not self == rhs

    fn __ge__(borrowed self, rhs: Matrix) -> Bool:
        # Expects the other Matrix has the same dimensions
        return self > rhs or self == rhs

    fn __le__(borrowed self, rhs: Matrix) -> Bool:
        # Expects the other Matrix has the same dimensions
        return self < rhs or self == rhs

    fn __add__(borrowed self, rhs: Matrix) -> Matrix:
        # Expects the other Matrix has the same dimensions
        var new_matrix: Matrix = Matrix(Float32(0.0), self.height, self.width)
        for i in range(self.height):
            for j in range(self.width):
                new_matrix[i, j] = self[i, j] + rhs[i, j]
        return new_matrix

    fn __sub__(borrowed self, rhs: Matrix) -> Matrix:
        # Expects the other Matrix has the same dimensions
        var new_matrix: Matrix = Matrix(Float32(0.0), self.height, self.width)
        for i in range(self.height):
            for j in range(self.width):
                new_matrix[i, j] = self[i, j] - rhs[i, j]
        return new_matrix

    fn __mul__(borrowed self, rhs: Matrix) -> Matrix:
        # Expects the other Matrix has the same dimensions
        var new_matrix: Matrix = Matrix(Float32(0.0), self.height, self.width)
        for i in range(self.height):
            for j in range(self.width):
                new_matrix[i, j] = self[i, j] * rhs[i, j]
        return new_matrix

    fn __truediv__(borrowed self, rhs: Matrix) -> Matrix:
        # Expects the other Matrix has the same dimensions
        var new_matrix: Matrix = Matrix(Float32(0.0), self.height, self.width)
        for i in range(self.height):
            for j in range(self.width):
                new_matrix[i, j] = self[i, j] / rhs[i, j]
        return new_matrix

    fn __add__(borrowed self, rhs: Float32) -> Matrix:
        var new_matrix: Matrix = Matrix(Float32(0.0), self.height, self.width)
        for i in range(self.height):
            for j in range(self.width):
                new_matrix[i, j] = self[i, j] + rhs
        return new_matrix

    fn __sub__(borrowed self, rhs: Float32) -> Matrix:
        var new_matrix: Matrix = Matrix(Float32(0.0), self.height, self.width)
        for i in range(self.height):
            for j in range(self.width):
                new_matrix[i, j] = self[i, j] - rhs
        return new_matrix

    fn __mul__(borrowed self, rhs: Float32) -> Matrix:
        var new_matrix: Matrix = Matrix(Float32(0.0), self.height, self.width)
        for i in range(self.height):
            for j in range(self.width):
                new_matrix[i, j] = self[i, j] * rhs
        return new_matrix

    fn __truediv__(borrowed self, rhs: Float32) -> Matrix:
        var new_matrix: Matrix = Matrix(Float32(0.0), self.height, self.width)
        for i in range(self.height):
            for j in range(self.width):
                new_matrix[i, j] = self[i, j] / rhs
        return new_matrix

    fn apply_function[func: fn(Float32) -> Float32](borrowed self) -> Matrix:
        var new_matrix: Matrix = Matrix(Float32(0.0), self.height, self.width)
        for i in range(self.height):
            for j in range(self.width):
                new_matrix[i, j] = func(self[i, j])
        return new_matrix

    fn print_all(borrowed self) -> None:
        print("[")
        for i in range(self.height):
            print_no_newline("    [")
            for j in range(self.width):
                print_no_newline(self[i, j])
                if j != self.width - 1:
                    print_no_newline(", ")
            print("]," if i != self.height - 1 else "]")
        print("]")

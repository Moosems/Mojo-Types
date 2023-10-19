from memory import memcpy, memset_zero


@value
@register_passable("trivial")
struct DodgyString:
    var data: Pointer[Int8]
    var len: Int

    fn __init__(str: StringLiteral) -> DodgyString:
        let l = str.__len__()
        let s = String(str)
        let p = Pointer[Int8].alloc(l)
        for i in range(l):
            p.store(i, s._buffer[i])
        return DodgyString(p, l)

    fn __init__(str: String) -> DodgyString:
        let l = str.__len__()
        let p = Pointer[Int8].alloc(l)
        for i in range(l):
            p.store(i, str._buffer[i])
        return DodgyString(p, l)

    fn to_string(self) -> String:
        let ptr = Pointer[Int8]().alloc(self.len)

        memcpy(ptr, self.data, self.len)

        return String(ptr, self.len)

    fn to_string_ref(self) -> StringRef:
        let ptr = Pointer[Int8]().alloc(self.len + 1)

        memcpy(ptr, self.data.bitcast[Int8](), self.len)
        memset_zero(ptr.offset(self.len), 1)

        return StringRef(
            ptr.bitcast[__mlir_type.`!pop.scalar<si8>`]().address, self.len
        )

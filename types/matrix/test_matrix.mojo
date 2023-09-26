from .matrix import Matrix

fn test_matrix() -> None:
    var test_matrix: Matrix = Matrix(Float32 (3.14), 2, 2)
    let second_test_matrix: Matrix = Matrix(Float32 (3.14), 2, 2)
    debug_assert(not test_matrix < second_test_matrix, "Should not be less")
    debug_assert(not test_matrix > second_test_matrix, "Should not be more")
    debug_assert(test_matrix == second_test_matrix, "Should be equal")
    debug_assert(not test_matrix != second_test_matrix, "Should not be not equal")
    debug_assert(test_matrix >= second_test_matrix, "Should be greater than or equal")
    debug_assert(test_matrix <= second_test_matrix, "Should be less than or equal")
    test_matrix[0, 0] = Float32(1.5)
    test_matrix[0, 1] = Float32(.33)
    test_matrix[1, 0] = Float32(6.5)
    test_matrix[1, 1] = Float32(2.5)
    debug_assert(test_matrix < second_test_matrix, "Should be less")
    debug_assert(not test_matrix > second_test_matrix, "Should not be more")
    debug_assert(not test_matrix == second_test_matrix, "Should not be equal")
    debug_assert(test_matrix != second_test_matrix, "Should be not equal")
    debug_assert(not test_matrix >= second_test_matrix, "Should not be greater than or equal")
    debug_assert(test_matrix <= second_test_matrix, "Should be less than or equal")
    # No more debug_asserts because its been pretty well tested
    let third_test_matrix: Matrix = test_matrix + second_test_matrix
    let fourth_test_matrix: Matrix = test_matrix - second_test_matrix
    let fifth_test_matrix: Matrix = test_matrix * second_test_matrix
    let sixth_test_matrix: Matrix = test_matrix / second_test_matrix
    let seventh_test_matrix: Matrix = test_matrix + Float32(1.0)
    let eighth_test_matrix: Matrix = test_matrix - Float32(1.0)
    let ninth_test_matrix: Matrix = test_matrix * Float32(1.0)
    let tenth_test_matrix: Matrix = test_matrix / Float32(1.0)
    @noncapturing
    fn test_func(x: Float32) -> Float32:
        return x * Float32(2.0)
    let eleventh_test_matrix: Matrix = test_matrix.apply_function[test_func]()
    # let second_test: Matrix[] = [[Float32(1.5), Float32(.33)], [Float32(6.5), Float32(2.5)]]

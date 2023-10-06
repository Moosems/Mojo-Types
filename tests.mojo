# Import all test functions from test files
from types.array.test_array import test_array
from types.set.test_set_int import test_set
from types.matrix.test_matrix import test_matrix
from types.dodgy.test_dodgy import test_dodgy

# Test basic imports
from types import Array, DodgyString, input, Pair, SetInt, Matrix

# Run tests
fn main():
    print("Starting tests")
    print("Basic imports succeeded")
    test_array()
    test_set()
    test_matrix()
    test_dodgy()
    print("Test complete")

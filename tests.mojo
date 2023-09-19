# Import all test functions from test files
from types.array.test_array import test_array
from types.set.test_set_int import test_set

fn main():
    print("Starting tests")
    test_array()
    test_set()
    print("Test complete")
# Import all parent folders that contain tests
from types import array, set

print(array)

# Import all test functions from test files
from array.test_array import test_array
from set.test_set_int import test_set

fn main():
    print("Starting tests")
    test_array()
    test_set()
    print("Test complete")
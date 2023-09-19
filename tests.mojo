# Import all test functions from test files
from types.array.test_array import test_array
from types.set.test_set_int import test_set

# Test basic imports
from types.array.array import Array
from types.dodgy.dodgy import DodgyString
from types.pair.pair import Pair
from types.set.set_int import SetInt

fn main():
    print("Starting tests")
    print("Basic imports succeeded")
    test_array()
    test_set()
    print("Test complete")
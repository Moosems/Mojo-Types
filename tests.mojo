# Import all test functions from test files
from types.array.test_array import test_array
from types.set.test_set_int import test_set

# Test basic imports
from types.array import Array
from types.dodgy import DodgyString
from types.input import input
from types.pair import Pair
from types.set import SetInt

fn main():
    print("Starting tests")
    print("Basic imports succeeded")
    test_array()
    test_set()
    print("Test complete")
from set import SetInt


fn test_set():
    var test = SetInt()

    for i in range(15, 20):
        test.add(i)
    for i in range(20):
        test.add(i)

    let filled = test._filled
    for i in range(20):
        test.add(i)
        debug_assert(filled != test._filled, "Hash function is not working correctly")

    var count = 0
    for i in range(40):
        if test.contains(i):
            count += 1

    print("Values where added correctly:", count == 20)

    for i in range(5, 10):
        test.remove(i)

    count = 0
    for i in range(40):
        if test.contains(i):
            count += 1

    print("Values where removed correctly:", count == 15)

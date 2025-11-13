def factorial(n):
    if n == 0:
        return 1
    elif isinstance(n, int) and n > 0:
        return n * factorial(n-1)
    else:
        # Check specifically for non-integer types or negative integers
        if not isinstance(n, int) or n < 0:
            raise TypeError("the argument to factorial must be an integer >= 0")

# Test cases:
cases = [-1, 0.5, 0, 3]
for case in cases:
    try:
        result = factorial(case)
        print(result) # or print(factorial(case))
    except TypeError as e:
        print(e)

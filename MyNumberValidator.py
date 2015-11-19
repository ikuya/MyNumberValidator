#!/usr/bin/env python3

import sys

def checkMyNumber(mynumber):
    digits = [int(x) for x in list(str(mynumber))]
    digits.reverse()
    if (len(digits) != 12):
        return False
    checkDigit, *p = digits
    x = 0
    for i in range(1,12):
        q = i + 1 if (i <= 6) else i - 5
        x += p[i-1] * q
    x = x % 11
    if x <= 1:
        return checkDigit == 0
    else:
        return checkDigit == 11 - x

def main(argv):
    if len(argv) == 0:
        print("Error: empty arg")
        quit()
    try:
        mynumber = int(argv[0])
        print("VALID" if checkMyNumber(mynumber) else "INVALID")
    except ValueError:
        print("Error: the argument must be a numeric number")
        quit()

if __name__ == "__main__":
    main(sys.argv[1:])


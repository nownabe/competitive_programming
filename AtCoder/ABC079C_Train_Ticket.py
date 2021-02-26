# https://atcoder.jp/contests/abc079/tasks/abc079_c


def search(a, b, c, d):
    for op1 in range(2):
        if op1 == 0:
            ab = a + b
        else:
            ab = a - b

        for op2 in range(2):
            if op2 == 0:
                abc = ab + c
            else:
                abc = ab - c

            if abc + d == 7:
                return (op1, op2, 0)
            elif abc - d == 7:
                return (op1, op2, 1)

    raise "Invalid input"


ops = ['+', '-']

A, B, C, D = map(int, list(input()))

op1, op2, op3 = search(A, B, C, D)

print(f'{A}{ops[op1]}{B}{ops[op2]}{C}{ops[op3]}{D}=7')


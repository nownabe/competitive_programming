# Y      = 10000x + 5000y + 1000*(N-x-y)
# Y/1000 = 10x + 5y + (N-x-y)
#        = N + 9x + 4y
# Y'     = N + 9x + 4y
#
# y      = (Y' - N - 9x) / 4

# 0 <= x + y <= N


def check(N, Y):
    Y = Y // 1000

    for x in range(N + 1):
        tmp = (Y - N - 9 * x)

        if tmp < 0:
            continue

        y = tmp // 4

        if tmp % 4 == 0 and x + y <= N:
            return (x, y, N - x - y)

    return (-1, -1, -1)


N, Y = map(int, input().split())

x, y, z = check(N, Y)
print(x, y, z)



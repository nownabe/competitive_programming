N, Y = map(int, input().split())

def search(N, Y):
    for x in range(N + 1):
        rest1 = Y - 10000 * x

        for y in range(N + 1 - x):
            rest2 = rest1 - 5000 * y

            z = N - x - y

            if rest2 - 1000 * z == 0:
                return (x, y, z)

    return (-1, -1, -1)

def search2(N, Y):
    Y = Y // 1000

    if Y > 10 * N:
        return (-1, -1, -1)

    for x in range(0, N + 1):
        tmp = Y - N - 9 * x

        if tmp < 0:
            break

        y = tmp // 4
        if tmp % 4 == 0 and x + y <= N:
            return (x, y, N - x - y)

    return (-1, -1, -1)

x, y, z = search2(N, Y)
print(f'{x} {y} {z}')

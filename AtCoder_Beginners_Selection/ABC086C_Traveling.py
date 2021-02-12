def check(n):
    t = 0
    x = 0
    y = 0

    for _ in range(n):
        ti, xi, yi = map(int, input().split())
        distance = abs(xi - x) + abs(yi - y)

        if distance > ti - t:
            return False
        elif (ti - t - distance) % 2 != 0:
            return False

        t = ti
        x = xi
        y = yi

    return True


N = int(input())

if check(N):
    print('Yes')
else:
    print('No')

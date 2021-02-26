import math

while True:
    n = input()

    if n == '0':
        break

    ss = list(map(int, input().split()))

    sum = 0
    for s in ss:
        sum += s

    mean = sum / len(ss)

    s2 = 0
    for s in ss:
        s2 += (s - mean) ** 2

    s2 /= len(ss)

    print(math.sqrt(s2))


n = int(input())

buildings = [[[0 for _ in range(10)] for _ in range(3)] for _ in range(4)]

for _ in range(n):
    b, f, r, v = map(int, input().split())

    buildings[b-1][f-1][r-1] += v

for b in range(len(buildings)):
    for f in buildings[b]:
        print(' ' + ' '.join(map(str, f)))

    if b < 3:
        print('#' * 20)

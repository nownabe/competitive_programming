N = int(input())

max = -1

x, y = map(int, input().split())
points = [(x, y)]

for _ in range(N - 1):
    x, y = map(int, input().split())

    for p in points:
        d = ((x - p[0]) ** 2 + (y - p[1]) ** 2) ** (1/2)

        if d > max:
            max = d

    points.append((x, y))

print(max)


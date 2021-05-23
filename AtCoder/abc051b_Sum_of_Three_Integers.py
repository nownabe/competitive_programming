K, S = map(int, input().split())

count = 0

for x in range(K + 1):
    for y in range(K + 1):
        z = S - x - y

        if z > K:
            continue

        if z < 0:
            break

        count += 1

print(count)

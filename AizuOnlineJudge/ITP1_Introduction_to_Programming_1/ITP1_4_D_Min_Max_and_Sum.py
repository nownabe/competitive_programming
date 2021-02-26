input()
ns = map(int, input().split())

min = 1000001
max = -1000001
sum = 0

for n in ns:
    if min > n:
        min = n

    if max < n:
        max = n

    sum += n

print(f'{min} {max} {sum}')

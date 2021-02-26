r, c = map(int, input().split())

table = []

for _ in range(r):
    table.append(list(map(int, input().split())))

for row in table:
    print(' '.join(map(str, row)), sum(row))

sum = 0

for j in range(c):
    csum = 0
    for i in range(r):
        sum += table[i][j]
        csum += table[i][j]

    print(f'{csum} ', end='')

print(sum)

# https://atcoder.jp/contests/abc194/tasks/abc194_c

N = int(input())

a = list(map(int, input().split()))

total = 0

sum_aj = a[0]
sum_squared_aj = a[0] ** 2

for i in range(1, N):
    total += a[i] ** 2 * i - 2 * a[i] * sum_aj + sum_squared_aj
    sum_aj += a[i]
    sum_squared_aj += a[i] ** 2

print(total)

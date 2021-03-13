# https://atcoder.jp/contests/abc195/tasks/abc195_c

N = int(input())

count = 0
c = 1
while N >= 1000 ** c:
    count += c * min(N - 1000 ** c + 1, (1000 ** (c + 1) - 1000 ** c))
    c += 1

print(count)

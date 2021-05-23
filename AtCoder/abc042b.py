# https://atcoder.jp/contests/abc042/tasks/abc042_b

N, L = map(int, input().split())
Ss = []

for _ in range(N):
    Ss.append(input())

print(''.join(sorted(Ss)))

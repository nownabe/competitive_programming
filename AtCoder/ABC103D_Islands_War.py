# https://atcoder.jp/contests/abc103/tasks/abc103_d


def search(n, m, battles):
    battles = sorted(battles)

    count = 0
    right = battles[0][1]

    for a, b in battles[1:]:
        if right <= a:
            count += 1
            right = b
        elif b < right:
            right = b

    return count + 1


N, M = map(int, input().split())

battles = []

for _ in range(M):
    a, b = map(int, input().split())
    battles.append((a, b))

print(search(N, M, battles))

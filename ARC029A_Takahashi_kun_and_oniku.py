# https://atcoder.jp/contests/arc029/tasks/arc029_1

# Input:
#   int N  : 1 <= N <= 4
#   int t_i: 1 <= t_i <= 50

def search(N, t):
    min = float('inf')

    for b in range(1 << N):
        takahashi = []
        tomodachi = []

        for i in range(N):
            if b & (1 << i) != 0:
                takahashi.append(i)
            else:
                tomodachi.append(i)

        takahashi_total = 0
        tomodachi_total = 0

        for i in takahashi:
            takahashi_total += t[i]

        for i in tomodachi:
            tomodachi_total += t[i]

        if takahashi_total > tomodachi_total:
            if takahashi_total < min:
                min = takahashi_total
        else:
            if tomodachi_total < min:
                min = tomodachi_total

    return min


N = int(input())
t = []

for i in range(N):
    t.append(int(input()))

print(search(N, t))


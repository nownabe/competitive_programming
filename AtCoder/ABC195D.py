# https://atcoder.jp/contests/abc195/tasks/abc195_d


def solve(items, boxes, ql, qr):
    items = sorted(items)
    boxes = sorted(boxes[:ql-1] + boxes[qr:])

    dp = [[-1] * (len(boxes) + 1) for _ in range(len(items))]

    def rec(i, j):
        if i >= len(items) or j >= len(boxes):
            return 0

        if dp[i][j] != -1:
            return dp[i][j]

        w, v = items[i]

        box = None
        for b in range(len(boxes[j:])):
            if boxes[j + b] >= w:
                box = j + b
                break

        if box is None:
            dp[i][j] = 0
        else:
            dp[i][j] = max(rec(i + 1, j), rec(i + 1, box + 1) + v)

        return dp[i][j]

    return rec(0, 0)


N, M, Q = map(int, input().split())

items = []
for _ in range(N):
    w, v = map(int, input().split())
    items.append((w, v))

X = list(map(int, input().split()))

for _ in range(Q):
    L, R = map(int, input().split())
    print(solve(items, X, L, R))

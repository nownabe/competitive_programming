# https://onlinejudge.u-aizu.ac.jp/courses/library/7/DPL/1/DPL_1_B


def solve(n, w, items):

    dp = [[-1] * (w + 1) for _ in range(n + 1)]

    def value(i, current_w):
        if i >= n:
            return 0

        if dp[i][current_w] > -1:
            return dp[i][current_w]

        vi, wi = items[i]
        if current_w + wi > w:
            v = value(i + 1, current_w)
        else:
            v = max(value(i + 1, current_w), value(i + 1, current_w + wi) + vi)

        dp[i][current_w] = v
        return v

    return value(0, 0)


def solve2(n, w, items):

    dp = [[0] * (w + 1) for _ in range(n + 1)]

    for i in reversed(range(n)):
        for j in range(w + 1):
            vi, wi = items[i]

            if j + wi > w:
                dp[i][j] = dp[i + 1][j]
            else:
                dp[i][j] = max(dp[i + 1][j], dp[i + 1][j + wi] + vi)

    return dp[0][0]


N, W = map(int, input().split())
items = []

for _ in range(N):
    v, w = map(int, input().split())
    items.append((v, w))


print(solve2(N, W, items))

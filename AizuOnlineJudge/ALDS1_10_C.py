# https://onlinejudge.u-aizu.ac.jp/courses/lesson/1/ALDS1/10/ALDS1_10_C

def solve(x, y):
    dp = [[0] * (len(y) + 1) for _ in range(len(x) + 1)]

    for i in range(len(x)):
        for j in range(len(y)):
            if x[i] == y[j]:
                dp[i + 1][j + 1] = dp[i][j] + 1
            else:
                dp[i + 1][j + 1] = max(dp[i + 1][j], dp[i][j + 1])

    return dp[len(x)][len(y)]


def solve2(x, y):
    dp = [0] * (len(y) + 1)

    for i in range(len(x)):
        mem = dp[:]
        for j in range(len(y)):
            if x[i] == y[j]:
                dp[j + 1] = mem[j] + 1
            elif dp[j + 1] < dp[j]:
                dp[j + 1] = dp[j]

    return dp[len(y)]


q = int(input())
for _ in range(q):
    x = input()
    y = input()
    print(solve2(x, y))

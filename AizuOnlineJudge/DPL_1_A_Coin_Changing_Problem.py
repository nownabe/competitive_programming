# https://onlinejudge.u-aizu.ac.jp/courses/library/7/DPL/1/DPL_1_A


def search(amount, coins):
    a = [amount + 1] * (amount + 1)
    a[0] = 0

    for coin in coins:
        for i, v in enumerate(a):
            if i + coin >= len(a):
                continue

            if a[i + coin] > v + 1:
                a[i + coin] = v + 1

    return a[amount]


n, m = map(int, input().split())
c = list(map(int, input().split()))

print(search(n, c))

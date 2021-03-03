# https://atcoder.jp/contests/keyence2020/tasks/keyence2020_b


def search(n, ranges):
    ranges = sorted(ranges)

    prev_right = ranges[0][0]
    count = 0

    for left, right in ranges:
        if prev_right <= left:
            count += 1
            prev_right = right
        elif prev_right > right:
            prev_right = right

    return count


N = int(input())
ranges = []

for _ in range(N):
    Xi, Li = map(int, input().split())
    ranges.append((Xi - Li, Xi + Li))

print(search(N, ranges))

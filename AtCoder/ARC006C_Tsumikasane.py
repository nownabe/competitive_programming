# https://atcoder.jp/contests/arc006/tasks/arc006_3


def search(weights):
    patterns = []

    for w in weights:
        if len(patterns) == 0:
            patterns.append([w])
        else:
            patterns.append(patterns[-1][:] + [w])

        for piles in patterns[:-1]:
            candidates = [pile for pile in piles if pile >= w]
            if len(candidates) > 0:
                piles[piles.index(min(candidates))] = w
            else:
                piles.append(w)

    return min([len(piles) for piles in patterns])


N = int(input())
weights = []

for _ in range(N):
    weights.append(int(input()))

print(search(weights))

# https://atcoder.jp/contests/abc038/tasks/abc038_d


def search(n, boxes):
    boxes = sorted(boxes)

    counts = [0] * n

    for i, (w, h) in enumerate(boxes):
        candidates = [counts[j] for j in range(0, i) if boxes[j][0] < w and boxes[j][1] < h]
        if len(candidates) == 0:
            counts[i] = 1
        else:
            counts[i] = max(candidates) + 1

    return max(counts)


def search2(n, boxes):
    boxes = sorted(boxes)

    counts = [0] * n

    for i, (w, h) in enumerate(boxes):
        count = 0
        for j in range(0, i):
            if boxes[j][0] < w and boxes[j][1] < h and counts[j] > count:
                count = counts[j]
        counts[i] = count + 1

    return max(counts)


def search3(n, boxes):
    boxes = sorted(boxes, reverse=True)
    boxes = sorted(boxes, key=lambda x: x[1])
    counts = {} # counts[w]は wi <= w のときの最大値
    for w in range(100001):
        counts[w] = 0

    prev_w = 0
    for w, h in boxes:
        if prev_w == w:
            continue

        counts[w] = counts[prev_w] + 1
        prev_w = w

    return max(counts.values())




# def search3(n, boxes):
#     from bisect import bisect_left
#
#     boxes = sorted(boxes, reverse=True)
#     #print(boxes)
#     boxes = sorted(boxes, key=lambda x: x[1])
#     #print(boxes)
#
#     dp = [100001 for i in range(n + 1)]
#     dp[0] = 0
#     count = 0
#     prev_w, prev_h = (-1, -1)
#     for i in range(n):
#         # print(f'{i}: {boxes[i]}')
#         # print(f'     dp = {dp}')
#         # print(f'     bisect_left(dp, {boxes[i][0]}) = {bisect_left(dp, boxes[i][0])}')
#         # dp[bisect_left(dp, boxes[i][0])] = boxes[i][0]
#         # print(f'     dp = {dp}')
#         if prev_w < boxes[i][0] and prev_h < boxes[i][1]:
#             count += 1
#             prev_w = boxes[i][0]
#             prev_h = boxes[i][1]
#
#     return count
#
#
#     return bisect_left(dp, 100001) - 1
#
#     ##
#     a = set()
#     for w, h in enumerate(boxes):
#         a.add(w)
#     return len(a)
#     ##
#
#
#     counts = {}
#     for w in range(100001):
#         counts[w] = 0
#
#     prev_h = -1
#     for i, (w, h) in enumerate(boxes):
#         count = counts[w - 1] + 1
#         counts[w] = max(count, counts[w])
#
#     return counts[boxes[-1][0]]


N = int(input())

boxes = []

for _ in range(N):
    w, h = map(int, input().split())
    boxes.append((w, h))

print(search3(N, boxes))

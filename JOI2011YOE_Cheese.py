# https://atcoder.jp/contests/joi2011yo/tasks/joi2011yo_e

# Input:
#   1 <= H <= 1000
#   1 <= W <= 1000
#   1 <= N <= 9
#
#   S: 巣
#   X: 障害物
#   .: 空き地
#   1-9: チーズ工場

from collections import deque

DIRECTIONS = [(-1, 0), (1, 0), (0, -1), (0, 1)]

def search(h, w, n, town, start):
    time = 0

    for c in range(1, n + 1):
        todo = deque([start])

        visited = [[False] * w for _ in range(h)]
        distances = [[None] * w for _ in range(h)]

        visited[start[0]][start[1]] = True
        distances[start[0]][start[1]] = 0

        while len(todo) != 0:
            vi, vj = todo.popleft()

            for di, dj in DIRECTIONS:
                wi, wj = (vi + di, vj + dj)

                if 0 <= wi < h and 0 <= wj < w and town[wi][wj] != 'X':
                    if visited[wi][wj]:
                        continue

                    distances[wi][wj] = distances[vi][vj] + 1

                    if town[wi][wj] == str(c):
                        start = (wi, wj)
                        time += distances[wi][wj]
                        todo.clear()
                        break

                    visited[wi][wj] = True
                    todo.append((wi, wj))

    return time


H, W, N = map(int, input().split())

town = []
start = None

for i in range(H):
    row = list(input())

    if 'S' in row:
        start = (i, row.index('S'))

    town.append(row)

print(search(H, W, N, town, start))

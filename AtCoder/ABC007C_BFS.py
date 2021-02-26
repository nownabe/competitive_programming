# https://atcoder.jp/contests/abc007/tasks/abc007_3

from collections import deque


DIRECTIONS = [(-1, 0), (1, 0), (0, -1), (0, 1)]


def search(R, C, s, g, maze):
    todo = deque([s])
    visited = [[False] * C for _ in range(R)]
    distances = [[None] * C for _ in range(R)]
    distances[s[0]][s[1]] = 0

    while len(todo) != 0:
        vy, vx = todo.popleft()

        for dy, dx in DIRECTIONS:
            wy = vy + dy
            wx = vx + dx

            if 0 <= wy < R and 0 <= wx < C and maze[wy][wx] == '.':
                if visited[wy][wx]:
                    continue

                distances[wy][wx] = distances[vy][vx] + 1

                if (wy, wx) == g:
                    return distances[wy][wx]

                visited[wy][wx] = True
                todo.append((wy, wx))

    raise 'Not found'


R, C = map(int, input().split())
sy, sx = map(lambda n: n - 1, map(int, input().split()))
gy, gx = map(lambda n: n - 1, map(int, input().split()))

maze = []

for _ in range(R):
    maze.append(list(input()))

print(search(R, C, (sy, sx), (gy, gx), maze))

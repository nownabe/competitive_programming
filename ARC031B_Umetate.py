# https://atcoder.jp/contests/arc031/tasks/arc031_2


DIRECTIONS = [(-1, 0), (1, 0), (0, -1), (0, 1)]


def count_island(island_map):
    visited = [[False] * 10 for _ in range(10)]
    count = 0

    for i in range(10):
        for j in range(10):
            if visited[i][j] or island_map[i][j] == 'x':
                continue

            visited[i][j] = True
            todo = []
            todo.append((i, j))

            while len(todo) != 0:
                vx, vy = todo.pop()

                for dx, dy in DIRECTIONS:
                    wx = vx + dx
                    wy = vy + dy

                    if 0 <= wx < 10 and 0 <= wy < 10 and island_map[wx][wy] == 'o':
                        if visited[wx][wy]:
                            continue

                        visited[wx][wy] = True
                        todo.append((wx, wy))

            count += 1

    return count



def search(island_map):
    for i in range(10):
        for j in range(10):
            if island_map[i][j] == 'o':
                continue

            # umetate
            island_map[i][j] = 'o'

            # count
            count = count_island(island_map)
            if count == 1:
                return True

            # clean up
            island_map[i][j] = 'x'

    return False


island_map = []

for _ in range(10):
    island_map.append(list(input()))

if search(island_map):
    print('YES')
else:
    print('NO')


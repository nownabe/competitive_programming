# https://atcoder.jp/contests/atc001/tasks/dfs_a

# Input:
#   1 <= H <= 500
#   1 <= W <= 500
#   c_i,j = {s, g, ., #}

class DFS:
    def __init__(self, graph, w, h):
        self.graph = graph
        self.seen = [[False for _ in range(w)] for _ in range(h)]

    def search(self, v):
        vx, vy = v

        self.seen[vx][vy] = True

        for wx, wy in self.graph[vx][vy]:
            if self.seen[wx][wy]:
                continue
            self.search((wx, wy))

def search(graph, w, h, start, goal):
    seen = [[False for _ in range(w)] for _ in range(h)]
    todo = []

    seen[start[0]][start[1]] = True
    todo.append(start)

    while len(todo) != 0:
        vx, vy = todo.pop()

        for wx, wy in graph[vx][vy]:
            if seen[wx][wy]:
                continue

            seen[wx][wy] = True
            todo.append((wx, wy))

    return seen[goal[0]][goal[1]]


H, W = map(int, input().split())

c = []

for i in range(H):
    c.append(list(input()))

graph = [[set() for _ in range(W)] for _ in range(H)]
directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
start = None
goal = None

for i in range(H):
    for j in range(W):
        if c[i][j] == '#':
            continue
        elif c[i][j] == 's':
            start = (i, j)
        elif c[i][j] == 'g':
            goal = (i, j)

        for dx, dy in directions:
            next_node_x = i + dx
            next_node_y = j + dy

            if next_node_x < 0 or next_node_x >= H or next_node_y < 0 or next_node_y >= W:
                continue

            if c[next_node_x][next_node_y] != '#':
                graph[i][j].add((next_node_x, next_node_y))

# dfs = DFS(graph, W, H)
# dfs.search(start)
# if dfs.seen[goal[0]][goal[1]]:
#     print('Yes')
# else:
#     print('No')

if search(graph, W, H, start, goal):
    print('Yes')
else:
    print('No')

H, W = map(int, input().split())

table = []

for _ in range(H):
    table.append(list(input()))

cell = None

for i in range(1, H - 1):
    if cell is not None:
        break
    for j in range(1, W - 1):
        if table[i][j] == '#':
            cell = (i, j)
            break

directions = [(0, 1), (1, 1), (1, 0), (1, -1), (0, -1), (-1, -1), (-1, 0), (-1, 1)]

direction = None

for d in range(len(directions)):
    if table[cell[0] + directions[d][0]][cell[1] + directions[d][1]] == '#':
        direction = d
        break

start_cell = cell
start_direction = direction

#print(f'start_cell: {start_cell}')
#print(f'start_direction: {start_direction} = {directions[start_direction]}')

direction_changes = 0

while True:
    if direction is None:
        direction_changes = 1
        break

    next_cell = (cell[0] + directions[direction][0], cell[1] + directions[direction][1])

    #print(f'next_cell: {next_cell} = {table[next_cell[0]][next_cell[1]]}')

    if next_cell == start_cell:
        if direction != start_direction:
            direction_changes += 1
        break

    if table[next_cell[0]][next_cell[1]] == '#':
        cell = next_cell
        continue

    # search next direction
    next_d = None

    for i in range(len(directions)):
        next_d = (d + i + 1) % len(directions)

        if directions[next_d][0] * -1 == direction and directions[next_d][1] * -1 == direction:
            continue



        #print(direction, next_d)

        candidate_cell = (cell[0] + directions[next_d][0], cell[1] + directions[next_d][1])

        if table[candidate_cell[0]][candidate_cell[1]] == '#':
            if not (table[candidate_cell[0] - 1][candidate_cell[1]] == '#' and
                    table[candidate_cell[0]][candidate_cell[1] - 1] == '#' and
                    table[candidate_cell[0] + 1][candidate_cell[1]] == '#' and
                    table[candidate_cell[0]][candidate_cell[1] + 1] == '#'):
                direction_changes += 1
                break

    if next_d is None:
        if table[cell[0] + direction[0] * -1][cell[1] + direction[1] * -1] == '#':
            direction_changes = 2
        else:
            direction_changes = 1
        break

    direction = next_d

print(direction_changes)

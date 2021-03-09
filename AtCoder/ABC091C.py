# https://atcoder.jp/contests/abc091/tasks/arc092_a


def search(red_ys, red_points, blue_xs, blue_points):
    red_ys = sorted(red_ys, reverse=True)
    red_points = {y: sorted(red_points[y], reverse=True) for y in red_ys}
    blue_xs = sorted(blue_xs)
    blue_points = {x: sorted(blue_points[x]) for x in blue_xs}

    # print(red_ys)
    # print(red_points)
    # print(blue_xs)
    # print(blue_points)

    count = 0

    for blue_x in blue_xs:
        for blue_y in blue_points[blue_x]:
            # print(f'blue({blue_x}, {blue_y})')
            for red_y in red_ys:
                ok = False

                for red_x in red_points[red_y]:
                    # print(f'    red({red_x}, {red_y})')
                    if red_x < blue_x and red_y < blue_y:
                        # print(f'       ok')
                        count += 1
                        red_points[red_y].remove(red_x)
                        if len(red_points[red_y]) == 0:
                            red_ys.remove(red_y)
                        ok = True
                        break

                if ok:
                    break

    return count


def solve(red_points, blue_points):
    red_points = sorted(red_points, reverse=True, key=lambda p: p[1])
    blue_points = sorted(blue_points)

    count = 0

    for bx, by in blue_points:
        for i, (rx, ry) in enumerate(red_points):
            if rx < bx and ry < by:
                count += 1
                red_points = red_points[0:i] + red_points[i+1:]
                break

    return count


N = int(input())

# red_points = {}
# red_ys = []
# for _ in range(N):
#     x, y = map(int, input().split())
#     red_ys.append(y)
#     if y in red_points:
#         red_points[y].append(x)
#     else:
#         red_points[y] = [x]
#
# blue_points = {}
# blue_xs = []
# for _ in range(N):
#     c, d = map(int, input().split())
#     blue_xs.append(c)
#     if c in blue_points:
#         blue_points[c].append(d)
#     else:
#         blue_points[c] = [d]
#
# print(search(red_ys, red_points, blue_xs, blue_points))

red_points = []
blue_points = []

for _ in range(N):
    x, y = map(int, input().split())
    red_points.append((x, y))

for _ in range(N):
    x, y = map(int, input().split())
    blue_points.append((x, y))

print(solve(red_points, blue_points))




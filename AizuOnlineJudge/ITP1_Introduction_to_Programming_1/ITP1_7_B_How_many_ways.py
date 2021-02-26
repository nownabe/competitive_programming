# M integers:
#
# def count(n, x, total=0, start=1, nums=0):
#     if nums > 3:
#         return 0
#
#     if total == x and nums == 3:
#         return 1
#
#     if total + start > x:
#         return 0
#
#     max = (x - total) if x - total < n else n
#
#     counter = 0
#     for i in range(start, max + 1):
#         counter += count(n, x, total + i, i + 1, nums + 1)
#
#     return counter
#
#
# while True:
#     n, x = map(int, input().split())
#
#     if n == 0 and x == 0:
#         break
#
#     print(count(n, x))


# Three integers

while True:
    n, x = map(int, input().split())
    if n == 0 and x == 0:
        break

    count = 0
    for i in range(1, n + 1):
        for j in range(i + 1, n + 1):
            for k in range(j + 1, n + 1):
                if i + j + k == x:
                    count += 1

    print(count)


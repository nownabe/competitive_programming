while True:
    h, w = map(int, input().split())

    if h == 0 and w == 0:
        break

    print('#' * w)
    for _ in range(h-2):
        dots = '.' * (w - 2)
        print(f'#{dots}#')
    print('#' * w)

    print()

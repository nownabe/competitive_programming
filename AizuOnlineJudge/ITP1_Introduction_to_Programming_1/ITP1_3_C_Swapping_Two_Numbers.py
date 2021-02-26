while True:
    x, y = input().split()

    if int(x) == 0 and int(y) == 0:
        break

    if int(x) < int(y):
        print(f'{x} {y}')
    else:
        print(f'{y} {x}')

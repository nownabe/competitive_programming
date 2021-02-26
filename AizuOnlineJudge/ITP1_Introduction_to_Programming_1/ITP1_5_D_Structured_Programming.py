n = int(input())

i = 1
while i <= n:
    x = i

    if x % 3 == 0:
        print(f' {i}', end='')
    else:
        while True:
            if x % 10 == 3:
                print(f' {i}', end='')
                break

            x //= 10
            if x == 0:
                break

    i += 1

print()

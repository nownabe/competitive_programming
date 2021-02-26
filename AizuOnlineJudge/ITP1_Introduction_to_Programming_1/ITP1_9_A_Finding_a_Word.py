W = input()

T = []

while True:
    line = input()

    if line == 'END_OF_TEXT':
        break

    T += line.split(' ')

count = 0

for Ti in T:
    if Ti.lower() == W:
        count += 1

print(count)

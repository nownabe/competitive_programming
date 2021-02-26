line = input()

diff = ord('a') - ord('A')

output = []

for c in line:
    if 'a' <= c <= 'z':
        output.append(chr(ord(c) - diff))
    elif 'A' <= c <= 'Z':
        output.append(chr(ord(c) + diff))
    else:
        output.append(c)

print(''.join(output))


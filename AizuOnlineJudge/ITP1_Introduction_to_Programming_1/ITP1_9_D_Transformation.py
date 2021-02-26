s = input()
q = int(input())

for _ in range(q):
    command, *args = input().split()

    a = int(args[0])
    b = int(args[1]) + 1

    if command == 'print':
        print(s[a:b])
    elif command == 'reverse':
        s = s[:a] + s[a:b][::-1] + s[b:]
    elif command == 'replace':
        s = s[:a] + args[2] + s[b:]

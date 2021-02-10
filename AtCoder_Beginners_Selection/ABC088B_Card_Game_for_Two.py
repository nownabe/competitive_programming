input()
a = list(map(int, input().split()))

alice = 0
bob = 0

a.sort(reverse=True)

for i, ai in enumerate(a):
    if i & 0b1 == 0:
        alice += ai
    else:
        bob += ai

print(alice - bob)

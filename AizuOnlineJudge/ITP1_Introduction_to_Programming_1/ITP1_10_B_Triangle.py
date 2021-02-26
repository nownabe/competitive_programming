import math

a, b, C = map(int, input().split())

h = b * math.sin(math.radians(C))

# law of cosines
c = math.sqrt(a * a + b * b - 2 * a * b * math.cos(math.radians(C)))

print(a * h / 2)
print(a + b + c)
print(h)

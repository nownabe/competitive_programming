class Dice:
    def __init__(self, faces):
        self.faces = faces

    def roll(self, direction):
        if direction == 'N':
            self.faces = [
                self.faces[1],
                self.faces[5],
                self.faces[2],
                self.faces[3],
                self.faces[0],
                self.faces[4],
            ]
        elif direction == 'E':
            self.faces = [
                self.faces[3],
                self.faces[1],
                self.faces[0],
                self.faces[5],
                self.faces[4],
                self.faces[2],
            ]
        elif direction == 'S':
            self.faces = [
                self.faces[4],
                self.faces[0],
                self.faces[2],
                self.faces[3],
                self.faces[5],
                self.faces[1],
            ]
        elif direction == 'W':
            self.faces = [
                self.faces[2],
                self.faces[1],
                self.faces[5],
                self.faces[0],
                self.faces[4],
                self.faces[3],
            ]

    def __eq__(self, other):
        for i, n in enumerate(self.faces):
            if n != other.faces[i]:
                return False

        return True

    def top(self):
        return self.faces[0]

    def bottom(self):
        return self.faces[5]


def equal_dice(dice1, dice2):
    for d in (['N'] + ['E'] * 4) * 4:
        dice1.roll(d)
        if dice1.top() == dice2.top():
            break

    if dice1.bottom() != dice2.bottom():
        return False

    for d in ['N', 'E', 'S'] * 4:
        dice1.roll(d)
        if dice1 == dice2:
            return True

    return False

def all_different(faces):
    for i in range(len(faces)):
        for j in range(len(faces)):
            if i == j:
                continue

            if equal_dice(Dice(faces[i]), Dice(faces[j])):
                return False

    return True



n = int(input())
faces = []

for _ in range(n):
    faces.append(input().split())

if all_different(faces):
    print('Yes')
else:
    print('No')

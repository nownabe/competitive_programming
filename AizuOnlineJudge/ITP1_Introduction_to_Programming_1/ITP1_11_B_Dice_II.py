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
        elif direction == 'TR':
            self.faces = [
                self.faces[0],
                self.faces[2],
                self.faces[4],
                self.faces[1],
                self.faces[3],
                self.faces[5],
            ]

    def top(self):
        return self.faces[0]

    def front(self):
        return self.faces[1]

    def right(self):
        return self.faces[2]

faces = input().split()
dice = Dice(faces)

for _ in range(int(input())):
    top, front = input().split()

    for d in (['N'] * 4 + ['TR']) * 2:
        dice.roll(d)
        if dice.top() == top:
            break

    for d in ['TR'] * 4:
        dice.roll(d)
        if dice.front() == front:
            break

    print(dice.right())

    dice = Dice(faces)

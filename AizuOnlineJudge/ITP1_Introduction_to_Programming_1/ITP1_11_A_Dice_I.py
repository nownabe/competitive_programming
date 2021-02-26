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

faces = input().split()
dice = Dice(faces)

for d in input():
    dice.roll(d)

print(dice.faces[0])

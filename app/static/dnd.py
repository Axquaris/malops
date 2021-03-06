# Index = Level
xp_minimum = (0, 300, 900, 2700, 6500, 14000, 23000, 34000, 48000, 64000, 85000, 100000, 120000, 140000, 165000, 195000, 225000, 265000, 305000, 355000)
prof_bonus = (2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6)

types = ['Barbarian', 'Bard', 'Cleric', 'Druid', 'Fighter', 'Monk', 'Mystic', 'Paladin', 'Ranger', 'Rogue', 'Sorcerer', 'Warlock', 'Wizard']
hit_dice = [12, 8, 8, 8, 10, 8, 8, 10, 10, 8, 6, 8, 6]

def findlevel(xp):
    i = 0
    for n in xp_minimum:
        if xp < n:
            return i
    i += 1
    return 20
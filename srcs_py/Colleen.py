# Outside
s = """# Outside
s = {c}{c}{c}{s}{c}{c}{c}

if __name__ == '__main__':
    # Inside
    print(s.format(s = s, c = '"'))"""

if __name__ == '__main__':
    # Inside
    print(s.format(s = s, c = '"'))

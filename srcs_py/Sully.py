import os

i = 5
file_name = "Sully_" + str(i - 1) + ".py"
content = """import os

i = {d}
file_name = "Sully_" + str(i - 1) + ".py"
content = {c}{c}{c}{s}{c}{c}{c}

def Sully():
    fd = open(file_name, "w")
    print(content.format(s = content, c = '"', d = i - 1), file=fd)
    fd.close()
    if i > 1:
        os.system("python3 " + file_name)

Sully()"""

def Sully():
    fd = open(file_name, "w")
    print(content.format(s = content, c = '"', d = i - 1), file=fd)
    fd.close()
    if i > 1:
        os.system("python3 " + file_name)

Sully()

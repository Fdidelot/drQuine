# I'm a comment
def Content():
    return """# I'm a comment
def Content():
    return {c}{c}{c}{s}{c}{c}{c}

def File_name():
    return "Grace_kid.py"

def Grace():
    fd = open(File_name(), "w")
    print(Content().format(s = Content(), c = '"'), file=fd)

Grace()"""

def File_name():
    return "Grace_kid.py"

def Grace():
    fd = open(File_name(), "w")
    print(Content().format(s = Content(), c = '"'), file=fd)

Grace()

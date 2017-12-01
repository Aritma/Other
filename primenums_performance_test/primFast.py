
import sys

def prvocisla(max):
    array = []
    for x in range(max + 1):
        array.append(x)

    for x in array:
        if x > 1:
            pocet = max//x
            if pocet >= x:
                for i in range(x, pocet + 1):
                    pos = x * i
                    array[pos] = 0
        else:
            array[x] = 0
        if array[x] >= 1:
            print(array[x], end = ' ')

prvocisla(int(sys.argv[1]))
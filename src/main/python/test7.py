# [제약 사항]
#
# 1. 웨이퍼의 정보는 직사각형(정사각형 포함) 형태로 주어진다.
#
# 2. 세로길이 H 는 5 이상 10 이하이다. (5 ≤ H ≤ 10)
#
# 3. 가로길이 W 는 5 이상 25 이하이다. (5 ≤ W ≤ 25)
#
# 4. 칩으로 가공 가능한 영역은 0 으로, 가공 불가능한 영역은 1 로 주어진다.
#
#
#
#
#
# [입력]
#
# 입력의 가장 첫 줄에는 총 테스트 케이스의 개수 T가 주어진다.
#
# 그 다음 줄부터는 각 테스트 케이스가 주어지며 각 테스트 케이스의 첫째 줄에는 세로길이 H, 가로길이 W 가 주어진다.
#
# 다음 H 개의 줄에는 각 줄마다 W 개의 웨이퍼 정보가 주어진다. 0 은 가공 가능한 영역이고, 1 은 가공 불가능한 영역이다.
#
#

# 5
# 8 7
# 0 0 0 1 0 0 0
# 0 0 0 0 0 0 0
# 0 0 0 0 0 0 0
# 0 1 0 0 1 0 0
# 0 1 0 0 0 0 0
# 0 0 0 0 0 0 0
# 0 0 1 0 0 0 0
# 0 0 0 0 0 0 0

# 8 8
# 0 0 0 0 1 0 0 0
# 0 0 0 0 0 0 0 0
# 0 1 1 0 0 0 0 0
# 0 0 0 0 0 0 0 0
# 0 0 0 0 0 0 0 0
# 0 0 0 0 0 1 0 0
# 0 1 0 0 0 1 0 0
# 0 1 0 0 0 0 0 1
#
# Sample Output
# #1 9
# #2 10
# #3 0
# #4 18
# #5 12

amap = []

h, w = map(int, input().split())
for h1 in range(h):
    arow = input().split()
    aintrow = [int(x) for x in arow]
    amap.append(aintrow)
    # for w1 in range(w):


def regionAbler(map, y, x):
    try:
        if map[y][x] == 0 and map[y][x + 1] == 0 and map[y + 1][x] == 0 and map[y + 1][x + 1] == 0:
            return True
        else:
            return False
    except:
        return False


def abler(amap, y, x):
    ability = [0] * 4
    if regionAbler(amap, y + 0, x + 2):
        ability[0] = 1
    if regionAbler(amap, y + 1, x + 2):
        ability[1] = 1
    if regionAbler(amap, y + 0, x + 3):
        ability[2] = 1
    if regionAbler(amap, y + 1, x + 3):
        ability[3] = 1
    return ability


def mapset(amap, y, x, switch):
    if switch:
        amap[y][x] = 1
        amap[y][x + 1] = 1
        amap[y + 1][x] = 1
        amap[y + 1][x + 1] = 1
    else:
        amap[y][x] = 0
        amap[y][x + 1] = 0
        amap[y + 1][x] = 0
        amap[y + 1][x + 1] = 0


global maxCounter
maxCounter = -1

getMemos = [[-1 for _ in range(1 << w)] for _ in range(h)]
visitMap = [[False for _ in range(w)] for _ in range(h)]

memoic = 0
carving = 0


def greedyDFS(counter, amap, y, x):
    global maxCounter
    global memoic
    global carving

    if visitMap[y][x]:
        return counter

    hh = len(amap)
    ww = len(amap[0])

    if x == ww - 1:  # check memoization
        cum = 0
        for xxx in range(ww):
            if amap[y][xxx] == 1:
                cum += 1 << xxx

        if getMemos[y][cum] >= counter:
            # memoic = memoic + 1
            # print(f"memoic : {memoic} {y}, {bin(cum)}, {getMemos[y][cum]} >= {counter}")
            return -1
        else:
            # carving = carving + 1
            # print(f"carving : {carving} {y}, {bin(cum)}, {getMemos[y][cum]} < {counter}")
            getMemos[y][cum] = counter

    regionChange = regionAbler(amap, y, x)

    if regionChange:
        mapset(amap, y, x, True)
        counter = counter + 1

    else:
        return counter

    visitMap[y][x] = True

    result = abler(amap, y, x)

    if result[0]:
        if greedyDFS(counter, amap, y, x + 2) == -1:
            if regionChange: mapset(amap, y, x, False); visitMap[y][x] = False
            return -1
    if result[1]:
        if greedyDFS(counter, amap, y, x + 3) == -1:
            if regionChange: mapset(amap, y, x, False); visitMap[y][x] = False
            return -1
    if result[2]:
        if greedyDFS(counter, amap, y + 1, x + 2) == -1:
            if regionChange: mapset(amap, y, x, False); visitMap[y][x] = False
            return -1
    if result[3]:
        if greedyDFS(counter, amap, y + 1, x + 3) == -1:
            if regionChange: mapset(amap, y, x, False); visitMap[y][x] = False
            return -1

    # if result == [0, 0, 0, 0]:

    for xs in range(x, ww):
        if regionAbler(amap, y, xs):
            if greedyDFS(counter, amap, y, xs) == -1:
                if regionChange: mapset(amap, y, x, False); visitMap[y][x] = False
                return -1

        if regionAbler(amap, y + 1, xs):
            if greedyDFS(counter, amap, y + 1, xs) == -1:
                if regionChange: mapset(amap, y, x, False); visitMap[y][x] = False
                return -1

        if regionAbler(amap, y, xs + 1):
            if greedyDFS(counter, amap, y, xs + 1) == -1:
                if regionChange: mapset(amap, y, x, False); visitMap[y][x] = False
                return -1

        if regionAbler(amap, y + 1, xs + 1):
            if greedyDFS(counter, amap, y + 1, xs + 1) == -1:
                if regionChange: mapset(amap, y, x, False); visitMap[y][x] = False
                return -1

    for ys in range(y + 1, hh):
        for xs in range(0, ww):
            if regionAbler(amap, ys, xs):
                if greedyDFS(counter, amap, ys, xs) == -1:
                    if regionChange: mapset(amap, y, x, False); visitMap[y][x] = False
                    return -1

            if regionAbler(amap, ys + 1, xs):
                if greedyDFS(counter, amap, ys + 1, xs) == -1:
                    if regionChange: mapset(amap, y, x, False); visitMap[y][x] = False
                    return -1

            if regionAbler(amap, ys, xs + 1):
                if greedyDFS(counter, amap, ys, xs + 1) == -1:
                    if regionChange: mapset(amap, y, x, False); visitMap[y][x] = False
                    return -1

            if regionAbler(amap, ys + 1, xs + 1):
                if greedyDFS(counter, amap, ys + 1, xs + 1) == -1:
                    if regionChange: mapset(amap, y, x, False); visitMap[y][x] = False
                    return -1

    if (maxCounter < counter):
        maxCounter = counter
    # print(counter)

    if regionChange: mapset(amap, y, x, False)

    visitMap[y][x] = False
    return counter


for y0 in range(h):
    for x0 in range(w):
        greedyDFS(0, amap, y0, x0)

print(maxCounter)

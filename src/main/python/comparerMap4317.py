import random
from random import randrange

# 세로길이(5 ≤ H ≤ 10)
# 가로길이(5 ≤ W ≤ 25)

# 10 14
# 0 1 1 0 0 0 0 1 0 0 1 0 0 1
# 1 1 0 0 0 1 0 1 1 1 0 0 0 0
# 0 0 0 0 1 1 0 0 0 0 0 0 0 0
# 1 0 1 1 0 0 0 0 1 0 1 1 0 1
# 0 0 0 0 0 0 0 0 1 0 0 0 0 0
# 0 1 1 0 0 0 0 1 1 0 0 1 0 0
# 0 1 0 1 0 1 0 1 0 0 0 0 0 0
# 0 1 0 1 0 1 1 0 1 0 0 0 1 0
# 0 0 0 0 1 0 0 1 0 1 0 0 1 0
# 1 0 0 1 0 0 0 0 0 0 0 0 0 0


global maxer
global memo


def availabler(r, c):
    global H, W, smap
    if 1 <= r < H and 1 <= c < W:
        if smap[r][c] == 0 and smap[r - 1][c] == 0 and smap[r][c - 1] == 0 and smap[r - 1][c - 1] == 0:
            return True
        else:
            return False
    else:
        return False


def setMark(r, c, option):
    global H, W, smap
    if 1 <= r < H and 1 <= c < W:
        if option:
            if smap[r][c] == 0 and smap[r - 1][c] == 0 and smap[r][c - 1] == 0 and smap[r - 1][c - 1] == 0:
                smap[r][c] = 1
                smap[r - 1][c] = 1
                smap[r][c - 1] = 1
                smap[r - 1][c - 1] = 1
        else:
            if smap[r][c] == 1 and smap[r - 1][c] == 1 and smap[r][c - 1] == 1 and smap[r - 1][c - 1] == 1:
                smap[r][c] = 0
                smap[r - 1][c] = 0
                smap[r][c - 1] = 0
                smap[r - 1][c - 1] = 0


def merger(aList):
    returnable = ""
    for i in aList:
        returnable = returnable + f"{i}"
    return returnable


def bintodec(num):
    sum = 0
    for i in range(len(num)-1, -1, -1):
        if num[i] == "1":
            sum += (2 ** (len(num)-(i+1)))
    return sum


def dfser(sr, sc, value):
    global smap
    global getMax
    global H, W
    # global visitMap
    # if visitMap[sr][sc] == -1 : visitMap[sr][sc] = 1
    if (sr == H - 1 and sc == W - 1) or (sr == H - 1 and sc == W):
        if getMax < value: getMax = value
        return value

    tc = sc + 1
    tr = sr

    if tc == W:
        # st1. Memoization Pattern Matching
        lineInfo = merger(smap[tr])
        digitNum = bintodec(lineInfo)

        # print(lineInfo)
        # lineInfo = f"{tr}" + lineInfo
        # if memoiDic.get(lineInfo) is not None:
        #     if memoiDic.get(lineInfo) <= value:  # can keep going on this prc.
        #         memoiDic[lineInfo] = value
        #     else:
        #         return value
        # else:
        #     memoiDic[lineInfo] = value

        # print(f"{tr}/{lineInfo}")
        if memoiList[tr][digitNum] <= value:
            memoiList[tr][digitNum] = value
        else:
            return value

        # st2. Next Line searcher
        tc = 0
        tr = tr + 1

    # memoiChecker
    if availabler(tr, tc):
        setMark(tr, tc, True)  # set True
        dfser(tr, tc, value + 1)
        setMark(tr, tc, False)  # set False

    dfser(tr, tc, value)


################ 답


def dfsOther(x, y, cnt, idx):
    global ans
    ans = max(ans, cnt)
    if y >= W-1:
        return
    if x >= H-1:
        if dp[idx][y] >= cnt:
            return
        else:
            dp[idx][y] = cnt
        dfsOther(0, y + 1, cnt, 0)
        return
    if maps[x][y] == 0 and maps[x][y + 1] == 0 and maps[x + 1][y] == 0 and maps[x + 1][y + 1] == 0:
        maps[x][y] = maps[x + 1][y] = maps[x][y + 1] = maps[x + 1][y + 1] = 1
        dfsOther(x+2, y, cnt+1, (idx | 1 << x))
        maps[x][y] = maps[x+1][y] = maps[x][y+1] = maps[x+1][y+1] = 0
    dfsOther(x+1, y, cnt, idx)


def widthGen(width):
    randWidthGenerator = []
    for _ in range(width):
        valset = 0
        ranval = random.Random().random()
        if ranval > 0.1:
            valset = 0
        else:
            valset = 1
        randWidthGenerator.append(
            valset
            # randrange(0, 2, 1)
        )
    return randWidthGenerator


while True:

    # fixHeight = 10
    # fixWidth = 14
    #
    # fixHeightGen = [[0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1],
    #  [1, 1, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0],
    #  [0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0],
    #  [1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1],
    #  [0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
    #  [0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0],
    #  [0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0],
    #  [0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 0, 0, 1, 0],
    #  [0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0],
    #  [1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]

    randWidth = 10#randrange(5, 11, 1)
    randHeight = 25#randrange(5, 26, 1)
    # randHeight = randrange(5, 10, 1)
    randHeightGenerator = []
    for _ in range(randHeight):
        randHeightGenerator.append(widthGen(randWidth))

    R = randHeight
    C = randWidth
    H = randHeight
    W = randWidth


    getMax = 0
    wafer = randHeightGenerator  # [list(map(int, input().split())) for _ in range(R)]
    smap = wafer[:]
    # memo = [[-1 for _ in range(1 << C)] for _ in range(R)]

    # S = max(W, H) + 5
    # memoiList = [[0] * (2 ** (W)) for _ in range(H)]
    memoiList = [[-1] * (2 ** (W)) for _ in range(H)]

    dfser(0, -1, 0)

    maps = randHeightGenerator  # [list(map(int, input().split())) for _ in range(H)]
    ans = 0
    dp = [[-1] * W for _ in range(1 << H)]
    dfsOther(0, 0, 0, 0)

    print(f"{getMax} / {ans}")
    if not getMax == ans :
        # print(f"{getMax} / {ans}")
        print(f"{R} {C} ")
        for r in range(R):
            lineString = ""
            for c in range(C):
                lineString += f" {maps[r][c]}"
            print(f"{lineString}")

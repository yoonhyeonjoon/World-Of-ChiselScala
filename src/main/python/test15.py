
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
    if option:
        smap[r][c] = 1
        smap[r - 1][c] = 1
        smap[r][c - 1] = 1
        smap[r - 1][c - 1] = 1
    else:
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
    for i in range(len(num) - 1, -1, -1):
        if num[i] == "1":
            sum += (2 ** (len(num) - (i + 1)))
    return sum

def dfser(sr, sc, value, idx):
    global smap
    global getMax
    global H, W
    # global visitMap
    # if visitMap[sr][sc] == -1 : visitMap[sr][sc] = 1


    if sr >= H - 1 and sc == W - 1:
        if getMax < value: getMax = value
        return value

    tc = sc  # + 1
    tr = sr + 1

    if tr == H or tr == H + 1:
        # st1. Memoization Pattern Matching

        # colLine = ""
        # for i in range(len(smap)):
        #     colLine += f"{smap[i][tc]}"
        #
        # lineInfo = merger(colLine)
        # digitNum = int(lineInfo, 2) #bintodec(lineInfo)

        if memoiList[idx][tc] <= value:
            memoiList[idx][tc] = value
        else:
            return value

        # st2. Next Line searcher
        tc = tc + 1
        tr = 0

    # memoiChecker
    if availabler(tr, tc):
        setMark(tr, tc, True)  # set True
        dfser(t r +1, tc, valu e +1, (idx | 1 << tr))
        setMark(tr, tc, False)  # set False

    dfser(tr, tc, value, idx)


TotalCase = int(input())

for ii in range(TotalCase):
    H, W = map(int, input().split())
    # visitMap = [[-1]*W for _ in range(H)]
    smap = []
    # memoiDic = {}
    # memoiList = [[0] * (2 ** W)] * H

    # S = max(W, H) + 5
    memoiList = [[-1] * W for _ in range(2 ** (H))]
    # memoiList = [[0] * (2 ** (S)) for _ in range(S)]
    # dp = [[-1] * W for _ in range(2 ** H)
    # memoiList = [[0] for _ in range(2 ** W) for _ in range(H)]
    for i in range(H):
        smap.append(list(map(int, input().split())))

    getMax = 0

    dfser(0, -1, 0, 0)
    print(f"#{ii + 1} {getMax}")

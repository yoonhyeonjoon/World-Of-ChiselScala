# 1
# 6 4 5
# 0 1 2 3 4 7
# 1 2 3 4
# 5

# 1
# 3 1 4
# 1 6 5
# 1
# 0

# 1
# 5 3 10
# 8 7 1 2 6
# 2 4 3
# 981

# 1
# 7 3 6
# 1 8 0 2 6 7 9
# 2 1 4
# 91

def iter(cummulate, valset, cnt):
    if cnt == N:
        return
    newCumm = []
    for cl in cummulate:
        for vs in valset:
            if 0 <= int(f"{cl}{vs}") < 1000:
                newCumm.append(int(f"{cl}{vs}"))
                if not memoi[int(f"{cl}{vs}")] == -1 and memoi[int(f"{cl}{vs}")] < cnt + 1:
                    pass
                else:
                    memoi[int(f"{cl}{vs}")] = cnt + 1

    iter(newCumm, valset, cnt + 1)

def calcul(n, m, c):
    if c == 1:
        return n + m
    elif c == 2:
        return n - m
    elif c == 3:
        return n * m
    elif c == 4:
        if m == 0:
            return 0
        else:
            return int(n / m)



def iterer(target):
    global memoi
    memoiCopied = memoi[:]
    iCounter = 0
    for i in memoi:
        if not i == -1:
            jCounter = 0
            for j in memoi:
                if not j == -1:
                    for calop in oper:
                        caled = calcul(iCounter, jCounter, calop)
                        if 0 <= caled < 1000:
                            res = memoi[iCounter] + memoi[jCounter] + 1
                            if (memoiCopied[caled] == -1 or memoiCopied[caled] > res) and M > res:
                                memoiCopied[caled] = res
                jCounter = jCounter + 1
        iCounter = iCounter + 1
    memoi = memoiCopied

    if not memoi[target] == -1:
        return True
    else:
        return False


T = int(input())

for t in range(1, 1+T):

    N, O, M = map(int, input().split())
    val = list(map(int, input().split()))
    oper = list(map(int, input().split()))
    Target = int(input())

    memoi = [-1 for _ in range(1000)]
    for vs in val:
        memoi[int(f"{vs}")] = 1

    iter(val, val, 1)

    result = -1

    if not memoi[Target] == -1: result = memoi[Target]
    iterNum = int((M - 2) / 2)
    for k in range(iterNum):
        iterer(Target)
        if len(str(memoi[Target])) == memoi[Target]:
            result = memoi[Target]
        elif len(str(memoi[Target])) < memoi[Target]:
            if result > memoi[Target] + 1 or result == -1:
                result = memoi[Target] + 1

    print(f"#{t} {result}")

# from termcolor import colored
# globalCounter = 0

xLambda = lambda x: 2 if x > 2 else 1 if x == 1 or x == 2 else 0


def yLambdas(yList): return list(map(xLambda, yList))


yLambda = lambda yList: yLambdas(yList)


def transMatrix(amatrix): return list(map(yLambda, amatrix))


def nextPositionFinder(cr, cc, nextDir):
    if nextDir == 'U':
        return [cr - 1, cc, 'U']
    elif nextDir == 'D':
        return [cr + 1, cc, 'D']
    elif nextDir == 'L':
        return [cr, cc - 1, 'L']
    elif nextDir == 'R':
        return [cr, cc + 1, 'R']


# def visualizer():
#     for aline in matrixDir:
#         trans = ""
#         for adir in aline:
#             if adir == "L" or adir == "R" or adir == "U" or adir == "D":
#                 # trans += f" {colored(adir, 'red')}"
#                 print(f" {colored(adir, 'red')}", end="", flush=True)
#             else:
#                 print(f" {adir}", end="", flush=True)
#
#         print("")
#         # print(colored(aline, 'red'))


def stateTransitor(privDir, pipeOption):
    stateResult = []
    if privDir == 'L':
        if pipeOption == 1:
            stateResult.append('R')
        elif pipeOption == 2:
            stateResult.append('U'), stateResult.append('D')
    elif privDir == 'R':
        if pipeOption == 1:
            stateResult.append('L')
        elif pipeOption == 2:
            stateResult.append('U'), stateResult.append('D')
    elif privDir == 'U':
        if pipeOption == 1:
            stateResult.append('D')
        elif pipeOption == 2:
            stateResult.append('L'), stateResult.append('R')
    elif privDir == 'D':
        if pipeOption == 1:
            stateResult.append('U')
        elif pipeOption == 2:
            stateResult.append('L'), stateResult.append('R')
    return stateResult


def flipped(port):
    if port == 'L':
        return 'R'
    elif port == 'R':
        return 'L'
    elif port == 'U':
        return 'D'
    elif port == 'D':
        return 'U'
    else:
        return 'N'


def dfsRear(pr, pc, cr, cc, chained):
    # global globalCounter
    global matrix, matrixDir #, memoi
    global getMinimizier

    if cr == 0 and cc == 0 and pr == 0 and pc == 1:
        if matrix[cr][cc] == 1:
            if len(chained) + 1 < getMinimizier:
                getMinimizier = len(chained) + 2

    elif cr == 0 and cc == 0 and pr == 1 and pc == 0:
        if matrix[cr][cc] == 2:
            if len(chained) + 1 < getMinimizier:
                getMinimizier = len(chained) + 2

    nextStatelist = stateTransitor(flipped(matrixDir[pr][pc]), matrix[cr][cc])

    nextPosition = []
    for aNextState in nextStatelist:
        candiNext = nextPositionFinder(cr, cc, aNextState)
        if 0 <= candiNext[0] < n and 0 <= candiNext[1] < n:
            nextPosition.append(candiNext)

    if not nextPosition == []:
        # for aMemoi in memoi[nr][nc]:
        #     if not (cr, cc) in aMemoi:
        for aNextPosition in nextPosition:

            nr = aNextPosition[0]
            nc = aNextPosition[1]
            tempDir = matrixDir[nr][nc]
            if tempDir == 'N':
                # memoi[cr][cc].append(chained + [(nr, nc)])
                # print(f"current : ({cr}, {cc}) : {chained + [(nr, nc)]} / initial")
                # globalCounter = globalCounter + 1
                # print(colored(f"point : #{globalCounter}", 'blue') )
                matrixDir[cr][cc] = aNextPosition[2]
                # visualizer()
                dfsRear(cr, cc, nr, nc, chained + [(nr, nc)])
                # print(f"call back {cr} {cc}")
                # globalCounter = globalCounter + 1
                # print(colored(f"point : #{globalCounter}", 'blue') )
                matrixDir[cr][cc] = tempDir
                # visualizer()


tc = int(input())

matrixDir = [['N'] * 50 for _ in range(50)]  # priv, next + visitmap
# memoi = [[[] for _ in range(50)] for _ in range(50)]


def matrixReset():
    for y in range(len(matrixDir)):
        matrixDir[y] = ['N'] * 50


# def memoiReset():
#     for y in range(len(memoi)):
#         for x in range(len(memoi[y])):
#             memoi[y][x] = []


for ii in range(tc):
    n = int(input())
    matrix = [list(map(int, input().split())) for _ in range(n)]
    matrixReset()
    # memoiReset()
    # memoi[n - 1][n - 2].append([(n - 1, n - 1)])
    matrix = transMatrix(matrix)
    getMinimizier = 999999999

    if matrix[n - 1][n - 1] == 1:
        matrixDir[n - 1][n - 1] = "L"
        dfsRear(n - 1, n - 1, n - 1, n - 2, [])
    if matrix[n - 1][n - 1] == 2:
        matrixDir[n - 1][n - 1] = "U"
        dfsRear(n - 1, n - 1, n - 2, n - 1, [])

    print(f"#{ii + 1} {getMinimizier}")

# 5
# 5
# 1 4 3 1 4
# 0 6 4 0 2
# 0 0 2 0 2
# 0 0 6 3 5
# 0 0 0 6 1
# 5
# 1 2 3 0 0
# 0 5 6 4 3
# 3 6 5 4 3
# 2 4 3 2 5
# 5 2 5 3 6
# 10
# 1 1 1 2 2 1 2 2 2 6
# 3 1 1 1 1 1 1 1 2 4
# 6 1 2 2 1 2 2 1 2 6
# 6 1 2 1 2 1 2 1 1 4
# 4 1 1 2 1 1 2 1 1 5
# 3 1 2 2 1 1 1 1 1 6
# 4 2 1 2 2 2 2 2 2 4
# 3 2 1 2 1 2 2 2 1 6
# 1 0 0 5 3 3 0 1 0 2
# 3 2 2 2 1 1 1 1 1 1
# 10
# 1 4 4 2 2 3 6 1 4 1
# 0 2 5 4 4 6 3 3 5 3
# 5 6 3 6 4 1 3 3 4 2
# 1 2 1 4 2 1 5 6 6 0
# 3 2 5 6 4 0 6 1 4 6
# 0 3 2 0 6 3 5 3 0 2
# 0 1 0 0 0 6 3 0 5 2
# 0 4 5 2 3 1 2 2 2 4
# 0 2 5 0 2 6 1 6 3 3
# 0 0 4 0 5 6 0 5 4 6
# 15
# 1 3 6 2 2 6 6 0 1 0 0 3 0 5 0
# 0 4 4 0 5 4 0 0 0 3 0 3 0 0 3
# 6 0 0 2 2 2 4 0 0 0 0 0 0 0 0
# 0 6 1 3 6 5 0 6 0 2 0 0 0 3 1
# 4 6 2 2 0 3 4 0 0 0 4 2 0 0 0
# 0 5 0 2 3 6 0 0 2 0 3 6 0 4 0
# 0 0 0 1 0 0 4 0 0 1 5 2 0 1 0
# 5 1 1 4 5 4 6 3 0 2 0 0 2 4 1
# 1 0 0 0 4 0 5 3 0 0 5 1 3 5 4
# 1 0 5 3 0 0 5 4 5 5 0 0 0 1 1
# 6 5 6 0 0 0 0 2 4 0 6 2 5 2 1
# 5 5 0 1 0 0 0 0 0 0 0 5 3 6 2
# 1 5 1 4 3 3 4 1 0 6 1 4 6 5 2
# 6 3 0 5 3 1 5 3 3 3 4 4 1 4 2
# 5 0 6 0 5 5 3 4 4 6 0 1 6 4 6


import random


# 3
# 9424 4426 8852
# 8583 8084 5696
# 9383 9480 8665

while (True):
    N = 3  # random.randrange(0, 4, 1)
    partBlock =[]
    fullBlock = []
    ap = 0
    bp = 0
    cp = 0
    for i in range(N):
        ap = random.randrange(0, 10001, 1)
        bp = random.randrange(0, 10001, 1)
        cp = random.randrange(0, 10001, 1)
        partBlock.append([ap, bp, cp, i])
        fullBlock.append([ap, bp, cp, i])
        fullBlock.append([bp, cp, ap, i])
        fullBlock.append([cp, ap, bp, i])

    block = int(input())
    fullBlock = []
    for i in range(block):
        a, b, c = map(int, input().split())
        fullBlock.append([a, b, c, i])
        fullBlock.append([b, c, a, i])
        fullBlock.append([c, a, b, i])

    blockSorted = sorted(fullBlock, key=lambda x: x[0] * x[1])

    memoi = [[-1, 0] for _ in range(len(fullBlock))]


    def comparer(standardIndex, targetIndex):
        ss = blockSorted[standardIndex]
        st = blockSorted[targetIndex]
        if (ss[0] >= st[0] and ss[1] >= st[1]) or (ss[0] >= st[1] and ss[1] >= st[0]):
            return True
        else:
            return False


    def binaryMaker(given):
        returnable = []
        returnableIndexes = []
        for i in range(len(given) - 1, -1, -1):
            returnable.append(int(given[i]))

        for i in range(len(returnable)):
            if returnable[i] == 1:
                returnableIndexes.append(i)

        return returnableIndexes


    def memoiParser(memoiIndex):
        if memoiIndex >= 0:
            getIndex = binaryMaker(bin(memoiIndex).split('b')[1])
        else:
            getIndex = -1
        return getIndex


    def searcher(standardIndexFromSorted):
        global blockSorted

        standardBlock = blockSorted[standardIndexFromSorted]
        standardIndex = standardBlock[3]
        standardHeight = standardBlock[2]

        candidateHeight = standardHeight
        candidateIndexSet = 1 << standardIndexFromSorted
        for targetIndex in range(standardIndexFromSorted, -1, -1):

            candidateIndexSetTemporated = 1 << standardIndexFromSorted
            targetBlock = memoi[targetIndex]
            targetIndexes = targetBlock[0]

            ss = blockSorted[standardIndex][3]
            st = blockSorted[targetIndex][3]
            if comparer(standardIndexFromSorted, targetIndex) and ss != st:

                targetIndexesParsed = memoiParser(targetIndexes)
                candidateIndexSetTempor = targetIndexes + candidateIndexSetTemporated
                alreadyHeight = 0
                if targetIndexesParsed != -1:
                    for i in range(len(targetIndexesParsed)):
                        if blockSorted[targetIndexesParsed[i]][3] == standardIndex:
                            alreadyHeight = blockSorted[targetIndexesParsed[i]][2]
                            candidateIndexSetTempor -= (1 << targetIndexesParsed[i])
                            break

                candiateNewHeight = standardHeight - alreadyHeight + targetBlock[1]

                if candidateHeight < candiateNewHeight:
                    candidateHeight = candiateNewHeight
                    candidateIndexSetTemporated = candidateIndexSetTempor
                    candidateIndexSet = candidateIndexSetTemporated

        memoi[standardIndexFromSorted] = [candidateIndexSet, candidateHeight]

    for i in range(len(fullBlock)):
        memoi[i] = [1 << i, blockSorted[i][2]]

    for i in range(len(fullBlock)):
        searcher(i)

    maxerChecker = 0
    for i in range(len(memoi)):
        if maxerChecker < memoi[i][1]: maxerChecker = memoi[i][1]

    # N = int(input())
    box = fullBlock
    arr = []
    # for i in range(N):
    #     temp = list(map(int, input().split()))
    #     box.append([temp[0], temp[1], temp[2], i])
    #     box.append([temp[1], temp[2], temp[0], i])
    #     box.append([temp[2], temp[0], temp[1], i])
    box = sorted(box, key=lambda x: x[0] * x[1])
    ans = 0
    dp = []
    dp_list = [[box[i][3]] for i in range(N * 3)]
    for b in box:
        dp.append(b[2])
    for i in range(N * 3):
        for j in range(i, -1, -1):
            if (box[i][0] >= box[j][0] and box[i][1] >= box[j][1]) or (
                    box[i][0] >= box[j][1] and box[i][1] >= box[j][0]):
                if box[i][3] in dp_list[j]: continue
                if dp[j] + box[i][2] > dp[i]:
                    dp[i] = dp[j] + box[i][2]
                    dp_list[i] = dp_list[j] + [box[i][3]]

    trueMax = max(dp)

    if not trueMax == maxerChecker :
        cum = f'{trueMax} / {maxerChecker} :::: {N} :'
        for aBlock in partBlock :
            cum += f" {aBlock[0]} {aBlock[1]} {aBlock[2]} // "
        print(cum)

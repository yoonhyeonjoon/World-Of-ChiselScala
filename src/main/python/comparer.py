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
from random import randrange

while(True) :
    operator = [randrange(0, 2, 1), randrange(0, 2, 1), randrange(0, 2, 1), randrange(0, 2, 1)]
    roperator = []
    for ii in range(len(operator)):
        if operator[ii] == 1:
            roperator.append(ii + 1)

    number = [randrange(0, 2, 1) for _ in range(10)]
    rnumber = []
    for ii in range(len(number)):
        if number[ii] == 1:
            rnumber.append(ii)

    limitNum = randrange(4, 21, 1)

    targetNum = randrange(0, 1000, 1)

    N = sum(number)
    O = sum(operator)
    M = limitNum
    val = rnumber
    oper = roperator
    Target = targetNum


    # N, O, M = map(int, input().split())
    # val = list(map(int, input().split()))
    # oper = list(map(int, input().split()))
    # Target = int(input())

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


    # N, O, M = map(int, input().split())
    # val = list(map(int, input().split()))
    # oper = list(map(int, input().split()))
    # Target = int(input())

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

    # print(f"{result}")


    ######## True set


    def operation(num1, num2, oper):
        if oper == 1:
            result = num1 + num2
        elif oper == 2:
            result = num1 - num2
        elif oper == 3:
            result = num1 * num2
        elif oper == 4:
            if num2 == 0:
                result = -1
            else:
                result = num1 // num2
        if result < 0 or result > 999:
            result = -1
        return result


    def make_nums(length, x):
        if length == 3:
            return
        else:
            for num in num_lists:
                new_num = 10 * x + num
                if visited[new_num] <= length + 1:
                    continue
                visited[new_num] = length + 1
                total_nums.append(new_num)
                queue.append(new_num)
                make_nums(length + 1, new_num)


    #
    # N = sum(number)
    # O = sum(operator)
    M = limitNum
    # val = rnumber
    # oper = operator
    # Target = targetNum

    # N,O,M = map(int, input().split())
    maximum = M + 1
    visited = [maximum] * 1001
    # num_lists = [int(i) for i in input().split()]
    # oper_lists = [int(i) for i in input().split()]
    # W = int(input())
    num_lists = rnumber
    oper_lists = roperator
    W = targetNum

    total_nums = []
    queue = []
    make_nums(0, 0)

    result2 = -1

    if visited[W] < maximum:
        # print(f'{visited[W]}')
        result2 = visited[W]
    else:
        # 연산을 해야하는 경우
        while queue:
            number = queue.pop(0)
            for x in total_nums:
                total_click = len(str(x)) + visited[number] + 1
                if total_click + 1 > M:
                    continue
                for oper in oper_lists:
                    new_number = operation(number, x, oper)
                    if new_number == -1:
                        continue
                    if visited[new_number] < total_click + 1:  # 나중에 = 도 눌러줄거라서
                        continue
                    visited[new_number] = total_click
                    queue.append(new_number)
        if visited[W] < maximum:
            # print(f'{visited[W] + 1}')
            result2 = visited[W] + 1
        else:
            # print(f'-1')
            result2 = -1


    if not result == result2 :
        print(f"{N} {O} {M} {rnumber} {roperator} {targetNum} / result1 : {result} / result2 : {result2}")
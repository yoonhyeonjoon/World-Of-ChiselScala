global size
global returnable
global dictionarylist


# 1
# 4
# 9 9
# 17 6
# 18 9
# 21 8

def deep_copy(source_list):
    dest_list = source_list[:]
    return dest_list


def stateUpdator(current, tsn, ln):
    # s,e,d, l
    # current : sedl
    if current[1] == 0:
        ten = tsn + ln
        dn = 0
    else:
        if current[1] > tsn:
            ten = current[1] + ln
            dn = ten - tsn
        else:
            ten = tsn + ln
            dn = 0
    return [tsn, ten, dn, ln]


global counter


# counter = 0
def isTargetItem(targetStates, cpuStates):
    global counter
    result = False
    target = sorted(targetStates[1])
    dictionaries = sorted(cpuStates)
    for aStates in dictionaries:
        if target == aStates[1] and targetStates[0] == aStates[0]:
            # counter = counter + 1
            # print(counter)
            result = True
            break
    return result


def distributor(tasks, number, cpus):
    global returnable

    if number == size:
        returnable = len(cpus)

    else:
        task = tasks[number]
        index = 0

        if isTargetItem([number, cpus], dictionarylist):
            return
        else:
            for cpu in cpus:
                newCpuState = stateUpdator(cpu, task[0], task[1])

                dictionarylist.append([number, cpus])
                if newCpuState[2] <= 10:
                    newCpus = deep_copy(cpus)
                    newCpus[index] = newCpuState
                    distributor(tasks, number + 1, newCpus)
                    # dictionarylist.remove(aPage)

                index = index + 1


T = int(input())

# while(True) :
#     gen = randrange(4, 5, 1)
#     obj = []
#     for i in range(gen):
#         obj.append([randrange(1, 50, 1), randrange(1, 10, 1)])
#
#     obj = sorted(obj)
#     for i in range(len(obj)):
#         print(obj[i])

# 1
# 4
# 11 5
# 13 6
# 16 6
# 16 8

for test_case in range(T + 1):
    tl = int(input())
    inputList = []
    size = tl

    for ii in range(tl):
        b, c = map(int, input().split())
        inputList.append([b, c])

    # size = len(obj)
    # inputList = obj
    sortedSet = sorted(inputList, key=lambda x: x[0])
    returnable = 0

    cpus1 = [[0, 0, 0, 0]]
    cpus2 = [[0, 0, 0, 0], [0, 0, 0, 0]]
    cpus3 = [[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]
    cpus4 = [[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]
    cpus5 = [[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]

    dictionarylist = []
    distributor(sortedSet, 0, cpus1)
    print(1)
    if returnable == 0:
        dictionarylist = []
        distributor(sortedSet, 0, cpus2)
        print(2)
    if returnable == 0:
        dictionarylist = []
        distributor(sortedSet, 0, cpus3)
        print(3)
    if returnable == 0:
        dictionarylist = []
        distributor(sortedSet, 0, cpus4)
        print(4)
    if returnable == 0:
        dictionarylist = []
        distributor(sortedSet, 0, cpus5)
        print(5)
    if returnable == 0: returnable = -1

    print("#" + str(test_case) + " " + str(returnable))

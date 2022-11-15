from collections import deque

global size
global returnable
global dictionarylist

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

counter = 0


def isTargetItem(targetStates, cpuStates):

    result = False
    target = sorted(targetStates[1], key=lambda x : x[1])

    targetForm = []
    targetForm.append(targetStates[0])
    for at in target:
        targetForm.append(at[1])

    if tuple(targetForm) in cpuStates:
        result = True
    return result


def distributor(tasks, number, cpus):
    global returnable
    global counter

    counter = counter + 1
    print(counter)

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

                sortedCpus = sorted(cpus, key= lambda x : x[1])

                deq = deque(sortedCpus)

                for _ in range(len(deq)):
                    forDict = [number]
                    deq.rotate(1)
                    for cpu in deq:
                        forDict.append(cpu[1])
                    dictionarylist[tuple(forDict)] = 1

                if newCpuState[2] <= 10:
                    tmpor = cpus[index]
                    cpus[index] = newCpuState
                    distributor(tasks, number + 1, cpus)

                    if returnable == len(cpus) :
                        break

                    cpus[index] = tmpor

                index = index + 1


T = int(input())

for test_case in range(T):
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

    dictionarylist = dict()
    distributor(sortedSet, 0, cpus1)
    print(1)
    if returnable == 0:
        dictionarylist = dict()
        distributor(sortedSet, 0, cpus2)
        print(2)
    if returnable == 0:
        dictionarylist = dict()
        distributor(sortedSet, 0, cpus3)
        print(3)
    if returnable == 0:
        dictionarylist = dict()
        distributor(sortedSet, 0, cpus4)
        print(4)
    if returnable == 0:
        dictionarylist = dict()
        distributor(sortedSet, 0, cpus5)
        print(5)
    if returnable == 0: returnable = -1

    print("#" + str(test_case) + " " + str(returnable))

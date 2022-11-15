# 1
# 4
# 11 5
# 13 6
# 16 6
# 16 8


# 1
# 4
# 11 5
# 13 6
# 16 6
# 16 8


def process(task, aStateEnd):
    delay = aStateEnd - task[0]
    if delay < 0: return task[0] + task[1]
    taskDuration = aStateEnd - task[0] + task[1]
    if taskDuration > 10:
        return -1
    elif taskDuration < 0:
        return task[0] + task[1]
    else:
        return aStateEnd + task[1]


def dfs(p, states):  # states = [e1, e2, e3, ..]
    global memoi
    states = sorted(states)
    # print(f"{p} : {len(memoi)} / {states}")
    if p == nums:
        return True

    if tuple([p] + states) in memoi:
        return False

    memoi.add(tuple([p] + states))  # memoization
    isAnyTrueResult = False

    for index in range(len(states)):
        result = process(tasks[p], states[index])
        if not result == -1:
            # memoi.add(tuple([p] + sorted(states)))  # memoization
            temporStates = states[:]
            states[index] = result
            temporResult = dfs(p + 1, states)
            if temporResult:
                isAnyTrueResult = True
                #print(isAnyTrueResult)
                return True

            states = temporStates
        else:
            return False

    return isAnyTrueResult


def runner(prosnum):
    global tasks
    global memoi
    memoi.clear()
    process = [0] * prosnum
    return dfs(0, process)


repeater = int(input())

global tasks
global memoi
for tr in range(repeater):

    nums = int(input())

    tasks = []
    memoi = set()

    for i in range(nums):
        t, l = map(int, input().split())
        tasks.append([t, l])

    finalResult = -1
    for i in range(1, 6):
        if runner(i):
            finalResult = i
            break

    print(f"#{tr+1} {finalResult}")



# nums = int(input())
#
# tasks = []
# memoi = set()
#
# for i in range(nums):
#     t, l = map(int, input().split())
#     tasks.append([t, l])
#
#
# def process(task, aStateEnd):
#     delay = aStateEnd - task[0]
#     if delay < 0 : return task[0] + task[1]
#     taskDuration = aStateEnd - task[0] + task[1]
#     if taskDuration > 10:
#         return -1
#     elif taskDuration < 0:
#         return task[0] + task[1]
#     else:
#         return aStateEnd + task[1]
#
#
# def dfs(p, states):  # states = [e1, e2, e3, ..]
#     global memoi
#     states = sorted(states)
#     # print(f"{p} : {len(memoi)} / {states}")
#     if p == nums:
#         return True
#
#     if tuple([p] + states) in memoi:
#         return False
#
#     memoi.add(tuple([p] + states))  # memoization
#     isAnyTrueResult = False
#
#     for index in range(len(states)):
#         result = process(tasks[p], states[index])
#         if not result == -1:
#             # memoi.add(tuple([p] + sorted(states)))  # memoization
#             temporStates = states[:]
#             states[index] = result
#             temporResult = dfs(p + 1, states)
#             if temporResult:
#                 isAnyTrueResult = True
#                 print(isAnyTrueResult)
#                 return True
#
#             states = temporStates
#         else:
#             return False
#
#     return isAnyTrueResult
#
#
# def run(prosnum):
#     global tasks
#     process = [0] * prosnum
#     result = dfs(0, process)
#
# # run(3)
# run(4)
# # run(5)
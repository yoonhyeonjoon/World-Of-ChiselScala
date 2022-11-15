
# 1
# 300
# 3 5
# 5 7
# 5 3
# 6 10
# 9 4
# 15 4
# 18 4
# 20 9
# 31 9
# 33 9
# 37 3
# 43 9
# 51 4
# 51 5
# 55 10
# 61 3
# 64 6
# 64 6
# 65 8
# 67 8
# 69 4
# 74 1
# 80 2
# 81 5
# 89 3
# 102 4
# 108 2
# 119 6
# 123 5
# 123 4
# 127 10
# 130 7
# 145 10
# 152 4
# 154 5
# 171 8
# 172 5
# 174 9
# 179 4
# 185 5
# 192 1
# 194 10
# 196 7
# 198 3
# 205 9
# 205 3
# 206 7
# 208 4
# 212 5
# 214 7
# 214 7
# 215 8
# 221 2
# 222 1
# 229 7
# 230 6
# 231 8
# 232 5
# 232 1
# 233 9
# 234 1
# 236 4
# 247 9
# 250 9
# 252 2
# 257 4
# 259 1
# 261 5
# 263 3
# 263 7
# 266 2
# 269 9
# 272 2
# 273 3
# 273 9
# 277 4
# 278 3
# 280 1
# 282 8
# 292 8
# 295 8
# 301 3
# 303 2
# 304 3
# 306 2
# 311 2
# 312 10
# 312 4
# 313 5
# 321 7
# 332 8
# 332 4
# 333 3
# 335 8
# 340 8
# 346 1
# 362 1
# 363 5
# 375 4
# 381 10
# 382 4
# 382 9
# 387 2
# 388 6
# 401 6
# 402 1
# 403 8
# 404 8
# 409 1
# 417 1
# 434 1
# 435 8
# 435 9
# 439 9
# 439 2
# 442 8
# 445 3
# 445 1
# 446 6
# 454 8
# 454 3
# 456 6
# 458 1
# 466 2
# 467 3
# 467 5
# 471 10
# 472 1
# 475 10
# 482 10
# 487 5
# 497 6
# 507 5
# 507 2
# 510 2
# 510 6
# 518 5
# 522 8
# 523 8
# 531 10
# 531 9
# 542 10
# 545 3
# 546 1
# 548 6
# 551 4
# 555 6
# 556 1
# 556 3
# 558 3
# 565 4
# 566 8
# 567 4
# 575 6
# 579 7
# 592 3
# 594 3
# 601 1
# 602 9
# 607 1
# 614 1
# 617 9
# 622 10
# 625 10
# 637 3
# 641 9
# 641 5
# 648 6
# 650 6
# 654 9
# 655 8
# 655 2
# 666 2
# 667 8
# 670 1
# 674 10
# 675 5
# 677 9
# 679 4
# 683 6
# 685 6
# 685 2
# 690 2
# 690 5
# 696 5
# 698 5
# 701 6
# 709 6
# 710 5
# 721 6
# 723 4
# 741 5
# 743 5
# 745 7
# 746 4
# 751 9
# 754 9
# 758 9
# 765 6
# 768 6
# 777 10
# 777 2
# 779 4
# 785 1
# 785 9
# 793 2
# 797 1
# 799 1
# 800 3
# 806 8
# 825 5
# 830 7
# 832 5
# 838 6
# 838 1
# 847 5
# 848 5
# 862 1
# 867 5
# 875 8
# 876 4
# 882 9
# 883 6
# 884 2
# 884 7
# 885 9
# 885 4
# 889 9
# 890 10
# 900 7
# 909 5
# 910 7
# 910 3
# 910 9
# 916 9
# 917 1
# 918 6
# 918 6
# 921 8
# 923 7
# 924 6
# 924 3
# 926 1
# 928 1
# 935 10
# 950 7
# 954 2
# 955 6
# 961 7
# 963 6
# 970 5
# 973 1
# 975 5
# 978 5
# 983 7
# 983 9
# 986 10
# 987 4
# 991 5
# 995 10
# 997 8
# 1002 3
# 1003 9
# 1005 6
# 1008 8
# 1014 3
# 1016 5
# 1024 6
# 1025 4
# 1031 5
# 1031 5
# 1038 10
# 1039 5
# 1040 6
# 1040 3
# 1041 5
# 1048 4
# 1053 9
# 1059 8
# 1060 1
# 1061 5
# 1063 9
# 1065 5
# 1071 9
# 1071 1
# 1072 10
# 1074 3
# 1075 4
# 1080 5
# 1081 1
# 1086 2
# 1088 1
# 1089 8
# 1090 3
# 1093 9
# 1094 10
# 1095 9
# 1096 9
# 1097 6
# 1108 3


# Sample Output
# 1 2
# 2 1
# 3 2
# 4 -1
# 5 5

from random import randrange


# 1. 패킷 개수 N은 1이상 1000 이하의 정수이다. (1 ≤ N ≤ 1000)
# 2. i번째 패킷의 수신 시간 Ti는 1이상 5000 이하의 정수이다. (1 ≤ Ti ≤ 5000)
# (같은 시간에 여러 개 패킷이 수신될 수 있으며, 이 경우 입력 순서대로 장비에 수신된다.)
# 3. i번째 패킷의 길이 Li은 1이상 10 이하의 정수이다. (1 ≤ Li ≤ 10)
# 4. 최대 사용 가능한 CPU 개수는 5개 이다.
# 5. 각 CPU는 독립된 큐를 갖는다.

# input = [[1, 5], [3, 8], [2, 4]]  # s, l
# input = [[2, 7], [5, 8]]  # s, l
# size = 50
# input = [[1, 4],[2, 10],[3, 10],[3, 6],[4, 10],[5, 3],[5, 10],[5, 10],[7, 6],[7, 3],[9, 10],[12, 10],[13, 3],[13, 1],[17, 6],[17, 6],[18, 8],[19, 9],[19, 10],[20, 3],[21, 10],[22, 9],[23, 10],[23, 10],[25, 10],[26, 10],[26, 10],[27, 10],[28, 6],[31, 9],[32, 8],[32, 1],[33, 10],[34, 4],[34, 6],[35, 10],[37, 9],[38, 4],[39, 1],[40, 6],[40, 1],[41, 9],[43, 6],[44, 3],[45, 3],[46, 3],[46, 10],[47, 1],[49, 3],[49, 9]]

global size
global returnable
global dictionarylist


def deep_copy(source_list):
    dest_list = source_list[:]
    return dest_list


def stateUpdator(current, tsn, ln):
    # s,e,d, l
    #current : sedl
    if current[1] == 0:
        ten = tsn + ln
        dn = 0
    else:
        if current[1] > tsn:
            ten = current[1] + ln
            dn = ten - tsn
        else :
            ten = tsn + ln
            dn = 0
        # ten = current[1] + ln
        # if ten <= tsn:
        #     dn = 0
        #     ten = tsn + ln
        # else:
        #     dn = ten - tsn
    return [tsn, ten, dn, ln]


def distributor(tasks, number, cpus):
    global returnable

    if number == size:
        returnable = len(cpus)

    else:
        task = tasks[number]
        index = 0
        for cpu in cpus:
            newCpuState = stateUpdator(cpu, task[0], task[1])

            aPage = tuple([number] + newCpuState)
            if aPage in dictionarylist:
                pass

            else:
                dictionarylist.add(aPage)

                if newCpuState[2] <= 10:
                    newCpus = deep_copy(cpus)
                    newCpus[index] = newCpuState
                    distributor(tasks, number + 1, newCpus)

            index = index + 1




# T = int(input())

check1 = 0
check2 = 0
while(True) :
    gen = randrange(4, 5, 1)
    obj = []
    for i in range(gen):
        obj.append([randrange(1, 50, 1), randrange(1, 10, 1)])

    obj = sorted(obj)
    for i in range(len(obj)):
        print(obj[i])

    for test_case in range(1):
        # tl = int(input())
        # inputList = []
        # size = tl

        # for ii in range(tl):
        #     b, c = map(int, input().split())
        #     inputList.append([b, c])

        size = len(obj)
        inputList = obj
        sortedSet = sorted(inputList, key=lambda x: x[0])
        returnable = 0

        cpus1 = [[0, 0, 0, 0]]
        cpus2 = [[0, 0, 0, 0], [0, 0, 0, 0]]
        cpus3 = [[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]
        cpus4 = [[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]
        cpus5 = [[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]

        dictionarylist = set()
        distributor(sortedSet, 0, cpus1)
        if returnable == 0:
            dictionarylist = set()
            distributor(sortedSet, 0, cpus2)
        if returnable == 0:
            dictionarylist = set()
            distributor(sortedSet, 0, cpus3)
        if returnable == 0:
            dictionarylist = set()
            distributor(sortedSet, 0, cpus4)
        if returnable == 0:
            dictionarylist = set()
            distributor(sortedSet, 0, cpus5)
        if returnable == 0: returnable = -1

        print("#" + str(test_case) + " " + str(returnable))

    check1 = returnable

    data = obj
    N = len(obj)

    def DFS(i, num_of_cpu, previous_hitting):
        global cpu_queuing_time
        global packet_memory

        hitting, length = data[i][0], data[i][1]
        time_diff = hitting - previous_hitting

        for n in range(5):
            cpu_queuing_time[n] = max(0, cpu_queuing_time[n] - time_diff)

        packet_data = tuple([i] + sorted(cpu_queuing_time))
        if packet_data in packet_memory:
            return False
        packet_memory.add(packet_data)

        for k in range(num_of_cpu):
            if cpu_queuing_time[k] + length <= 10:
                if i < N - 1:
                    temp = list(cpu_queuing_time)

                    cpu_queuing_time[k] += length

                    if DFS(i+1, num_of_cpu, hitting):
                        return True

                    cpu_queuing_time = temp
                else:
                    return True
        return False

    def solution():
        global cpu_queuing_time
        global packet_memory

        for n in range(1,6):
            cpu_queuing_time = [0 for _ in range(5)]
            packet_memory = set()

            if DFS(0,n,0):
                return n
        return -1

    check2 = solution()



    print(f'#0 {check2}')

    if check1 != check2 :
        print("체크")
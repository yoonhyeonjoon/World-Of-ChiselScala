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
    print(len(packet_memory))
    for k in range(num_of_cpu):
        if cpu_queuing_time[k] + length <= 10:
            if i < N - 1:
                temp = list(cpu_queuing_time)

                cpu_queuing_time[k] += length

                if DFS(i + 1, num_of_cpu, hitting):
                    return True

                cpu_queuing_time = temp
            else:
                return True
    return False


def solution():
    global cpu_queuing_time
    global packet_memory

    for n in range(1, 6):
        cpu_queuing_time = [0 for _ in range(5)]
        packet_memory = set()

        if DFS(0, n, 0):
            return n
    return -1


T = int(input())
for tc in range(1, T + 1):
    N = int(input())
    data = []

    for _ in range(N):
        t, l = map(int, input().split())
        data.append([t, l])
    print(f'#{tc} {solution()}')

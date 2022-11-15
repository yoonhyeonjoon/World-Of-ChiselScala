class CPU:
    def __init__(self, N, pck, cpu_num):
        self.N = N
        self.pck = pck
        # 몇초까지 CPU가 피어있는지 나타내는 리스트
        self.cpu = [0] * cpu_num
        self.cpu_num = cpu_num
        self.dp = dict()
        self.flag = False
        return

    def possible(self, cnt):
        # 모든 패킷이 다 가능하면 1을 리턴
        if cnt == self.N:
            self.flag = True
            return 1

        if self.flag:
            return 0

        t, l = self.pck[cnt]
        # 기다림 = 대기 + 처리
        wait = [0] * self.cpu_num
        for i in range(self.cpu_num):
            if self.cpu[i] > t:
                wait[i] = self.cpu[i] - t

        # Memoization
        val = tuple([cnt] + wait)
        # 이번 패킷에 대해 기다리는 시간까지 똑같으면 예전에 가본적 있으니 그냥 return
        if val in self.dp:
            return 0
        self.dp[val] = 1

        # cpu_num개 중 어디에 들어갈지 설정
        for i in range(self.cpu_num):
            # 총 실행시간 10초 넘으면 안됨
            if wait[i] + l > 10:
                continue

            tmp = self.cpu[i]
            self.cpu[i] = t + wait[i] + l
            ans = self.possible(cnt + 1)
            # 끝까지 돌고 왔으면 1이 반환됨
            if ans == 1:
                return 1
            self.cpu[i] = tmp
        return 0


def main():
    ans = -1
    N = int(input())
    pck = []
    for _ in range(N):
        t, l = map(int, input().split())
        pck.append((t, l))

    cpu = CPU(N, pck, 2)
    pos = cpu.possible(0)
    if pos == 1:
        ans = 2
    # for cnum in range(1, 6):
    #     cpu = CPU(N, pck, cnum)
    #     pos = cpu.possible(0)
    #     if pos == 1:
    #         ans = cnum
    #         break
    return ans


if __name__ == "__main__":
    T = int(input())
    for tc in range(1, T + 1):
        ans = main()
        print("#" + str(tc), ans)
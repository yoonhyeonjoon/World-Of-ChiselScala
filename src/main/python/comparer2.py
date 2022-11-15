for tc in range(1, int(input()) + 1):
    N = int(input())
    box = []
    arr = []
    for i in range(N):
        temp = list(map(int, input().split()))
        box.append([temp[0], temp[1], temp[2], i])
        box.append([temp[1], temp[2], temp[0], i])
        box.append([temp[2], temp[0], temp[1], i])
    box = sorted(box, key=lambda x: x[0] * x[1])
    ans = 0
    dp = []
    dp_list = [[box[i][3]] for i in range(N*3)]
    for b in box:
        dp.append(b[2])
    for i in range(N*3):
        for j in range(i, -1, -1):
            if (box[i][0]>=box[j][0] and box[i][1]>=box[j][1]) or (box[i][0]>=box[j][1] and box[i][1]>=box[j][0]):
                if box[i][3] in dp_list[j]: continue
                if dp[j] + box[i][2] > dp[i]:
                    dp[i] = dp[j] + box[i][2]
                    dp_list[i] = dp_list[j] + [box[i][3]]
    print(f'#{tc} {max(dp)}')


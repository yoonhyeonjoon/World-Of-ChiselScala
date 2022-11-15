def DFS(length, x, y, prev_x, prev_y):
    global ans, goal_x, goal_y, best_scores
    if length >= ans:
        return

    # 종료 조건
    if x == goal_x and y == goal_y:
        ans = min(ans, length)
        return
    # 가지치기
    if x < 0 or x >= N or y < 0 or y >= N:
        return

    if visited[x][y]:
        return
    if not maps[x][y]:
        return
    # 시작
    visited[x][y] = 1

    if maps[x][y] <= 2:
        types = 1
    elif 2 <= maps[x][y] < 7:
        types = 2

    if prev_x == x - 1 and prev_y == y:
        if best_scores[x][y][0] > length:
            best_scores[x][y][0] = length
            if types == 1:
                # 마지막 가지치기 : 해당 위치를 특정 방향으로 방문한 경험이 이미 있는데, 오히려 더 길게 들어왔다면 굳이 DFS할 것도없이 쳐내면 됨.

                # visited[x+1]
                DFS(length + 1, x + 1, y, x, y)
            elif types == 2:
                DFS(length + 1, x, y + 1, x, y)
                DFS(length + 1, x, y - 1, x, y)
    elif prev_x == x + 1 and prev_y == y:
        if best_scores[x][y][1] > length:
            best_scores[x][y][1] = length
            if types == 1:
                # 마지막 가지치기 : 해당 위치를 특정 방향으로 방문한 경험이 이미 있는데, 오히려 더 길게 들어왔다면 굳이 DFS할 것도없이 쳐내면 됨.
                # visited[x+1]
                DFS(length + 1, x - 1, y, x, y)
            elif types == 2:
                DFS(length + 1, x, y + 1, x, y)
                DFS(length + 1, x, y - 1, x, y)
    elif prev_x == x and prev_y == y - 1:
        if best_scores[x][y][2] > length:
            best_scores[x][y][2] = length
            if types == 1:
                # 마지막 가지치기 : 해당 위치를 특정 방향으로 방문한 경험이 이미 있는데, 오히려 더 길게 들어왔다면 굳이 DFS할 것도없이 쳐내면 됨.

                # visited[x+1]
                DFS(length + 1, x, y + 1, x, y)
            elif types == 2:
                DFS(length + 1, x - 1, y, x, y)
                DFS(length + 1, x + 1, y, x, y)
    elif prev_x == x and prev_y == y + 1:
        if best_scores[x][y][3] > length:
            best_scores[x][y][3] = length
            if types == 1:
                # 마지막 가지치기 : 해당 위치를 특정 방향으로 방문한 경험이 이미 있는데, 오히려 더 길게 들어왔다면 굳이 DFS할 것도없이 쳐내면 됨.

                # visited[x+1]
                DFS(length + 1, x, y - 1, x, y)
            elif types == 2:
                DFS(length + 1, x - 1, y, x, y)
                DFS(length + 1, x + 1, y, x, y)

    visited[x][y] = 0
    return


T = int(input())
INF = float('inf')
for tc in range(1, T + 1):
    N = int(input())
    ans = INF
    maps = [[int(i) for i in input().split()] for _ in range(N)]
    for i in range(2):
        visited = [[0 for _ in range(N)] for _ in range(N)]
        best_scores = [[[10000000 for _ in range(4)] for _ in range(N)] for _ in range(N)]

        if i == 0:
            goal_x, goal_y = 0, -1

            DFS(0, N - 1, N - 1, N - 1, N)
        else:
            goal_x, goal_y = N - 1, N
            DFS(0, 0, 0, 0, -1)
    print(f'#{tc} {ans}')
    # print('#{} {}'.format(tc, ans))

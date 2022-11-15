T = int(input())

def check(y, x, L):
    if (L[y][x] == 0) and (L[y + 1][x] == 0) and (L[y][x + 1] == 0) and (L[y + 1][x + 1] == 0):
        return True
    else:
        return False


def do(y, x, L):
    L[y][x] = 1
    L[y + 1][x] = 1
    L[y][x + 1] = 1
    L[y + 1][x + 1] = 1


def undo(y, x, L):
    L[y][x] = 0
    L[y + 1][x] = 0
    L[y][x + 1] = 0
    L[y + 1][x + 1] = 0


def sol(y, x, L, cnt):
    global visited, MAX
    # if cnt == 9:
    # print('a')
    MAX = max(MAX, cnt)

    Y = y + 1
    X = x

    if x >= M - 1:
        return

    if y == N - 2:
        X = x + 1
        Y = 0

    if x >= 1 and y == 0:
        idx = 0
        for n in range(N):
            if visited[n][x - 1] == 1:
                idx += 1 << n
        if memo[idx][x - 1] < cnt:
            memo[idx][x - 1] = cnt
        else:
            return

    L2 = [l[:] for l in L]
    if check(y, x, L2) and (not visited[y][x]):
        do(y, x, L2)
        visited[y][x] = 1

        sol(Y, X, L2, cnt + 1)

        visited[y][x] = 0
        undo(y, x, L2)
        sol(Y, X, L2, cnt)
    else:
        sol(Y, X, L2, cnt)


for t in range(1, T + 1):
    N, M = list(map(int, input().split()))
    L = [list(map(int, input().split())) for _ in range(N)]
    # memo = [ [-1 for _ in range(2**M)] for _ in range(N)]
    memo = [[-1 for _ in range(M)] for _ in range(2 ** N)]
    visited = [[0 for _ in range(M)] for _ in range(N)]
    cnt = 0
    MAX = 0
    L2 = [l[:] for l in L]

    sol(0, 0, L2, 0)
    print('#%d %d' % (t, MAX))

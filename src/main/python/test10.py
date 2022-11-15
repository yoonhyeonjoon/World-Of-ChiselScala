def mapset(amap, y, x, switch):
    if switch:
        amap[y][x] = 1
        amap[y][x + 1] = 1
        amap[y + 1][x] = 1
        amap[y + 1][x + 1] = 1
    else:
        amap[y][x] = 0
        amap[y][x + 1] = 0
        amap[y + 1][x] = 0
        amap[y + 1][x + 1] = 0


def abler(map, y, x):
    try:
        if map[y][x] == 0 and map[y][x + 1] == 0 and map[y + 1][x] == 0 and map[y + 1][x + 1] == 0:
            return True
        else:
            return False
    except:
        return False


global R, C
global maxer
global memo
maxer = 0

def dfs(r, c, amap, max):
    global maxer
    global R, C
    global memo

    nc = c + 1
    nr = r
    nmax = max
    if nc == C - 1:
        acum = 0
        for i in range(len(amap[r])):
            if amap[r][i] == 1: acum += 1 << i

        # Memoization:
        if memo[r][acum] > max:
            return
        else:
            if maxer < max:
                maxer = max
            print(maxer)
            memo[r][acum] = max

        nc = 0
        nr = r + 1

    if nr == R - 1:
        return

    if abler(amap, nr, nc):
        nmax += 1
        mapset(amap, nr, nc, True)
        dfs(nr, nc, amap, nmax)
        mapset(amap, nr, nc, False)

    dfs(nr, nc, amap, max)


for tc in range(1, 2):
    R, C = map(int, input().split())
    MAX = 0
    wafer = [list(map(int, input().split())) for _ in range(R)]
    memo = [[-1 for _ in range(1 << C)] for _ in range(C)]
    dfs(0, -1, wafer, 0)
    print(maxer)
    print('#%d %d' % (tc, MAX))

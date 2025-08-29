import sys
import heapq

def parse_input():
    data = sys.stdin.read().strip().splitlines()
    # Skip empty lines
    lines = [ln.strip() for ln in data if ln.strip()]
    if not lines:
        return 0, 0, "", "", []
    first = lines[0].split()
    if len(first) >= 4:
        try:
            n = int(first[0]); m = int(first[1])
            start = first[2]; target = first[3]
            edge_lines = lines[1:]
        except Exception:
            # Fallback: try next-line for start/target
            n = int(first[0]); m = int(first[1])
            st = lines[1].split()
            start, target = st[0], st[1]
            edge_lines = lines[2:]
    else:
        # Expect second line to contain start and target
        n = int(first[0]); m = int(first[1])
        st = lines[1].split()
        start, target = st[0], st[1]
        edge_lines = lines[2:]
    edges = []
    count = 0
    for ln in edge_lines:
        if not ln:
            continue
        parts = ln.split()
        if len(parts) < 3:
            continue
        u, v, w = parts[0], parts[1], parts[2]
        try:
            wv = int(w)
        except Exception:
            # If weight somehow is float, cast to int
            wv = int(float(w))
        edges.append((u, v, wv))
        count += 1
        if count >= m:
            break
    return n, m, start, target, edges

def build_graph(edges):
    id_map = {}
    def get_id(name):
        if name not in id_map:
            id_map[name] = len(id_map)
        return id_map[name]
    for u, v, _ in edges:
        get_id(u); get_id(v)
    return id_map

def dijkstra(edges, start_name, target_name):
    id_map = build_graph(edges + [(start_name, start_name, 0), (target_name, target_name, 0)])
    n_nodes = len(id_map)
    adj = [[] for _ in range(n_nodes)]
    for u, v, w in edges:
        ui = id_map[u]; vi = id_map[v]
        adj[ui].append((vi, w))
    if start_name not in id_map or target_name not in id_map:
        return -1
    start = id_map[start_name]; target = id_map[target_name]
    INF = 10**19
    dist = [INF] * n_nodes
    dist[start] = 0
    heap = [(0, start)]
    visited = [False] * n_nodes
    while heap:
        d, u = heapq.heappop(heap)
        if visited[u]:
            continue
        visited[u] = True
        if u == target:
            return d
        for v, w in adj[u]:
            nd = d + w
            if nd < dist[v]:
                dist[v] = nd
                heapq.heappush(heap, (nd, v))
    return -1 if dist[target] >= INF else dist[target]

def main():
    _, _, start, target, edges = parse_input()
    ans = dijkstra(edges, start, target)
    sys.stdout.write(str(ans))

if __name__ == "__main__":
    main()

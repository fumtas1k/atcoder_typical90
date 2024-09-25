// 035 - Preserve Connectivity（★7）
// オイラーツアー
// 最近共通祖先(LCA)
// 座標圧縮

const BIT = 21;

const input = require("fs").readFileSync("/dev/stdin", "utf8").split("\n");

let n = 0;
const N = Number(input[n++]);
const G = [...Array(N)].map(() => []);
for (let i = 0; i < N - 1; i++) {
  const [a, b] = input[n++].split(" ").map(j => Number(j) - 1);
  G[a].push(b);
  G[b].push(a);
}

const parents = [...Array(BIT)].map(() => Array(N).fill(0));
const depth = Array(N).fill(-1);
depth[0] = 0;
const orders = Array(N).fill(-1);
let current_order = 0;

const dfs = (pos = 0, pre = 0) => {
  parents[0][pos] = pre;
  orders[pos] = current_order++;
  G[pos].forEach(to => {
    if (to === pre) return;
    depth[to] = depth[pos] + 1;
    dfs(to, pos);
  });
};

dfs();

for (let i = 0; i < BIT - 1; i++) {
  for (let j = 0; j < N; j++) {
    parents[i + 1][j] = parents[i][parents[i][j]];
  }
}

const lca = (u, v) => {
  if (depth[u] < depth[v]) [u, v] = [v, u];
  const diff = depth[u] - depth[v];
  for (let i = 0; i < BIT; i++) {
    if ((diff >> i) & 1) u = parents[i][u];
  }
  if (u === v) return u;
  for (let i = BIT - 1; i >= 0; i--) {
    if (parents[i][u] == parents[i][v]) continue;
    u = parents[i][u];
    v = parents[i][v];
  }
  return parents[0][u];
}

const Q = Number(input[n++]);
const ans = Array(Q).fill(0);
for (let i = 0; i < Q; i++) {
  const [k, ...v] = input[n++].split(" ").map(Number);
  const w = v.map(j => j - 1).sort((a, b) => orders[a] - orders[b]);
  for (let j = 0; j < k; j++) {
    const parent = lca(w[j], w[(j + 1) % k]);
    ans[i] += depth[w[(j + 1) % k]] - depth[parent];
  }
}

console.log(ans.join("\n"));

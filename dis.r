shortest_path <- function(edges, n) {
  # 初始化距离矩阵
  dist <- matrix(Inf, n, n)
  diag(dist) <- 0  # 对角线设为0
  # 根据直接连接的边设置距离为1
  for (i in 1:nrow(edges)) {
    dist[edges[i,1], edges[i,2]] <- 1
    dist[edges[i,2], edges[i,1]] <- 1  # 无向图，所以两个方向都要设置
  }
  # Floyd-Warshall 算法
  for (k in 1:n) {
    for (i in 1:n) {
      for (j in 1:n) {
        if (dist[i,k] != Inf && dist[k,j] != Inf) {
          dist[i,j] <- min(dist[i,j], dist[i,k] + dist[k,j])
        }
      }
    }
  }
  return(dist)
}
# 创建边的邻接矩阵
# c(1,2, 2,3, 3,4, 4,1) 表示四条边：
#   - 1->2：城市1连接城市2
#   - 2->3：城市2连接城市3
#   - 3->4：城市3连接城市4
#   - 4->1：城市4连接城市1
# ncol=2：将数据排列成2列（表示每条边的起点和终点）
# byrow=TRUE：按行填充数据（每行代表一条边）
# 最终生成的矩阵形状为 4x2：
#      [,1] [,2]
# [1,]   1    2
# [2,]   2    3
# [3,]   3    4
# [4,]   4    1
edges <- matrix(c(1, 2, 2, 3, 3, 4, 4, 1), ncol = 2, byrow = TRUE)
n <- 4
dist <- shortest_path(edges, n)
print(dist)
# R[i,j] = 0 表示同一个城市
# R[i,j] = 1 表示直接相连
# R[i,j] = k 表示需要经过k段高速公路
# R[i,j] = Inf 表示不连通
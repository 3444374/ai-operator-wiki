---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: []
tags: [method]
aliases:
  - "Greedy Search"
  - "贪婪搜索"
  - "贪心搜索"
generation_complete: true
---


# GreedySearch

## 定义
GreedySearch（贪心搜索）是一种用于近似最近邻（ANN）图遍历的基础算法：从给定的起始节点出发，每一步都选择当前节点的邻居中距离查询点最近的节点，直至无法找到更近的节点为止。该算法是 Vamana 图构建和 Beam search 查询的核心组件，单路贪心策略简单高效，但容易陷入局部最优，Vamana 图中特意保留的长边可帮助其在搜索时跳出局部极值。

## 关键特征
- **邻居择优遍历**：每一步都贪婪地移动到距离查询点最近的邻居，不回溯、不分裂搜索路径
- **终止条件简单**：当所有邻居的距离均不小于当前节点时停止，即收敛于局部最优
- **构建候选集**：在 Vamana 图构建阶段，对每个插入节点执行 GreedySearch，收集其访问过的节点作为候选邻居集，随后由 α‑pruning 筛选最终边
- **Beam Search 基础**：在查询阶段，将其扩展为保持 beam width = L 的变体，同时追踪 L 条搜索路径以提高精度
- **轻量高效**：单路径扩展开销小，适合大规模高维向量搜索场景
- **局部最优陷阱**：纯贪心策略可能停留在局部极值，依赖图中长边“跳转”来覆盖远距离区域

## 应用
- **图索引构建**：DiskANN/Vamana 算法中，每个新节点插入时通过 GreedySearch 收集候选邻居，再经 α‑pruning 建立精确、稀疏的邻接边
- **近似最近邻查询**：作为 Beam Search 的基本步进单元，控制每步的候选扩展方式，平衡搜索速度与召回率
- **磁盘感知 ANN 引擎**：在 [[entities/diskann|DiskANN]] 等系统中，GreedySearch 结合局部量化与图布局，实现高效的 SSD 友好型矢量搜索

## 相关概念
- [[concepts/vamana-graph|Vamana graph]]
- [[concepts/α-pruning|α‑pruning]]
- [[concepts/beam-search|Beam search]]

## 相关实体
- [[entities/diskann|DiskANN]]

## 来源提及

- "图构建时对每个节点 p 运行 greedy search 找到候选邻居集合" — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
- "GreedySearch per node with α≥1 pruning" — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
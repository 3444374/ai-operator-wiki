---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[entities/diskann]]"]
tags: [method]
aliases:
  - "alpha-pruning"
  - "relaxed pruning strategy"
generation_complete: true
---


# α-pruning

## 定义
α-pruning 是 Vamana 图构建算法中的关键剪枝策略。在 greedy search 找到候选邻居后，将候选按与当前节点的距离排序，并逐个加入邻接表。与传统严格最近邻剪枝不同，α-pruning 允许节点额外保留部分距离较远但能提供跨区域连接的“长边”。参数 α > 1 控制剪枝的松弛程度：当 α = 1 时退化为仅保留最近邻的严格剪枝；增大 α 会引入更多长边，增强图的导航能力（降低搜索 hop 数），但可能降低局部精度。该机制是 Vamana 图形成 small‑world 导航特性、实现在内存限制下高 recall 近似最近邻搜索的核心设计。

## 关键特征
- **松弛参数 α**：α > 1，控制剪枝的松弛度，α 越大保留的远距离邻居越多。
- **长边机制**：允许节点连接距离较远但能提供跨区域导航的邻居，形成 small‑world 属性。
- **严格退化**：当 α = 1 时退化为标准最近邻剪枝，不再产生长边。
- **导航能力与局部精度权衡**：增大 α 提升图的导航速度（减少搜索步数），但可能降低局部邻域的精确度。
- **典型取值范围**：DiskANN 实验中 α 通常设为 1.2 ~ 2.0。

## 应用
- **Vamana 图构建**：α-pruning 是 Vamana 索引构建流程的核心步骤，用于在贪心搜索候选集中选择最终邻接边。
- **DiskANN 索引系统**：[[entities/diskann|DiskANN]] 基于 Vamana 图实现，利用 α-pruning 在有限内存下构建高导航效率的图索引，达到高 recall 的近似最近邻搜索。
- **大规模向量检索**：受益于 α-pruning 产生的 small‑world 结构，图索引在十亿级数据集上能够快速路由到目标区域，适合高维向量相似搜索场景。

## 相关概念
- [[concepts/vamana-graph|Vamana graph]]
- [[concepts/greedy-search|GreedySearch]]

## 相关实体
- [[entities/diskann|DiskANN]]

## 来源提及

- "引入松弛参数 α > 1，使得节点 p 可以接受距离不那么近的候选作为邻居。效果：图中同时存在短边（局部近邻，保证精度）和长边（跨区域跳跃，加速遍历），形成类似 small-world 图的导航结构。" — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
- "α 参数（α=1.0 vs 1.2 vs 1.5 vs 2.0）" — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
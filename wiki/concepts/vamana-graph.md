---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/diskann_neurips2019_009b0e]]"]
tags: [method]
aliases:
  - "Vamana algorithm"
  - "Vamana graph index"
generation_complete: true
---


# Vamana graph

## 定义
Vamana graph 是由 DiskANN 提出的一种用于近似最近邻（ANN）搜索的图索引构建算法。其核心思路是对数据集中的每个节点，先通过贪心搜索（greedy search）找到一批候选邻居，再使用 α‑pruning 策略进行剪枝，确定最终邻接边。这样构建出的导航图兼具短边（保障局部近邻精度）与长边（加速远距离跳转），形成便于快速导航的 small‑world 拓扑。每个节点的出度由参数 R 限制，典型值设为 32 或 64。该图结构天然与向量存储解耦，使得全精度向量可以卸载到 SSD 上，搜索时仅依赖一小部分驻留在内存中的图结构与压缩向量，通过 beam search 高效定位近邻，从而在大规模数据集上实现低延迟、高召回检索。

## 关键特征
- **α‑pruning 控制长短边**：在候选集中保留那些相对于被剪枝节点能显著缩短距离的邻居，从而在图中引入长边，整体平衡局部精度与跨区域跳跃能力。
- **出度上限 R**：每个节点保留的邻居数不超过 R，以控制图的大小和遍历代价，是调节搜索速度与精度的主要参数。
- **存储解耦**：图构建完成之后，全精度向量可以完全置于 SSD 等慢速介质，内存中仅保留图拓扑和轻量压缩向量（如 PQ 编码），实现二级存储下的高性能检索。
- **与 beam search 协同**：搜索过程在图上进行 beam search（宽度为 W 的贪心拓展），利用长边快速到达目标区域，再利用短边精细搜索，在有限的计算预算内达到高召回。
- **面向十亿级数据集**：从设计之初就考虑到十亿级别向量的索引与查询，在 SIFT1B、Deep1B 等数据集上展现出优异的可扩展性。

## 应用
- **DiskANN 等大规模向量检索系统**：作为 DiskANN 的核心索引结构，支撑在单台服务器上对十亿级高维向量的近似最近邻搜索。
- **推荐系统与语义搜索**：为海量商品、内容或文档的向量化表征提供快速相似度计算，支持实时推荐与检索增强生成（RAG）。
- **计算机视觉与信息检索基础架构**：用于图像、视频等特征库的快速匹配，可嵌入到向量数据库和搜索引擎中，作为默认的图索引方案之一。
- **资源受限场景**：利用 SSD 存储全精度向量，显著降低内存需求，使大规模向量检索可以在成本敏感的环境中部署。

## 相关概念
- [[concepts/alpha-pruning|α-pruning]]
- [[concepts/product-quantization|Product Quantization]]
- [[concepts/two-tier-storage-architecture|Two-tier storage architecture]]
- [[concepts/beam-search|Beam search]]

## 相关实体
- [[entities/diskann|DiskANN]]
- [[entities/hnsw|HNSW]]
- [[entities/nsg|NSG]]

## 来源提及

- "核心创新在于 α-pruning 机制。图构建时对每个节点 p 运行 greedy search 找到候选邻居集合，然后按距离排序逐步加入 p 的邻接表——但引入松弛参数 α > 1，使得节点 p 可以接受距离不那么近的候选作为邻居。" — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
- "Vamana 图算法 + SSD 感知的两层存储架构" — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
- "§3 Vamana Algorithm：α > 1 的 pruned greedy search 产生 long-range edges，使得图同时具有局部精度和全局导航能力。" — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
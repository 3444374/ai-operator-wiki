---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/diskann_neurips2019_009b0e]]"]
tags: [phenomenon]
aliases:
  - "长边"
  - "highway edges"
generation_complete: true
---


# Long-range edges

## 定义
Long-range edges（长边）是指图索引中连接两个在向量空间中距离较远的节点的边。它们是 small-world 图的核心结构，与局部短边共同作用，使图具有小直径和高导航效率。在 Vamana 图的构建中，α-pruning 策略刻意保留此类长边，使其不被过度修剪，从而在搜索时能用少量跳步跨越广阔的向量空间区域。

## 关键特征
- **远距离连接**：直接连接空间中相隔较远的两个区域，打破了局部近邻图的限制。
- **小世界属性**：与大量短边配合，使图具备 small‑world 特性，确保从任意节点出发都能在少量步数内到达目标区域。
- **α‑pruning 保留**：Vamana 图构造时，α‑pruning 会选择性删边，但有意保留一部分长边，以维持全局导航能力。
- **压缩距离下的鲁棒导航**：当内存中仅存放图的拓扑结构与压缩近似距离（如 PQ 编码）时，长边使 beam search 能快速跳过低质量候选区，精准定位候选集，避免了遍历海量短边的开销。
- **内存与精度的折中**：长边的存在解决了全内存图索引（如 HNSW）在大规模数据下面临的内存瓶颈，允许完整向量存储在 SSD 上，而长边保证在图结构常驻内存时仍能保持高搜索精度。

## 应用
- **磁盘向量搜索系统**：[[entities/diskann|DiskANN]] 等基于磁盘的 ANNS 系统依赖长边，使 beam search 在仅使用图结构与压缩距离的前提下，仍能在少量 I/O 内完成高效导航，达到高召回率。
- **高维相似性搜索**：在推荐、以图搜图、语义检索等场景中，利用长边设计的图索引能以可控的内存占用应对亿级数据集，实现近似实时查询。
- **图索引设计优化**：通过调整 [[concepts/alpha-pruning|α‑pruning]] 参数来控制长边的生成与保留，针对不同数据分布与硬件约束优化图的度数和连通性。

## 相关概念
- [[concepts/vamana-graph|Vamana graph]]
- [[concepts/alpha-pruning|α‑pruning]]
- [[concepts/small-world-graph|Small-world graph]]

## 相关实体
- [[entities/diskann|DiskANN]]
- [[entities/hnsw|HNSW]]

## 来源提及

- "效果：图中同时存在短边（局部近邻，保证精度）和长边（跨区域跳跃，加速遍历），形成类似 small-world 图的导航结构。" — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
- "这个'松弛参数引入 long-range edges'的思路可以用在 writeback 的数据组织上" — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/diskann_neurips2019_009b0e]]"]
tags: [method]
aliases:
  - "Hierarchical Navigable Small World"
  - "HNSW 算法"
generation_complete: true
---


# HNSW

## 定义
HNSW（Hierarchical Navigable Small World）是一种基于多层可导航小世界图的近似最近邻搜索（ANNS）算法，由 Yu. A. Malkov 和 D. A. Yashunin 于 2020 年在《IEEE Transactions on Pattern Analysis and Machine Intelligence》（TPAMI）上正式发表。该算法通过构建层次化图结构，能够在高维向量空间中高效查找与查询最相似的近邻，是目前内存矢量索引领域的标杆方法之一。

## 关键特征
- **多层图结构**：底层包含所有数据点，上层仅保留按指数衰减概率采样的子集，形成由稀疏到稠密的层次化“高速公路”，使搜索能从外层快速定位到目标区域
- **可导航小世界属性**：每一层图均具备小世界特性（短平均路径与良好连接性），确保了贪心搜索的局部收敛效率
- **逐层贪心搜索**：从顶层固定入口点开始，在每一层执行贪心局部搜索，到达局部极小后下落至下一层继续搜索，最终在底层获得近邻结果
- **内存密集型**：全量图索引和原始向量必须常驻主存（RAM），因此其可处理的数据规模直接受限于可用内存容量
- **精度‑速度平衡**：在内存充足时，HNSW 的查询延迟和召回率曲线通常优于多数竞争对手，常被作为内存索引的 SOTA 基线
- **构造过程**：基于指数衰减概率分配节点层级，并按序插入节点并动态维护近邻连接

## 应用
- 向量数据库和相似性搜索库（如 [[entities/pgvector|pgvector]]、[[entities/faiss|faiss]]、[[entities/nmslib|nmslib]]）均将 HNSW 作为内置索引选项，用于实时推荐、图像检索、语义搜索等场景
- 作为评估新 ANNS 方法的性能基线，例如 [[entities/diskann|diskann]] 在其论文中将 HNSW 作为内存图索引的代表性参考，并展示了在内存受限场景下自身基于 SSD 分层存储的优势
- 在小到中等规模数据集（百万至千万级向量）且内存充足的条件下，HNSW 能提供低延迟、高召回的服务质量

## 相关概念
- [[concepts/nsg|NSG]]
- [[concepts/vamana-graph|Vamana graph]]
- [[concepts/two-tier-storage-architecture|Two-tier storage architecture]]

## 相关实体
- [[entities/diskann|diskann]]
- [[entities/faiss|faiss]]
- [[entities/pgvector|pgvector]]
- [[entities/nmslib|nmslib]]

## 来源提及

- "比 **HNSW** (Malkov & Yashunin, TPAMI 2020)：HNSW 的精度-速度曲线在大内存场景下优于 DiskANN（全量向量在 RAM），但无法在 64GB RAM 上处理 1B 点。" (相比 **HNSW**（Malkov & Yashunin, TPAMI 2020）：HNSW 在大内存场景下的精度-速度曲线优于 DiskANN（全量向量位于 RAM），但无法在 64GB RAM 上处理10亿个点。) — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
- "Baseline | HNSW（内存图索引 SOTA）、NSG（图索引 SOTA）、FAISS IVF/IMI（倒排索引）..." (基线 | HNSW（内存图索引 SOTA）、NSG（图索引 SOTA）、FAISS IVF/IMI（倒排索引）...) — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
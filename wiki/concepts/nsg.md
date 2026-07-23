---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/diskann_neurips2019_009b0e]]"]
tags: [method]
aliases:
  - "Navigating Spread-out Graph"
  - "NSG 图索引"
generation_complete: true
---


# NSG

## 定义
NSG（Navigating Spread-out Graph）是一种基于单调相对邻域图（Monotonic Relative Neighborhood Graph, MRNG）的近似最近邻搜索图索引方法，由 Fu 等人于 VLDB 2019 提出。它通过构建具有导航性质的扩展图，确保搜索路径的距离单调递减，从而在内存中实现高精度的近似检索。

## 关键特征
- 底层采用 MRNG 结构，数学上保证搜索过程的单调收敛特性，避免局部最优陷阱。
- 构建策略与 Vamana 图相似，通过贪婪算法添加边以优化搜索质量，但要求所有向量在 RAM 中构建和查询。
- 常被用作图索引领域的 SOTA 基线，在召回率与查询吞吐上均表现优异。
- 依赖全量数据驻留内存，限制了单机可处理的向量规模。
- DiskANN 在此基础上引入“内存+SSD”两层存储架构，使 NSG 类索引可突破内存墙，是该方法的重要演进方向。

## 应用
NSG 适合内存足够容纳全量向量集的场景，常作为高精度向量检索的参考实现，用于对比 FAISS 等库的性能。它也是 DiskANN 等 SSD 友好型索引的核心基础，在学术与工业界的近似最近邻搜索评测中被广泛引用。

## 相关概念
- [[concepts/monotonic-relative-neighborhood-graph|Monotonic Relative Neighborhood Graph]]
- [[concepts/vamana-graph|Vamana graph]]
- [[concepts/two-tier-storage-architecture|Two-tier storage architecture]]

## 相关实体
- [[entities/diskann|diskann]]
- [[entities/faiss|faiss]]

## 来源提及

- "比 **NSG** (Fu et al., VLDB 2019)：NSG 也是图索引，构建思路类似（Monotonic Relative Neighborhood Graph），但 NSG 同样要求全量向量驻留 RAM。DiskANN 可以看作 NSG + SSD offload。" (相比 **NSG** (Fu et al., VLDB 2019)：NSG 也是一种图索引，构建思路类似（单调相对邻域图），但 NSG 同样要求全量向量驻留在 RAM 中。DiskANN 可以看作是 NSG + SSD offload。) — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
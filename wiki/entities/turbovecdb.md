---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/diskann_neurips2019_009b0e]]"]
tags: [product]
aliases:
  - "TurboVecDB (PVLDB 2025)"
  - "TurboVecDB"
generation_complete: true
---


# TurboVecDB

## 描述
TurboVecDB 是发表于 [[entities/pvldb-2025|PVLDB 2025]] 的向量索引构建优化系统，专门针对 [[entities/pgvector|pgvector]] 的 HNSW 索引构建过程进行加速。它通过引入并行 I/O 和空间感知插入策略，将 HNSW 索引构建时间减少了 98.4%。在 [[entities/diskann|DiskANN]] 相关资料的后续待读文献中，TurboVecDB 被视为与 DiskANN 的 SSD 优化互补的工作：DiskANN 侧重于查询时的磁盘访问优化，而 TurboVecDB 则面向写入阶段的高效索引构建。对于 AI 算子的 writeback 场景，TurboVecDB 提供了一种可落地的 HNSW 索引快速构建方案，能与 DiskANN 的两层存储架构结合，形成“快速写入 + 高效查询”的完整向量存储管线。

## 相关实体
- [[entities/pgvector|pgvector]] —— TurboVecDB 优化的目标向量索引扩展
- [[entities/diskann|DiskANN]] —— 侧重查询优化的磁盘近似最近邻系统，与 TurboVecDB 写入优化互补
- [[entities/pvldb-2025|PVLDB 2025]] —— 该系统的发表会议

## 相关概念
- [[concepts/two-tier-storage-architecture|Two-tier storage architecture]] —— DiskANN 的两层存储设计，与 TurboVecDB 的快速写入方案结合
- [[concepts/ssd-access-optimization|SSD access optimization]] —— DiskANN 的查询端优化方向，TurboVecDB 从写入端实现互补加速

## 来源提及

- "TurboVecDB (PVLDB 2025) — pgvector 索引构建优化的直接参考，通过并行 I/O + 空间感知插入将 HNSW 索引构建时间减少 98.4%，与 DiskANN 的 SSD 优化互补" — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
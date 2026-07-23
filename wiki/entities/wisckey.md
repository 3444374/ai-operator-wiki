---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/diskann_neurips2019_009b0e]]"]
tags: [product]
aliases:
  - "WiscKey (FAST 2016)"
  - "WiscKey KV store"
generation_complete: true
---


# WiscKey

## 描述
WiscKey 是一种基于 [[concepts/key-value-separation|Key-Value Separation]] 的持久化存储引擎，由 FAST 2016 学术会议提出。其核心设计是将大尺寸的 value 从 LSM-tree 的 compaction（压实）路径中剥离，仅将 key 和 value 的位置信息保留在 LSM-tree 中，从而显著降低传统 LSM-tree 引擎的写放大。[[entities/diskann|DiskANN]] 相关的笔记中将 WiscKey 设置为写回批量操作场景下的 LSM-tree 层面参考，原因在于其分离设计与 DiskANN 的“轻量索引在内存、全量数据在 SSD”的 [[concepts/two-tier-storage-architecture|Two-tier storage architecture]] 在思想上有共通之处。在本课题的 AI 算子结果 writeback 场景中，WiscKey 的 KV 分离策略可为 [[entities/pgvector|pgvector]] 在写入时维持向量索引的路径提供优化启发。

## 相关实体
- [[entities/diskann|DiskANN]]
- [[entities/pgvector|pgvector]]

## 相关概念
- [[concepts/two-tier-storage-architecture|Two-tier storage architecture]]
- [[concepts/key-value-separation|Key-Value Separation]]

## 来源提及

- "WiscKey (FAST 2016) — KV 分离存储，大 value 避免 compaction 重写，writeback 批量的 LSM-tree 层面参考" — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
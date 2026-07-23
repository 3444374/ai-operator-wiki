---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/diskann_neurips2019_009b0e]]"]
tags: [product]
aliases:
  - "VBASE (OSDI 2023)"
  - "VBASE unified query system"
generation_complete: true
---


# VBASE

## 描述
VBASE 是发表于 OSDI 2023 的统一查询系统，旨在原生地在向量数据与关系数据之间进行混合查询。它引入了 unification selectivity 感知的优化策略，能够根据过滤条件的选择性自动选择向量搜索与 SQL 过滤的执行顺序，从而显著减少不必要的高维向量计算。在 [[entities/diskann|diskann]] 的相关笔记中，VBASE 被列为多模态数据管理场景的潜在参考，尤其适合 AI 算子结果写回后与 SQL 条件联合查询的 writeback 优化场景。虽然 [[entities/diskann|diskann]] 本身不直接处理 SQL 过滤，VBASE 为融合向量相似性检索与结构化过滤的上层接口设计提供了可直接借鉴的模式。其设计也能为 [[entities/pgvector|pgvector]] 这类嵌入在关系数据库中的向量扩展提供更高层次的联合优化思路。

## 相关实体
- [[entities/diskann|diskann]] — 将 VBASE 列为多模态场景参考的向量搜索索引
- [[entities/pgvector|pgvector]] — 关系数据库中的向量扩展，面临类似的混合查询挑战

## 相关概念
- [[concepts/sql-filtering|SQL filtering]] — VBASE 支持向量搜索与 SQL 过滤条件无缝结合的核心能力
- [[concepts/two-tier-storage-architecture|Two-tier storage architecture]] — VBASE 底层采用的存储架构，以同时高效管理向量与关系数据

## 来源提及

- "VBASE (OSDI 2023) — vector + relational 统一查询，unified selectivity 感知，本课题多模态场景的潜在参考" — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
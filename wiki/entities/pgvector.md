---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/gaussml_icde2024_577060]]"]
tags: [product]
aliases:
  - "pgvector扩展"
  - "PGVector"
generation_complete: true
---


# pgvector

## 描述
pgvector 是 PostgreSQL 的开源扩展，支持将向量数据作为原生数据类型存储，并提供高效的向量相似度搜索（如 L2 距离、内积、余弦距离）。在 GaussML 的 [[concepts/外部执行链路|外部执行链路]] 中，pgvector 作为写回目标之一，允许将外部 AI 推理产生的向量结果持久化到数据库，从而在数据库内实现语义查询。与 [[entities/lance|Lance]] 一同构成多存储后端的写回方案，旨在缓解 [[concepts/写回瓶颈|写回瓶颈]]。数据通常通过 [[entities/psycopg|psycopg]] 等客户端与 pgvector 交互，使得向量数据能够与结构化数据协同处理。

## 相关实体
- [[entities/lance|Lance]]
- [[entities/psycopg|psycopg]]

## 相关概念
- [[concepts/外部执行链路|外部执行链路]]
- [[concepts/写回瓶颈|写回瓶颈]]

## 来源提及

- "| 写回方式 | 数据库内部自然写回 | psycopg/pgvector/Lance 显式写回 |" (| 写回方式 | 数据库内部自然写回 | psycopg/pgvector/Lance 显式写回 |) — [[raw/papers/gaussml_icde2024|gaussml_icde2024]]
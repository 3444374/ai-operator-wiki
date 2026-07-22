---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/gaussml_icde2024_577060]]"]
tags: [product]
aliases:
  - "psycopg适配器"
  - "psycopg2"
generation_complete: true
---


# psycopg

## 描述
psycopg 是 Python 语言访问 PostgreSQL 数据库的主流适配器，提供高效的数据读写与事务管理能力。在本课题的写回链路中，psycopg 作为关键的数据通道，负责将外部推理结果写回数据库。它与 [[entities/pgvector|pgvector]] 和 [[entities/lance|Lance]] 协同工作，共同构成 [[concepts/外部执行链路|外部执行链路]]，并在此过程中应对 [[concepts/写回瓶颈|写回瓶颈]] 带来的挑战。psycopg 的高性能接口与 PostgreSQL 生态深度集成，是数据库内 AI 场景下结果持久化的重要组件。

## 相关实体
- [[entities/pgvector|pgvector]]
- [[entities/lance|Lance]]

## 相关概念
- [[concepts/外部执行链路|外部执行链路]]
- [[concepts/写回瓶颈|写回瓶颈]]

## 来源提及

- "| 写回方式 | 数据库内部自然写回 | psycopg/pgvector/Lance 显式写回 |" (| 写回方式 | 数据库内部自然写回 | psycopg/pgvector/Lance 显式写回 |) — [[raw/papers/gaussml_icde2024|gaussml_icde2024]]
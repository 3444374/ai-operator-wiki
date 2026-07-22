---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources:
  - "[[sources/cortex_aisql_sigmod2026_c18b08]]"
  - "[[sources/gaussml_icde2024_577060]]"
tags:
  - "product"
aliases:
  - "Lance"
generation_complete: true
---

# Lance

## 描述
Lance 是一种列式存储格式，专门针对多模态数据（例如图像、视频）进行了优化。在 [[entities/cortex-aisql|Cortex AISQL]] 论文中，Lance 被提及为外部执行技术栈的一部分，但该论文本身并未深入探讨 Lance 的内部设计或使用细节。它与 [[entities/daft|Daft]] 和 [[entities/ray|Ray]] 等框架一起出现在 Cortex AISQL 的参考技术栈中，主要承担高效存储和读取大规模非结构化数据的角色。

Lance 是一种现代化的列式数据格式，专为机器学习和多模态数据场景设计，支持高效的随机访问和零拷贝读取。在写回过程中，Lance 与 [[entities/psycopg|psycopg]] 和 [[entities/pgvector|pgvector]] 一起作为数据持久化方案，用于存储从 GPU 模型服务返回的向量或结果数据。
## 相关实体
- [[entities/ray|Ray]]
- [[entities/daft|Daft]]
- [[entities/cortex-aisql|Cortex AISQL]]
- [[entities/pgvector|pgvector]]
- [[entities/psycopg|psycopg]]
## 相关概念
（暂无）

- [[concepts/写回瓶颈|写回瓶颈]]与[[concepts/外部执行链路|外部执行链路]]是 Lance 设计中重点应对的性能与架构问题，直接关系到数据管道的吞吐与延迟优化。

## 来源提及

- "不与 Ray/Daft/Lance 无关：Snowflake 使用自研执行引擎" (与 Ray/Daft/Lance 无关：Snowflake 使用自研执行引擎。) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
- "| 写回方式 | 数据库内部自然写回 | psycopg/pgvector/Lance 显式写回 |" (| 写回方式 | 数据库内部自然写回 | psycopg/pgvector/Lance 显式写回 |) — [[raw/papers/gaussml_icde2024|gaussml_icde2024]]
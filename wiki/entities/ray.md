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
  - "Ray framework"
generation_complete: true
---

## 相关实体
- [[entities/daft|Daft]]
- [[entities/lance|Lance]]
- [[entities/snowflake|Snowflake]]
- [[entities/gaussml|GaussML]]

## 相关概念
- [[concepts/外部执行链路|外部执行链路]]

## 描述
Ray 是一个分布式计算框架，常用于构建数据密集型应用。本课题曾考虑使用 Ray 作为外部执行链路的基础，但 [[entities/cortex-aisql|Cortex AISQL]] 论文并未涉及该框架，而 [[entities/snowflake|snowflake]] 使用自研执行引擎。Ray 提供统一的编程模型，支持从单机扩展到大规模集群，广泛应用于强化学习、数据处理和模型服务等场景。

## 来源提及

- "Cortex AISQL 的 AI 算子在 Snowflake 内部执行；不研究“数据库触发后经由外部 worker/Ray/GPU 服务再写回”的路径" (Cortex AISQL 的 AI 算子在 Snowflake 内部执行；不研究“数据库触发后经由外部 worker/Ray/GPU 服务再写回”的路径。) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
- "| ML 算子位置 | 查询引擎内部 | 外部 Ray worker + GPU 模型服务 |" (| ML 算子位置 | 查询引擎内部 | 外部 Ray worker + GPU 模型服务 |) — [[raw/papers/gaussml_icde2024|gaussml_icde2024]]
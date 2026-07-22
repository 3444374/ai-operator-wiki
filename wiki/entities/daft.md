---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/cortex_aisql_sigmod2026_c18b08]]"]
tags: [product]
aliases:
  - "Daft"
generation_complete: true
---


# Daft

## 描述
Daft 是一个基于 [[entities/ray|Ray]] 的分布式 DataFrame 库，专为多模态数据处理（图像、文本、视频、三维点云等）而设计。它在 [[entities/cortex-aisql|Cortex AISQL]] 的相关研究中被作为候选的外部执行技术提及，但最终并未被集成到 [[entities/cortex-aisql|Cortex AISQL]] 的运行时中。Daft 通常与 [[entities/lance|Lance]] 列式格式结合使用，以提供高效的零拷贝数据读取和向量化分析。该库提供了与主流 Python 数据生态类似的 API，并通过 [[entities/ray|Ray]] 的弹性伸缩能力支持大规模并行计算。

## 相关实体
- [[entities/ray|Ray]]
- [[entities/lance|Lance]]
- [[entities/cortex-aisql|Cortex AISQL]]

## 相关概念
暂无。

## 来源提及

- "不与 Ray/Daft/Lance 无关：Snowflake 使用自研执行引擎" (与 Ray/Daft/Lance 无关：Snowflake 使用自研执行引擎。) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources:
  - "[[sources/cortex_aisql_sigmod2026_c18b08]]"
tags:
  - "organization"
aliases:
  - "Snowflake Inc."
  - "Snowflake Computing"
generation_complete: true
---

## 相关实体
- [[entities/cortex-aisql|Cortex AISQL]]
- [[entities/sigmod-2026|SIGMOD 2026]]
- [[entities/llama-3-1-8b|Llama 3.1-8B]]
- [[entities/llama-3-3-70b|Llama 3.3-70B]]

## 相关概念
- [[concepts/ai-embed|AI_EMBED]]
- [[concepts/ai-complete|AI_COMPLETE]]
- [[concepts/ai-filter|AI_FILTER]]
- [[concepts/ai-classify|AI_CLASSIFY]]
- [[concepts/ai-join|AI_JOIN]]
- [[concepts/ai-agg|AI_AGG]]
- [[concepts/ai-aware-query-optimization|AI感知查询优化]]
- [[concepts/adaptive-model-cascading|自适应模型级联]]
- [[concepts/semantic-join-rewrite|语义Join重写]]
- [[concepts/原生-sql-算子集成|原生-sql-算子集成]]
- [[concepts/外部执行链路|外部执行链路]]

## 描述
Snowflake 是一家提供云数据仓库和分析服务的公司，其产品生态中包含 [[entities/cortex-aisql|Cortex AISQL]]。2025 年 7 月至 9 月的生产监控数据显示，AI 算子成为查询成本的主要驱动因素，且约 40% 的查询涉及多表操作，这为外部执行链路研究提供了权威的产业级证据。该公司使用自研执行引擎，不依赖 Ray、Daft 或 Lance 等外部框架。

## 来源提及

- "Snowflake 在生产环境中将六类 AI 算子（EMBED/COMPLETE/FILTER/CLASSIFY/JOIN/AGG）作为 SQL 执行引擎一等公民" (Snowflake 在生产环境中将六类 AI 算子（EMBED/COMPLETE/FILTER/CLASSIFY/JOIN/AGG）作为 SQL 执行引擎的一等公民。) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
- "2025 年 7-9 月生产监控中证实 AI 算子主导查询成本，约 40% 查询涉及多表操作" (2025 年 7-9 月生产监控中证实 AI 算子主导查询成本，约 40% 查询涉及多表操作。) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
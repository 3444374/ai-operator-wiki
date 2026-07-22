---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources:
  - "[[sources/cortex_aisql_sigmod2026_c18b08]]"
tags:
  - "product"
aliases:
  - "Cortex AISQL"
  - "Snowflake Cortex AISQL"
generation_complete: true
---

# Cortex AISQL

## 描述
Cortex AISQL 是 [[entities/snowflake|Snowflake]] 推出的生产级 SQL 引擎，原生集成 AI 算子，可直接在 SQL 查询中对非结构化数据执行语义操作。该系统在 [[entities/sigmod-2026|SIGMOD 2026]] 会议上以 Companion Paper 形式发表。Cortex AISQL 定义了六种 AI SQL 算子：`AI_EMBED`、`AI_COMPLETE`、`AI_FILTER`、`AI_CLASSIFY`、`AI_JOIN` 和 `AI_AGG`/`AI_SUMMARIZE_AGG`。在查询处理中，引擎实现了 [[concepts/ai-aware-query-optimization|AI-aware query optimization]]、[[concepts/adaptive-model-cascading|Adaptive model cascading]] 与 [[concepts/semantic-join-rewrite|Semantic join rewrite]] 三项核心技术，结合 [[concepts/llm-inference-cost-model|LLM inference cost model]] 和 [[concepts/predicate-pull-up|Predicate pull-up]] 等策略，显著降低了大规模 LLM 推理成本。

生产数据分析显示约40%的查询涉及多表操作，AI 算子主导查询成本。作为闭源系统，其内部执行阶段和批处理构造策略不可见，与外部执行框架无直接关系。
## 相关实体
- [[entities/snowflake|Snowflake]]
- [[entities/sigmod-2026|SIGMOD 2026]]
- [[entities/llama-3-1-8b|Llama 3.1-8B]]
- [[entities/llama-3-3-70b|Llama 3.3-70B]]
- [[entities/nq-dataset|NQ dataset]]
- [[entities/cnn-dataset|CNN dataset]]

## 相关概念
- [[concepts/ai-aware-query-optimization|AI-aware query optimization]]
- [[concepts/adaptive-model-cascading|Adaptive model cascading]]
- [[concepts/semantic-join-rewrite|Semantic join rewrite]]
- [[concepts/ai-sql-operators|AI SQL operators]]
- [[concepts/llm-inference-cost-model|LLM inference cost model]]
- [[concepts/predicate-pull-up|Predicate pull-up]]

## 来源提及

- "Cortex AISQL: A Production SQL Engine for Unstructured Data." (Cortex AISQL：面向非结构化数据的生产级 SQL 引擎。) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
- "Snowflake 在生产环境中将六类 AI 算子（EMBED/COMPLETE/FILTER/CLASSIFY/JOIN/AGG）作为 SQL 执行引擎一等公民" (Snowflake 在生产环境中将六类 AI 算子（EMBED/COMPLETE/FILTER/CLASSIFY/JOIN/AGG）作为 SQL 执行引擎的一等公民。) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
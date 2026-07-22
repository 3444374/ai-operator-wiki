---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources:
  - "[[sources/cortex_aisql_sigmod2026_c18b08]]"
tags:
  - "term"
aliases:
  - "AI 语义过滤算子"
  - "semantic filter"
  - "AI predicate"
  - "AI 谓词"
generation_complete: true
---

## 相关概念
- [[concepts/ai-aware-query-optimization|AI 感知查询优化]]
- [[concepts/predicate-pull-up|谓词上拉]]
- [[concepts/llm-inference-cost-model|LLM 推理成本模型]]
- [[concepts/ai_classify|AI_CLASSIFY]]
- [[concepts/ai_join|AI_JOIN]]
- [[concepts/ai_agg|AI_AGG]]
- [[concepts/ai-sql-operators|AI SQL 算子]]

## 相关实体
- [[entities/cortex-aisql|Cortex AISQL]]

## 定义
AI_FILTER 是 [[entities/cortex-aisql|Cortex AISQL]] 中用于语义过滤的 SQL 算子，返回布尔值。它通过调用大语言模型对每一行进行语义条件判断，实现基于文本含义的行级过滤。

## 关键特征
- 基于语义的布尔谓词，判断行是否满足特定的语义标准（如“是否包含负面情绪”）
- 每行触发一次 LLM 推理，计算开销极高，低效使用可导致数百万次调用
- 传统查询优化器的谓词下推策略会引发灾难性性能，因为 AI_FILTER 算子被过早应用于全表数据
- 是 AI 感知查询优化的核心优化目标：通过将昂贵的 AI_FILTER 上拉到 Join 等操作之后，结合传统过滤先缩小数据集，可将 LLM 调用减少约 300 倍

## 应用
- 文本数据的语义筛选：如根据文档内容过滤、评论情感分析过滤等
- 与 [[concepts/ai-aware-query-optimization|AI 感知查询优化]] 协作，确保在大规模表上仍能高效执行语义过滤

## 来源提及

- "AI_FILTER：语义过滤（布尔）/ AI predicate" (AI_FILTER：语义过滤（布尔）/ AI 谓词) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
- "传统优化器无条件将谓词下推到靠近扫描的位置，但 AI 谓词（AI_FILTER）的每行推理成本极高——对百万行表盲目下推会导致数十万次 LLM 调用" (传统优化器无条件将谓词下推到靠近扫描的位置，但 AI 谓词（AI_FILTER）的每行推理成本极高——对百万行表盲目下推会导致数十万次 LLM 调用) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
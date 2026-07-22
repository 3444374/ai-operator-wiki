---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/cortex_aisql_sigmod2026_c18b08]]"]
tags: [term]
aliases:
  - "AI 语义聚合算子"
  - "AI_SUMMARIZE_AGG"
  - "semantic aggregation operator"
generation_complete: true
---


# AI_AGG

## 定义
AI_AGG 是 [[entities/cortex-aisql|Cortex AISQL]] 中用于语义聚合与摘要的 AI SQL 算子，核心变体为 `AI_SUMMARIZE_AGG`。它利用大语言模型（LLM）对非结构化文本进行语义理解，使 SQL 能够对自由文本执行超出传统统计（如 `COUNT`、`SUM`）的语义级聚合操作。作为 [[concepts/ai-sql-operators|AI SQL 算子]] 之一的 AI_AGG，其执行代价被纳入 [[concepts/ai-aware-query-optimization|AI 感知查询优化]] 的代价模型，并可受益于 [[concepts/adaptive-model-cascading|自适应模型级联]] 等优化技术。

## 关键特征
- **语义聚合**：基于 LLM 的理解能力，对文本内容进行高层语义抽象，而非简单的计数或求和。
- **算子变体**：主要包括 `AI_SUMMARIZE_AGG`，用于生成文本摘要，如对多行文档输出统一摘要。
- **优化器集成**：参与 [[concepts/ai-aware-query-optimization|AI 感知查询优化]] 的代价估算，帮助规划 AI 算子的执行策略。
- **性能敏感**：生产数据表明 AI 算子总成本占查询主导，而 AI_AGG 是其中重要的组成部分，优化其推理开销对整体性能至关重要。
- **降本增效**：能够利用 [[concepts/adaptive-model-cascading|自适应模型级联]] 等机制，在保证聚合质量的同时降低 LLM 推理成本。

## 应用
- **文本摘要**：对用户评论、客服对话、新闻文章等长文本字段进行自动摘要，产出单行或多行语义浓缩结果。
- **语义归并**：在数据分析中，将语义相近的文本行合并为一个有代表性的聚合行，用于报表或特征工程。
- **高级查询**：在 SELECT 语句中直接嵌入 `AI_AGG(...)`，让非结构化数据也能像结构化数据一样进行“GROUP BY”语义分析。
- **与其它算子组合**：常与 [[concepts/ai_filter|AI_FILTER]]、[[concepts/ai_classify|AI_CLASSIFY]] 等算子协作，构成端到端的智能数据流水线。

## 相关概念
- [[concepts/ai_embed|AI_EMBED]]：AI 嵌入算子
- [[concepts/ai_complete|AI_COMPLETE]]：AI 文本生成算子
- [[concepts/ai_filter|AI_FILTER]]：AI 语义过滤算子
- [[concepts/ai_classify|AI_CLASSIFY]]：AI 分类算子
- [[concepts/ai_join|AI_JOIN]]：AI 语义连接算子
- [[concepts/ai-sql-operators|AI SQL 算子]]：六大 AI SQL 算子体系
- [[concepts/llm-inference-cost-model|LLM 推理成本模型]]
- [[concepts/ai-aware-query-optimization|AI 感知查询优化]]
- [[concepts/adaptive-model-cascading|自适应模型级联]]

## 相关实体
- [[entities/cortex-aisql|Cortex AISQL]]

## 来源提及

- "AI_AGG / AI_SUMMARIZE_AGG：语义聚合/摘要 / 高级分析" (AI_AGG / AI_SUMMARIZE_AGG：语义聚合/摘要 / 高级分析) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
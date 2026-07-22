---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/cortex_aisql_sigmod2026_c18b08]]"]
tags: [term]
aliases:
  - "Six AI SQL operators"
  - "六大 AI SQL 算子"
  - "AI SQL 算子"
generation_complete: true
---


# AI SQL operators

## 定义
**AI SQL operators** 是由 [[entities/cortex-aisql|Cortex AISQL]] 定义的一组六个 AI 原生 SQL 算子，使关系型 SQL 引擎能够直接在非结构化数据上执行语义操作。这些算子以声明式、集成的形式将 AI 能力（如嵌入、生成、分类、语义过滤和聚合）内嵌于查询执行计划中，从而替代传统以用户自定义函数（UDF）调用 AI 模型的碎片化方式，并允许查询优化器对端到端查询进行代价驱动、全局最优的优化。

## 关键特征
- **六个原生算子：** 包含 [[concepts/ai_embed|AI_EMBED]]（生成向量嵌入）、AI_COMPLETE（自然语言文本生成）、AI_FILTER（基于语义的布尔过滤）、AI_CLASSIFY（多标签或单标签分类）、AI_JOIN（语义相似性连接）和 AI_AGG（语义摘要/聚合），覆盖从低层特征提取到高层推理的完整语义处理链
- **声明式集成：** 算子直接作为 `SELECT`、`FROM`、`WHERE`、`GROUP BY` 等标准 SQL 子句的一部分出现，无需调用外部函数框架
- **优化器感知：** 算子暴露成本模型、选择度估计与代数性质，使查询优化器能够进行 [[concepts/ai-aware-query-optimization|AI 感知查询优化]]，自动重排序、重写或下推操作以最小化推理成本
- **替代黑盒 UDF：** 将 AI 能力从孤立的 UDF 提升为一等公民的代数算子，使引擎可以应用关系等价变换（如语义连接转文本过滤、自适应模型级联）
- **语义连接扩展：** AI_JOIN 支持基于语义相似度或分类结果的连接，配合 [[concepts/semantic-join-rewrite|语义连接重写]] 技术在真实分布数据上优化执行路径

## 应用
- **非结构化数据 SQL 分析：** 允许用户使用标准 SQL 对文档、文本、图像等数据进行相似性搜索、分类和聚类，无需编写 Python/ML 代码
- **检索增强生成（RAG）管线：** 在 AI_EMBED 生成向量后，通过 AI_JOIN 检索相关上下文，再由 AI_COMPLETE 生成回答，全程在 SQL 查询内完成
- **自动报告生成：** 利用 AI_AGG 对分组内文档进行摘要，结合 AI_CLASSIFY 标签，生成结构化分析报告
- **语义过滤与路由：** AI_FILTER 用于精确判别文本是否满足条件，可作为查询中的布尔门控，提升后续算子效率
- **成本敏感部署：** 通过 [[concepts/ai-aware-query-optimization|AI 感知查询优化]]，系统能在多个质量‑延迟‑成本不同的模型间自动选择，保证业务目标

## 相关概念
- [[concepts/ai-aware-query-optimization|AI 感知查询优化]]
- [[concepts/semantic-join-rewrite|语义连接重写]]
- [[concepts/adaptive-model-cascading|自适应模型级联]]
- [[concepts/ai_embed|AI_EMBED]]

## 相关实体
- [[entities/cortex-aisql|Cortex AISQL]]
- [[entities/snowflake|Snowflake Inc.]]

## Mentions in Source
- “Cortex AISQL 定义了六个 AI 原生 SQL 算子——AI_EMBED, AI_COMPLETE, AI_FILTER, AI_CLASSIFY, AI_JOIN, AI_AGG——作为一等公民的代数算子，使查询优化器能够进行代价驱动的整体优化。”（参见 [[sources/cortex_aisql_sigmod2026_c18b08]]）

## 来源提及

- "六类 AI 算子（EMBED/COMPLETE/FILTER/CLASSIFY/JOIN/AGG）作为 SQL 执行引擎一等公民" (六类 AI 算子（EMBED/COMPLETE/FILTER/CLASSIFY/JOIN/AGG）作为 SQL 执行引擎的一等公民。) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
- "AI_FILTER 的每行推理成本极高——对百万行表盲目下推会导致数十万次 LLM 调用" (AI_FILTER 的每行推理成本极高——对百万行表盲目下推会导致数十万次 LLM 调用。) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
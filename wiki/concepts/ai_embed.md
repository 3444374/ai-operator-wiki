---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/cortex_aisql_sigmod2026_c18b08]]"]
tags: [term]
aliases:
  - "AI 嵌入算子"
  - "embedding operator"
generation_complete: true
---


# AI_EMBED

## 定义
AI_EMBED 是 [[entities/cortex-aisql|Cortex AISQL]] 中六类 AI SQL 算子之一，专门用于生成向量嵌入。该算子能够从非结构化数据（如文本、图像）中提取语义向量，并能被 SQL 查询优化器进行代价感知的调度与执行，而非简单的用户自定义函数（UDF）调用，体现了 AI 能力在 SQL 引擎中的深度集成。

## 关键特征
- **一等公民的 SQL 算子**：AI_EMBED 由查询优化器直接管理，具备完整的代价模型与执行计划选择，区别于传统 UDF 的被动执行。
- **嵌入生成核心**：专注于将非结构化输入转换为固定维度的向量表示，支撑语义搜索、相似度计算等下游任务。
- **RAG 摄入支持**：典型应用场景包括检索增强生成（RAG）的数据摄入阶段，将原始文档预处理为向量后写入向量存储或表。
- **AI SQL 生态组件**：与 [[concepts/ai-complete|AI_COMPLETE]]、[[concepts/ai-filter|AI_FILTER]]、[[concepts/ai-classify|AI_CLASSIFY]]、[[concepts/ai-join|AI_JOIN]]、[[concepts/ai-agg|AI_AGG]] 等算子共同构成完整的 AI SQL 功能栈，是 [[entities/snowflake|Snowflake]] 将 AI 融入声明式查询语言的关键组成部分。

## 应用
- **非结构化数据向量化**：在 SQL 查询中对文本列调用 AI_EMBED，实时生成语义向量，用于后续的相似度匹配或聚类。
- **RAG 流水线摄入**：在数据加载或 ETL 过程中，通过 AI_EMBED 为文档生成向量嵌入，构建向量索引，支持检索式问答系统。
- **混合查询加速**：结合普通 SQL 谓词与向量距离计算，利用优化器选择最优执行路径，避免数据在 AI 引擎与数据库之间的频繁搬运。

## 相关概念
- [[concepts/ai-complete|AI_COMPLETE]] – 文本生成算子
- [[concepts/ai-filter|AI_FILTER]] – AI 过滤算子
- [[concepts/ai-classify|AI_CLASSIFY]] – AI 分类算子
- [[concepts/ai-join|AI_JOIN]] – AI 连接算子
- [[concepts/ai-agg|AI_AGG]] – AI 聚合算子

## 相关实体
- [[entities/cortex-aisql|Cortex AISQL]] – 包含 AI_EMBED 的 Snowflake AI SQL 引擎
- [[entities/snowflake|Snowflake]] – 开发和托管该算子的云数据平台

## 来源提及

- "AI_EMBED：生成向量 / embedding / RAG ingestion" (AI_EMBED：生成向量 / embedding / RAG 摄入) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
- "Snowflake 在生产环境中将六类 AI 算子（EMBED/COMPLETE/FILTER/CLASSIFY/JOIN/AGG）作为 SQL 执行引擎一等公民" (Snowflake 在生产环境中将六类 AI 算子（EMBED/COMPLETE/FILTER/CLASSIFY/JOIN/AGG）作为 SQL 执行引擎一等公民) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
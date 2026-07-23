---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/galois_sigmod2025_c4af88]]"]
tags: [product]
aliases:
  - "TAG"
  - "TAG system"
  - "Text2SQL is Not Enough"
generation_complete: true
---


# TAG

## 描述
TAG是由Biswal等人于2024年提出的系统，其核心主张是“Text2SQL is Not Enough”——仅依赖自然语言到SQL的转换无法完全满足从大语言模型（LLMs）中提取结构化数据的复杂需求。[[entities/galois|Galois]]在研究中将TAG视为重要的背景工作，并明确指出需要更深入的查询优化以及LLM感知的处理策略。TAG在[[entities/galois|Galois]]的后续阅读计划中被列为[[concepts/db4ai|DB4AI]]领域的关键参考文献。该系统主要关注如何超越传统的[[concepts/text2sql|Text2SQL]]范式，以实现更高效的[[concepts/llm-based-query-processing|LLM-based query processing]]。

## 相关实体
- [[entities/galois|Galois]]
- [[entities/lotus|LOTUS]]

## 相关概念
- [[concepts/db4ai|DB4AI]]
- [[concepts/text2sql|Text2SQL]]
- [[concepts/llm-based-query-processing|LLM-based query processing]]

## 来源提及

- "后续待读：**TAG** (Biswal et al., 2024) — "Text2SQL is Not Enough"，Galois 引用中提及" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
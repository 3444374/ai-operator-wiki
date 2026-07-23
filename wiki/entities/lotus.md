---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/galois_sigmod2025_c4af88]]"]
tags: [product]
aliases:
  - "LOTUS semantic query system"
  - "Patel et al. 2024 LOTUS"
generation_complete: true
---


# LOTUS

## 描述
LOTUS 是一个由 Patel 等人于 2024 年提出的语义查询系统，旨在对半结构化和非结构化数据提供类似 SQL 的查询能力。该系统通过大型语言模型（LLMs）增强语义解析，使传统 SQL 能够迁移到非关系型、文档型或混合数据场景中，属于 [[concepts/db4ai|DB4AI]] 方向的重要实践。在 [[entities/galois|Galois]] 论文中，LOTUS 被明确列为相关工作和未来需深入对比的系统，表明其在 LLM 驱动的语义查询优化方面具有潜在创新价值。Galois 将其视为完善 DB4AI 文献地图的关键研究对象，预示着两者在数据提取流水线、成本模型与精度权衡等方面存在直接对话空间。

## 相关实体
- [[entities/galois|Galois]] — 将 LOTUS 列为未来需要对比和分析的系统
- [[entities/tag|TAG]] — 同为面向非结构化数据的查询抽象，可能涉及语义执行的对比

## 相关概念
- [[concepts/db4ai|DB4AI]] — LOTUS 属于数据库与人工智能交叉领域的研究
- [[concepts/semantic-query-execution|Semantic query execution]] — LOTUS 的核心技术方向，用语义理解替代传统语法匹配

## 来源提及

- "后续待读：**LOTUS** (Patel et al., 2024) — 另一语义查询系统，Galois 引用中提及" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
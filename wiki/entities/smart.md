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
  - "Smart Rewriting System"
  - "VLDB 2025 Smart"
generation_complete: true
---

# Smart

## 描述
Smart 是发表于 VLDB 2025 的一个推理重写系统，专注于对数据库中的 AI 算子进行显式重写与代价优化。与 [[entities/cortex-aisql|Cortex AISQL]] 相比，Smart 的算法设计更精细，其代价模型和重写策略在学术层面更为深入。然而，Smart 缺乏大规模生产环境的部署经验，主要代表了一种偏向学术的优化方法。[[entities/cortex-aisql|Cortex AISQL]] 的优势则在于拥有丰富的产业生产数据，两者在 DB4AI 的研究路线上形成了鲜明对照。同时，Smart 也与 [[entities/gaussml|GaussML]] 等系统共同构成了数据库内 AI 推理优化的技术生态。

## 相关实体
- [[entities/cortex-aisql|Cortex AISQL]]
- [[entities/gaussml|GaussML]]

## 相关概念
- [[concepts/ai-aware-query-optimization|AI-aware query optimization]]
- [[concepts/semantic-join-rewrite|语义 Join 重写]]

## 来源提及

- "比 Smart（VLDB 2025）多了产业生产数据，少了算法深度（Smart 的推理重写比 Cortex 的代价模型更精细）。" (比 Smart（VLDB 2025）多了产业生产数据，少了算法深度（Smart 的推理重写比 Cortex 的代价模型更精细）。) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
- "比 **Smart**（VLDB 2025）多了数据库内训练能力，少了查询优化深度（Smart 的推理重写更精细）" — [[raw/papers/gaussml_icde2024|gaussml_icde2024]]
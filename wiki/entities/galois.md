---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources:
  - "[[sources/readme_425fbb]]"
  - "[[sources/galois_sigmod2025_c4af88]]"
  - "[[sources/gaussml_icde2024_577060]]"
tags:
  - "product"
aliases:
  - "Galois 框架"
  - "Galois Framework"
generation_complete: true
---

## 相关实体
- [[entities/andb|AnDB]]
- [[entities/leads|LEADS]]
- [[entities/university-of-basilicata|巴斯利卡塔大学]]
- [[entities/eurecom|EURECOM]]
- [[entities/gaussml|GaussML]]

## 相关概念
- [[concepts/llmscan|LLMScan 逻辑算子]]
- [[concepts/table-scan|Table-Scan 物理算子]]
- [[concepts/key-scan|Key-Scan 物理算子]]
- [[concepts/confidence-based-optimization|置信度驱动优化]]
- [[concepts/llm-as-storage|LLM作为存储层]]
- [[concepts/ai_join|AI Join]]
- [[concepts/ai_filter|AI Filter]]
- [[concepts/ai-aware-query-optimization|AI感知查询优化]]
- [[concepts/db4ai|DB4AI]]

## 描述
Galois 是一个专门针对大型语言模型（LLM）上 SQL 查询优化的逻辑与物理优化框架。它扩展了传统数据库的[[concepts/查询计划|查询计划]]生成方式，将[[concepts/语义操作|语义操作]]（如[[concepts/ai_join|AI Join]]、[[concepts/ai_filter|AI Filter]]）纳入优化空间，并提供了逻辑计划与物理计划的变体图，用以展示不同优化决策的代价与收益。该框架通过运行示例（running example）演示了从语法解析到代价模型评估的完整流程，是研究[[concepts/ai-aware-query-optimization|AI感知查询优化]]的具体系统实现。Galois 的设计范式可关联查询重写、语义连接等概念，为[[entities/andb|AnDB]]和[[entities/leads|LEADS]]等数据系统在 AI 算子优化方面提供了参考。

## 来源提及

- "`3725411.pdf` | Logical and Physical Optimizations for SQL Query Execution over Large Language Models | 28 | Galois；学习 SQL running example、logical/physical plan 变体图" (`3725411.pdf` | 大型语言模型上SQL查询的逻辑与物理优化 | 28 | Galois；用于学习SQL运行示例和逻辑/物理计划变体图) — [[raw/papers/README|README]]
- "Galois 作为 SQL 查询和 LLM 之间的中间件，将 LLM 视为“存储层”，设计了 LLM 专用的 Table-Scan / Key-Scan 物理算子 + 基于置信度的逻辑/物理优化，比直接 NL 提问质量提升 144%，比直接 SQL 质量提升 29%，且比同类多步 baseline 节省 11 倍 token 成本。" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
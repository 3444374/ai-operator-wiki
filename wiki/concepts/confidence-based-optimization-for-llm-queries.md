---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources:
  - "[[sources/galois_sigmod2025_c4af88]]"
tags:
  - "method"
aliases:
  - "confidence-driven optimization"
  - "LLM confidence estimation in queries"
  - "Physical optimization for LLM queries"
  - "Logical optimization for LLM queries"
generation_complete: true
---

# Confidence-based optimization for LLM queries

## 定义
Confidence-based optimization for LLM queries 是 Galois 系统提出的一种查询优化方法。它利用大语言模型（LLM）自身的分类能力，为 SQL 风格查询中的每个 `WHERE` 谓词分配置信度（高/低），并汇总为 0–1 区间的整体置信度分数。系统根据该分数决定条件下推策略（无下推 / 单条件 / 全条件）并选择物理算子（Key-Scan 或 Table-Scan）。该方法无需预先知道数据分布或直方图，完全依赖 LLM 的自我评估。

## 关键特征
- **LLM 自评估**：直接利用 LLM 对每个谓词的可执行性进行分类，输出“高置信度”或“低置信度”，无需外部词典或统计信息。
- **置信度聚合**：多个谓词的置信度被聚合为一个全局分数，用于量化整个查询条件在 LLM 执行下的可靠性。
- **策略选择**：根据置信度分数自动选择下推策略：
  - **分数极低** → 无下推（全表扫描后由 LLM 过滤）
  - **分数中等** → 单条件 Key-Scan（仅利用最优谓词）
  - **分数较高** → 全条件下推（Key-Scan 或 Table-Scan 视情况而定）
- **与物理算子联动**：结果直接映射到 [[concepts/llmscan-operator|LLMScan operator]] 的实现选择——Key-Scan（直接 LLM 比较）或 Table-Scan（全表扫描后 LLM 过滤）。
- **无分布假设**：不依赖任何数据统计、直方图或查询历史，仅凭 LLM 的语义判断。
- **实验效果**：在评估中实现 75% 的最优计划选择准确率。

## 应用
- **语义查询优化**：在结构化与非结构化数据混合查询中，用于自动决定过滤条件是在“索引”阶段（Key-Scan）还是“扫描后”阶段（Table-Scan）由 LLM 执行。
- **LLM‑原生数据库系统**：如 Galois 系统，用于在没有传统优化器统计信息的环境中降低 LLM 调用成本并提高查询效率。
- **自适应查询执行**：对同一查询的不同实例（如不同参数或不同数据切片）能够动态调整计划，无需人工干预。

## 相关概念
- [[concepts/llmscan-operator|LLMScan operator]]
- [[concepts/key-scan|Key-Scan (physical operator)]]
- [[concepts/table-scan|Table-Scan (physical operator)]]
- [[concepts/filter-llmscan|Filter-LLMScan]]
## 相关实体
- [[entities/galois|Galois]]

## 来源提及

- "用 LLM 自己的判断来优化 LLM 的查询计划。" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
- "利用 LLM 的分类能力评估每个 WHERE 谓词的置信度（high/low），只下推 high 置信度的条件" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/galois_sigmod2025_c4af88]]"]
tags: [term]
aliases:
  - "Average Score"
  - "AVG Score metric"
generation_complete: true
---


# AVG-Score

## 定义
AVG‑Score（Average Score）是 Galois 论文中提出的一个综合评价指标，用于量化大语言模型在 SQL 查询下生成结构化数据的整体质量。它定义为三个子指标的无加权算术平均：F1‑Cell（单元格级精确率与召回率的 F1 分数）、Cardinality（返回行数与真实行数的一致性）和 Tuple Constraint（元组级约束满足度）。通过将多维度的评估压缩为单一数值，AVG‑Score 使不同查询方法（如自然语言直接提问、原始 SQL 执行、Galois 优化）能够被直接比较。

## 关键特征
- **多维聚合**：综合了单元格级别的值匹配（F1‑Cell）、结果基数正确性（Cardinality）以及元组维度的语义约束满足（Tuple Constraint），避免了单一指标的片面性。
- **无偏平均**：三个子指标权重相等，不做主观加权，确保评估结果具有可复现性和统一基准。
- **方法对比标尺**：为 NL‑to‑SQL、直接 SQL、Galois 等不同查询入口提供共同的比较平台，实验报告中常以百分提升（如 144%）直观展示改进幅度。
- **上下文敏感**：在信息缺失（IK, Informationless Knowledge）场景下尤其能暴露纯自然语言方法的不足，凸显 LLM 推理与 SQL 执行相结合的必要性。

## 应用
- **查询性能对比**：在 Galois 论文的实验部分，用于横评 NL 直接提问、原始 SQL 与 Galois 优化路径在 Fortune、Movies、Scholar 等数据集上的输出质量。
- **消融实验基准**：通过固定其他组件，观察不同优化策略（如信心阈值、token 预算）对 AVG‑Score 的影响，从而指导参数选择。
- **自动化评估流水线**：可集成到持续测试框架中，当模型升级或提示词变更时自动计算 AVG‑Score，防止回退。

## 相关概念
- [[concepts/confidence-based-optimization-for-llm-queries|Confidence-based optimization for LLM queries]]
- [[concepts/token-cost-comparison|Token cost comparison]]
- [[concepts/f1-cell|F1-Cell]]
- [[concepts/cardinality-metric|Cardinality metric]]
- [[concepts/tuple-constraint|Tuple Constraint]]

## 相关实体
- [[entities/galois|Galois]]
- [[entities/palimpzest|Palimpzest]]

## 来源提及

- "评价指标：**质量**：F1-Cell、Cardinality、Tuple Constraint、AVG-Score（前三者平均）；**成本**：#Tokens、Time（秒）" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
- "质量提升 vs NL | 144% AVG-Score 提升（0.254 → 0.622）" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
- "质量提升 vs SQL | 29% AVG-Score 提升（0.481 → 0.622）" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
- "RAG 场景质量 | AVG-Score 0.711（vs Palimpzest 0.720，但 token 仅 1/11）" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
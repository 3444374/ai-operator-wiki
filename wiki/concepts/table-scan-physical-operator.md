---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/galois_sigmod2025_c4af88]]"]
tags: [method]
aliases:
  - "Table-Scan"
  - "Table Scan"
  - "table-scan (physical operator)"
generation_complete: true
---


# Table-Scan (physical operator)

## 定义
Table‑Scan 是 [[entities/galois|Galois]] 系统中实现的一种物理扫描算子，用于在结构化数据上执行 **LLM 驱动的低置信度全表检索**。它通过迭代式提示逐行获取所有属性值，利用语言模型的上下文记忆提高召回率；当查询处理的置信度低于预设阈值时触发，作为扩大扫描范围的后备策略。

## 关键特征
- **迭代式逐行提取**：为每一行构建提示，一次性请求该行所有约定属性，逐步覆盖整张表
- **上下文记忆提升召回**：连续迭代将之前行的结果嵌入提示上下文，让 LLM 保持列语义一致性，减少信息遗漏
- **置信度驱动触发**：仅在索引扫描或其他算子输出置信度不足时激活，避免无谓的令牌开销
- **成本-质量权衡**：相比 [[concepts/key-scan-physical-operator|Key-Scan (physical operator)]]，单行令牌消耗更低，但属性值准确性可能稍弱（因缺少列级因子化）
- **适用场景**：数据高度不确定、需要最大召回率的全表检索，或对延迟不敏感、重视覆盖率的批量分析

## 应用
- **Galois 自动降级扫描**：在结构化问答流水线中，当关键索引匹配得分低于阈值，查询引擎自动从定向检索退化为 Table‑Scan，保证答案召回
- **高覆盖数据审核**：需要验证全表所有记录是否满足某一条件时，可以用较低成本的 Table‑Scan 代替逐列精细检索
- **低预算环境**：在令牌配额紧张或 API 单价敏感的场景，优先使用 Table‑Scan 替代 Key‑Scan 以控制开销

## 相关概念
- [[concepts/key-scan-physical-operator|Key-Scan (physical operator)]]
- [[concepts/confidence-based-optimization-for-llm-queries|Confidence-based optimization for LLM queries]]

## 相关实体
- [[entities/galois|Galois]]

## 来源提及

- "Table-Scan 直接迭代式 prompt 获取所有属性值，利用上下文记忆提高召回" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
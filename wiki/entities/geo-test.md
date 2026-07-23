---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: []
tags: [other]
aliases:
  - "Geo-Test Dataset"
  - "Geo-Test 数据集"
generation_complete: true
---


# Geo-Test

## 描述
Geo-Test 是 [[entities/galois|Galois]] 论文中专门用于校准置信度阈值 τ 的数据集。该数据集包含结构化地理知识，其核心作用是帮助系统在不同数据分布下确定 Key-Scan 与 Table-Scan 的最优选择分界线。通过 Geo-Test 的标定，[[concepts/confidence-based-optimization-for-llm-queries|Confidence-based Optimization for LLM Queries]] 能够在查询时动态平衡搜索精度与计算开销。

## 相关实体
- [[entities/galois|Galois]]

## 相关概念
- [[concepts/confidence-based-optimization-for-llm-queries|Confidence-based Optimization for LLM Queries]]

## 来源提及

- "Geo-Test（阈值校准）" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
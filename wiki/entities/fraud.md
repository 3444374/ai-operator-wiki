---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/inferdb_pvldb2024_424566]]"]
tags: [other]
aliases:
  - "Fraud 数据集"
  - "信用卡欺诈数据集"
  - "Credit Card Fraud Dataset"
generation_complete: true
---


# Fraud

## 描述
Fraud 是一个用于信用卡欺诈检测的二分类数据集，包含约 284k 条交易记录。该数据集被用于评估 [[entities/inferdb|InferDB]] 在小规模分类任务上的推理延迟与精度，实验表明，InferDB 的单条推理延迟相比 [[entities/scikit-learn|scikit-learn]] pipeline 降低了约 3 个数量级（~50ms → ~0.02ms），展示出基于索引的近似预测在实时风控场景中对较低复杂度模型的巨大加速潜力。Fraud 属于 [[concepts/structured-data|Structured Data]] 类型，其模型选择与评估常结合 [[concepts/test-miss-rate|Test-miss-rate]] 等指标以量化近似推理的可靠性。

## 相关实体
- [[entities/scikit-learn|scikit-learn]] — 作为对照的传统机器学习工具链，推理延迟较高
- [[entities/inferdb|InferDB]] — 利用 Fraud 数据集验证其近似预测引擎性能的系统

## 相关概念
- [[concepts/test-miss-rate|Test-miss-rate]] — 用于量化近似预测中漏判率的评估指标
- [[concepts/structured-data|Structured Data]] — 该数据集的数据形式为结构化表格数据

## 来源提及

- "数据集 6 个：NYC-rides（1.5M 行程，回归）、Pollution（106M 记录，回归）、Fraud（284k 交易，二分类）、Hits（143k 歌曲，二分类）、Digits/MNIST（70k 手写数字，多分类 10 类）、Rice（75k 图像，多分类 5 类）" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
- "推理延迟提升 vs ML pipeline: ~3 orders of magnitude（~50ms → ~0.02ms）" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
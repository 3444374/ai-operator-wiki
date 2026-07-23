---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/inferdb_pvldb2024_424566]]"]
tags: [product]
aliases:
  - "XGBoost"
  - "eXtreme Gradient Boosting"
generation_complete: true
---


# XGBoost

## 描述
XGBoost (eXtreme Gradient Boosting) 是一种基于梯度提升决策树的集成学习算法，因其高性能和准确性在结构化数据的回归与分类任务中占据主导地位。在 InferDB 的评估中，XGBoost 被用作多个数据集（如 Pollution、Hits）的预测模型，实验将原生 XGBoost 推理与 [[entities/inferdb|InferDB]] 的 Index-based 近似推理进行对比，以测量延迟与精度变化。结果显示，对于适合离散化的结构化任务，InferDB 能在保持近似精度的同时，大幅加速 XGBoost 的推理过程。该算法与 [[entities/scikit-learn|Scikit-learn]] 生态紧密集成，并常与 [[entities/lightgbm|LightGBM]] 作为同类梯度提升方法进行比较。

## 相关实体
- [[entities/scikit-learn|Scikit-learn]]
- [[entities/lightgbm|LightGBM]]
- [[entities/inferdb|InferDB]]

## 相关概念
- 暂无

## Mentions in Source
- “We trained XGBoost models on the Pollution and Hits datasets to evaluate the latency and accuracy of our Index-based approximate inference.” — [[sources/inferdb_pvldb2024_424566]]

## 来源提及

- "Batch 推理 vs XGBoost: ~500s → ~8s（~60× speedup）" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
- "InferDB 的实验针对的是传统 ML 模型（LR/NN/XGBoost/LightGBM）" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
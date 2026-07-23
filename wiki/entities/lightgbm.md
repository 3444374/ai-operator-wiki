---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/inferdb_pvldb2024_424566]]"]
tags: [product]
aliases:
  - "Light Gradient Boosting Machine"
  - "Light GBM"
generation_complete: true
---


# LightGBM

## 描述
LightGBM 是由微软提出并开源的高效梯度提升框架，采用基于直方图的决策树算法（Histogram Algorithm）和叶子优先（Leaf-wise）的树生长策略，相比传统 GBDT 在训练速度和内存使用上有显著优势。在 [[entities/inferdb|InferDB 系统]] 的实验中，LightGBM 与 [[entities/xgboost|XGBoost]] 一同被用作传统 ML 模型代表，验证有监督离散化的近似推理能力。论文指出，即使是对预测精度要求较高的 LightGBM 模型，通过构建 [[concepts/prediction-table|Prediction Table]]，也能在保持可接受误差的前提下实现 2–3 个数量级的查询延迟降低。LightGBM 还广泛集成于 [[entities/scikit-learn|Scikit-learn]] 等主流机器学习工具链，适用于竞赛与工业场景。

## 相关实体
- [[entities/inferdb|InferDB 系统]]
- [[entities/xgboost|XGBoost]]
- [[entities/scikit-learn|Scikit-learn]]

## 相关概念
- [[concepts/gradient-boosting|Gradient Boosting]]
- [[concepts/histogram-algorithm|Histogram 算法]]
- [[concepts/leaf-wise-tree-growth|Leaf-wise 树生长]]
- [[concepts/prediction-table|Prediction Table]]

## 来源提及

- "InferDB 的实验针对的是传统 ML 模型（LR/NN/XGBoost/LightGBM）" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
- "模型类型：LR/NN/XGBoost/LightGBM" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
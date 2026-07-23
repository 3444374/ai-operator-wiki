---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/inferdb_pvldb2024_424566]]"]
tags: [other]
aliases:
  - "Pollution 数据集"
  - "污染数据集"
  - "Pollution dataset"
generation_complete: true
---


# Pollution

## 描述
Pollution 是一个大规模回归任务数据集，包含约 1.06 亿条记录，用于评估[[concepts/prediction-table|Prediction Table]]与有监督离散化方法在超大规模数据上的推理加速效果。在[[entities/inferdb|inferdb]]的实验中，该数据集将[[entities/xgboost|xgboost]]模型的批量推理时间从约 500 秒降至约 8 秒，实现了约 60 倍加速，同时保持了可接受的 RMSLE。 Pollution 数据集与[[entities/nyc-rides|nyc-rides]]等数据集共同验证了 InferDB 在大型结构化回归分析场景中的工程可行性。

## 相关实体
- [[entities/xgboost|xgboost]]
- [[entities/nyc-rides|nyc-rides]]
- [[entities/inferdb|inferdb]]

## 相关概念
- [[concepts/prediction-table|Prediction Table]]
- [[concepts/fill-factor|Fill-factor]]

## 来源提及

- "数据集 6 个：NYC-rides（1.5M 行程，回归）、Pollution（106M 记录，回归）、Fraud（284k 交易，二分类）、Hits（143k 歌曲，二分类）、Digits/MNIST（70k 手写数字，多分类 10 类）、Rice（75k 图像，多分类 5 类）" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
- "Batch 推理 vs XGBoost: ~500s → ~8s（~60× speedup）" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/inferdb_pvldb2024_424566]]"]
tags: [other]
aliases:
  - "Hits 数据集"
  - "歌曲流行度数据集"
generation_complete: true
---


# Hits

## 描述
Hits 是一个用于二分类预测的公共数据集，包含约 143,000 首歌曲的特征，目标是判断一首歌是否会成为热门。在 [[entities/inferdb|InferDB]] 的精度与存储压缩实验中，该数据集表现突出：基于 [[entities/xgboost|XGBoost]] 的原生预测与经过 [[concepts/supervised-discretization|Supervised Discretization]] 后构建的 [[concepts/prediction-table|Prediction Table]] 近似预测，二者 F1 分数均为 0.97，实现了完全无损的精度保持。同时，Prediction Table 仅占约 0.04 MB 存储空间，而原始 XGBoost 模型约需 5.5 MB。这一案例说明，当特征离散化后模型预测一致性极高时，InferDB 能够在紧凑的结构中做到极致压缩与加速，而完全不牺牲预测性能。

## 相关实体
- [[entities/xgboost|xgboost]]
- [[entities/inferdb|inferdb]]

## 相关概念
- [[concepts/supervised-discretization|Supervised Discretization]]
- [[concepts/prediction-table|Prediction Table]]

## 来源提及

- "精度对比（最佳场景）：完全等效（如 Hits: F1 0.97 vs 0.97）" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
- "大部分场景 InferDB 更小（如 Hits: 0.04MB vs ~5.5MB）" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/inferdb_pvldb2024_424566]]"]
tags: [other]
aliases:
  - "Rice 数据集"
  - "大米品种分类数据集"
generation_complete: true
---


# Rice

## 描述
Rice 是一个多分类数据集，包含约 75k 张大米颗粒图像，任务为区分 5 个不同品种。该数据集在 [[entities/inferdb|InferDB]] 实验中代表具有适度复杂特征但类别数较小的多分类场景，用于测试 [[concepts/supervised-discretization|Supervised Discretization]] 在多分类预测中的聚合策略（多数投票/最大概率和）。[[entities/inferdb|InferDB]] 系统在该数据集上评估了分类聚合函数 α 对不同类别分布的影响，并分析了离散化后的分类性能。

## 相关实体
- [[entities/inferdb|InferDB]]

## 相关概念
- [[concepts/supervised-discretization|Supervised Discretization]]
- [[concepts/greedy-feature-selection|Greedy Feature Selection]]

## 来源提及

- "数据集 6 个：NYC-rides（1.5M 行程，回归）、Pollution（106M 记录，回归）、Fraud（284k 交易，二分类）、Hits（143k 歌曲，二分类）、Digits/MNIST（70k 手写数字，多分类 10 类）、Rice（75k 图像，多分类 5 类）" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
- "分类用多数投票或最大概率和" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
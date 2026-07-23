---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/inferdb_pvldb2024_424566]]"]
tags: [product]
aliases:
  - "OptBinning 框架"
  - "OptBinning library"
generation_complete: true
---


# OptBinning

## 描述
OptBinning 是一个用于有监督离散化的 Python 开源库，在 [[entities/inferdb|InferDB]] 中作为有监督离散化步骤的核心依赖。它基于 [[concepts/information-value-iv|Information Value (IV)]] 为每个特征自动选择最优分箱方案，将连续或离散特征映射到能最大化预测区分能力的离散 bin 中。OptBinning 同时支持二分类和多分类场景下的最优分箱，是实现 [[concepts/supervised-discretization|有监督离散化]] 的关键工具。

## 相关实体
- [[entities/inferdb|InferDB]]

## 相关概念
- [[concepts/supervised-discretization|有监督离散化]]
- [[concepts/information-value-iv|Information Value (IV)]]

## 来源提及

- "使用 OptBinning 框架，基于 Information Value (IV) 为每个特征选择最优分箱方案。" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
- "依赖 OptBinning（第三方库）" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/inferdb_pvldb2024_424566]]"]
tags: [other]
aliases:
  - "NYC 行程数据集"
  - "NYC Rides"
  - "NYC-rides dataset"
generation_complete: true
---


# NYC-rides

## 描述
NYC-rides 是一个包含约 150 万条记录的纽约市行程数据集，在 [[entities/inferdb|InferDB]] 实验中被用作回归任务的主要性能基准之一。实验表明，借助 InferDB 的 index‑based 推理，该数据集的查询延迟从约 600 ms 降至约 8 ms，提升近两个数量级。该数据集还被用来分析 [[concepts/sparsity|Sparsity]] 效应：当仅选取 6 个特征时，填充因子（[[concepts/fill-factor|Fill-factor]]）远低于 1%，但由于训练集与测试集的 [[concepts/distribution-consistency|Distribution Consistency]] 一致，[[concepts/test-miss-rate|Test-miss-rate]] 仍保持在较低水平。类似地，[[entities/digits-mnist|Digits/MNIST]] 也作为对比基准出现在相关实验中。

## 相关实体
- [[entities/inferdb|InferDB]]
- [[entities/digits-mnist|Digits/MNIST]]

## 相关概念
- [[concepts/fill-factor|Fill-factor]]
- [[concepts/test-miss-rate|Test-miss-rate]]
- [[concepts/sparsity|Sparsity]]
- [[concepts/distribution-consistency|Distribution Consistency]]

## 来源提及

- "NYC-rides（1.5M 行程，回归）" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
- "推理延迟提升 vs ML pipeline ~2 orders of magnitude（~600ms → ~8ms） NYC-rides 数据集，standalone" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
- "Fill-factor 与 sparsity：6 特征时 fill-factor << 1%，但 test-miss-rate 仍低 NYC-rides（分布一致时 sparsity 影响小）" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
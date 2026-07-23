---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/inferdb_pvldb2024_424566]]"]
tags: [other]
aliases:
  - "MNIST"
  - "手写数字数据集"
  - "Digits MNIST"
generation_complete: true
---


# Digits/MNIST

## 描述
Digits/MNIST 是一个经典的手写数字识别数据集，包含 70,000 张 28×28 像素的灰度图像，均匀覆盖 0‑9 共 10 个数字类别。该数据集以 784 像素的高维稀疏特征著称，广泛用于机器学习分类算法的基准测试。在 [[entities/inferdb|InferDB]] 的多分类实验中，Digits/MNIST 作为非结构化高维数据的关键代表被引入，用于评估 index‑based 推理方法在非传统表格数据上的泛化能力。实验结果表明，[[entities/inferdb|InferDB]] 在该数据集上的 F1 分数从结构化数据上的 0.98 大幅下降至 0.70，揭示了其在高维稀疏特征空间中的根本性能瓶颈。这一结果为反对单纯依赖索引近似、转而倡导 LLM/VLM 场景下“真实推理执行”路线提供了直接依据。

## 相关实体
- [[entities/inferdb|InferDB]]

## 相关概念
（无相关概念）

## 来源提及

- "Digits/MNIST（70k 手写数字，多分类 10 类）" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
- "精度对比（最差场景）：F1 0.98 → 0.70 Digits/MNIST（高维稀疏）" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
- "InferDB 在 MNIST 等高维非结构化数据上的精度显著下降（F1 0.98 → 0.70），印证了此类场景仍需真实推理执行" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
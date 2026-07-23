---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/inferdb_pvldb2024_424566]]"]
tags: [product]
aliases:
  - "scikit-learn"
  - "sklearn"
generation_complete: true
---


# Scikit-learn

## 描述
Scikit-learn 是 Python 生态中广泛使用的开源机器学习库，提供分类、回归、聚类等经典算法和统一 API，并内置丰富的数据预处理与模型评估工具。该库以一致、简洁的设计著称，常作为独立 pipeline 的运行时直接处理结构化表格数据。在 [[entities/inferdb|InferDB]] 系统的性能评估中，Scikit-learn 同时以独立引擎和 [[entities/postgresml|PostgresML]] 2.0 模型后端的角色出现，分别代表数据库外 ML 推理的两种典型部署方式。实验以 Scikit-learn 为关键基线，对比 [[entities/inferdb|InferDB]] 的推理延迟与精度，结果表明 InferDB 在结构化数据上可将延迟降低 2–3 个数量级，同时保持模型预测质量。

## 相关实体
- [[entities/postgresml|PostgresML]]
- [[entities/inferdb|InferDB]]
- [[entities/xgboost|XGBoost]]
- [[entities/lightgbm|LightGBM]]

## 相关概念
暂无相关概念条目。

## 来源提及

- "Baseline: (1) 同一 ML pipeline 的 SQL 翻译版（SQLModel）；(2) PostgresML 2.0（PGML，Scikit-learn 集成）；(3) standalone Scikit-learn pipeline" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
- "模型类型：LR/NN/XGBoost/LightGBM（均通过 Scikit-learn 接口调用或兼容）" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
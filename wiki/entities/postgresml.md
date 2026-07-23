---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/inferdb_pvldb2024_424566]]"]
tags: [product]
aliases:
  - "PGML"
  - "PostgresML 2.0"
generation_complete: true
---


# PostgresML

## 描述
PostgresML 2.0 是一个将 Scikit‑learn 机器学习模型原生集成到 PostgreSQL 数据库中的工具，属于将 ML runtime 直接嵌入 DBMS 的技术路线。在 [[entities/inferdb|InferDB]] 实验中，PostgresML 被选为三个 baseline 之一，与 [[concepts/index-based-inference|Index-based Inference]] 方法进行全面对比。InferDB 的实验结果表明，PostgresML 所代表的 runtime 集成方法在推理延迟、训练时间和存储开销等方面，在部分场景下显著劣于基于索引的推理方案。这一对比突显了在数据库内执行 ML 任务时，[[concepts/db4ai|DB4AI]] 系统架构选择对性能的关键影响。

## 相关实体
- [[entities/inferdb|InferDB]]

## 相关概念
- [[concepts/index-based-inference|Index-based Inference]]
- [[concepts/db4ai|DB4AI]]

## 来源提及

- "PostgresML 2.0（PGML，Scikit-learn 集成）" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
- "Baseline: (1) 同一 ML pipeline 的 SQL 翻译版（SQLModel）；(2) PostgresML 2.0（PGML，Scikit-learn 集成）；(3) standalone Scikit-learn pipeline" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
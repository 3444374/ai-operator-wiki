---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources:
  - "[[sources/gaussml_icde2024_577060]]"
tags:
  - "method"
aliases:
  - "Native SQL Operator Integration"
  - "原生机器学习算子"
  - "原生SQL算子集成"
generation_complete: true
---

## 相关概念
- [[concepts/ai-aware-query-optimization|AI 感知查询优化]]
- [[concepts/ai-函数作为-udf|AI 函数作为 UDF]]
- [[concepts/写回瓶颈|写回瓶颈]]
- [[concepts/分布式并行训练|分布式并行训练]]

## 相关实体
- [[entities/gaussml|GaussML]]
- [[entities/opengauss|openGauss]]
- [[entities/华为|华为]]

## 定义
原生 SQL 算子集成是 GaussML 等数据库内机器学习系统采用的核心设计方法。它将分类、回归、聚类等常用的机器学习算法直接实现为数据库查询引擎内部的一等公民算子，而非通过外部用户定义函数（UDF）调用。这一设计的根本目的是让数据库优化器能像理解扫描、连接等传统关系算子一样，掌握 ML 算子的执行代价、基数估计与数据分布需求，从而生成全局最优的 SQL+ML 联合执行计划。同时，该方法通过扩展 SQL DDL/DML 语法，例如 `CREATE MODEL` 或 `TRAIN/PREDICT` 子句，使用户以声明方式使用机器学习能力，彻底避免手写函数调用和外部调度。

## 关键特征
- ML 算子直接嵌入数据库执行引擎，具备与传统算子同等的一等公民地位。
- 优化器可对 ML 算子进行代价建模、基数估计，参与整体查询计划的优化。
- 支持声明式 SQL 扩展（如 `CREATE MODEL`、`TRAIN`、`PREDICT`），用户无需关心底层实现细节。
- 无缝复用数据库原生的并行执行、分布式计算和数据流管理框架，实现透明化的分布式训练与推理。
- 避免“ML-as-UDF”模式中因黑盒调用带来的优化隔离、写回瓶颈和数据移动开销。

## 应用
数据库内机器学习系统的核心引擎设计，例如 [[entities/gaussml|GaussML]] 利用该方法在 [[entities/opengauss|openGauss]] 中实现端到端的模型训练与推断。适用于需要在大规模数据上直接进行 ML 任务的场景（如实时风控、推荐系统、用户画像），能够借助数据库的并行处理能力降低延迟、提高吞吐，同时保证数据不离开数据库，增强安全性与治理能力。

## 来源提及

- "GaussML 的方案：把 ML 算子做成数据库原生算子，而不是 UDF。" — [[raw/papers/gaussml_icde2024|gaussml_icde2024]]
- "原生 SQL 接口：将典型 ML 算子直接集成进查询引擎——不是 `SELECT my_udf(x)`，而是让优化器理解 ML 算子的语义和代价。" — [[raw/papers/gaussml_icde2024|gaussml_icde2024]]
- "利用数据库自身的并行和分布式能力进行训练与推理" — [[raw/papers/gaussml_icde2024|gaussml_icde2024]]
- "把 ML 算子做成数据库原生算子，而不是 UDF" (把 ML 算子做成数据库原生算子，而不是 UDF) — [[raw/papers/gaussml_icde2024|gaussml_icde2024]]
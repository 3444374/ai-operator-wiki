---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources:
  - "[[sources/gaussml_icde2024_577060]]"
tags:
  - "product"
aliases:
  - "GaussML 系统"
  - "openGauss ML engine"
  - "GaussML"
generation_complete: true
---

# GaussML

## 描述
GaussML 是内置于 [[entities/opengauss|openGauss]] 数据库的端到端数据库内机器学习系统，也是发表于 [[entities/icde-2024|ICDE 2024]] 的论文核心成果。该系统彻底改变了传统基于 [[concepts/ml-as-udf|ML-as-UDF]] 的加速方式，将 20 余种常用机器学习算法以 [[concepts/原生-sql-算子集成|原生 SQL 算子]] 的形式直接嵌入查询执行引擎，使 SQL 优化器能够理解算子的语义与代价。GaussML 通过三大关键技术实现突破：提供 [[concepts/原生-sql-算子集成|原生 SQL 接口]] 以实现 ML 算子感知，引入 [[concepts/ml-感知优化器|ML 感知的基数与代价估计器]] 以联合优化 SQL 与 ML 查询计划，以及利用 [[concepts/simd-加速|SIMD 指令集]] 与 [[concepts/数据预取|数据预取]] 加速训练与推理。在性能对比中，GaussML 相较 [[entities/apache-madlib|Apache MADlib]] 提升了 2‑6 倍，是 [[concepts/db4ai|DB4AI]]（将模型拉进数据库）路线的典型工业实现，并与基于外部 GPU 集群及 [[entities/ray|Ray]] 构建的 [[concepts/外部执行链路|外部执行链路]] 形成鲜明对照。

## 相关实体
- [[entities/opengauss|openGauss]]
- [[entities/apache-madlib|Apache MADlib]]
- [[entities/icde-2024|ICDE 2024]]
- [[entities/华为|华为]]
- [[entities/清华大学|清华大学]]

## 相关概念
- [[concepts/ml-as-udf|ML-as-UDF]]
- [[concepts/原生-sql-算子集成|原生 SQL 算子集成]]
- [[concepts/ml-感知优化器|ML 感知优化器]]
- [[concepts/simd-加速|SIMD 加速]]
- [[concepts/数据预取|数据预取]]
- [[concepts/分布式并行训练|分布式并行训练]]
- [[concepts/db4ai|DB4AI]]
- [[concepts/外部执行链路|外部执行链路]]

## 来源提及

- "华为 openGauss 中将 20+ ML 算子以原生 SQL 语法直接集成进查询引擎，替代 ML-as-UDF 方案，配合 ML 感知优化器和 SIMD 加速，比 Apache MADlib 快 2-6×。" — [[raw/papers/gaussml_icde2024|gaussml_icde2024]]
- "GaussML 的方案：把 ML 算子做成数据库原生算子，而不是 UDF。" — [[raw/papers/gaussml_icde2024|gaussml_icde2024]]
- "在 openGauss 数据库中实现。" — [[raw/papers/gaussml_icde2024|gaussml_icde2024]]
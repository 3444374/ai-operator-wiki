---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources:
  - "[[sources/gaussml_icde2024_577060]]"
tags:
  - "product"
aliases:
  - "MADlib"
generation_complete: true
---

# Apache MADlib

## 描述
Apache MADlib 是一个开源的数据库内机器学习库，通过用户定义函数（UDF）的形式在 PostgreSQL、Pivotal Greenplum 等 MPP 数据库中运行。它代表了传统 [[concepts/ml-as-udf|ML-as-UDF]] 路线的典型实现，允许在 SQL 查询中直接调用回归、分类、聚类等算法。在 GaussML 论文中，MADlib 被用作性能对比基线，实验证明原生 ML 算子方案相比该 UDF 方案可获得 2–6 倍的加速。其主要缺陷在于 UDF 隔离性差、安全性不足，且无法利用数据库内核的 [[concepts/simd-acceleration|SIMD 加速]] 与 [[concepts/ml-aware-optimizer|ML 感知优化器]] 进行深度优化。UDF 方案受限于 SQL 查询算子的数据访问与执行模式，成为性能瓶颈，因此 MADlib 在本研究中主要作为反例评估基准出现。

## 相关实体
- [[entities/opengauss|openGauss]]
- [[entities/gaussml|GaussML]]

## 相关概念
- [[concepts/ml-as-udf|ML-as-UDF]]
- [[concepts/ml-aware-optimizer|ML 感知优化器]]
- [[concepts/simd-acceleration|SIMD 加速]]

## 来源提及

- "比 Apache MADlib 快 2-6×。" — [[raw/papers/gaussml_icde2024|gaussml_icde2024]]
- "传统“ML-as-UDF”方法有两个核心缺陷：1. 安全风险：UDF 可能引入漏洞代码 2. 性能瓶颈：UDF 受限于 SQL 查询算子的数据访问与执行模式约束（无法利用 SIMD、无法做 ML 感知优化）" — [[raw/papers/gaussml_icde2024|gaussml_icde2024]]
- "比 Apache MADlib 快 2-6×" (比 Apache MADlib 快 2-6×) — [[raw/papers/gaussml_icde2024|gaussml_icde2024]]
- "在 openGauss 数据库中实现" (在 openGauss 数据库中实现) — [[raw/papers/gaussml_icde2024|gaussml_icde2024]]
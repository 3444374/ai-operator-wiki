---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources:
  - "[[sources/gaussml_icde2024_577060]]"
tags:
  - "product"
aliases:
  - "openGauss"
  - "华为 openGauss 数据库"
generation_complete: true
---

# openGauss

## 描述
openGauss 是华为研发的企业级开源关系型数据库系统，也是 [[entities/gaussml|GaussML]] 内置运行的宿主数据库引擎。GaussML 的原生 ML 算子被直接实现在 openGauss 的查询执行引擎内部，替代传统的外部 [[concepts/ml-as-udf|ML-as-UDF]] 调用模式，显著降低了数据传输与上下文切换开销。openGauss 自身提供的数据并行、分布式执行以及 [[concepts/simd-acceleration|SIMD 加速]] 等硬件加速能力，使 ML 算子在数据库内核中获得高效运行。其架构扩展为 [[concepts/ai-aware-query-optimization|AI 感知查询优化]] 提供了代价与基数估计所需的内核细节，从而能够生成联合优化 SQL 与 ML 的查询计划。GaussML 的性能优势很大程度上依赖 openGauss 内置的并行与数据预取能力，而非单纯的外部框架集成。

## 相关实体
- [[entities/华为|华为]]
- [[entities/gaussml|GaussML]]
- [[entities/apache-madlib|Apache MADlib]]

## 相关概念
- [[concepts/ml-as-udf|ML-as-UDF]]
- [[concepts/native-sql-operator-integration|原生 SQL 算子集成]]
- [[concepts/ai-aware-query-optimization|AI 感知查询优化]]
- [[concepts/simd-acceleration|SIMD 加速]]

## 来源提及

- "华为 openGauss 中将 20+ ML 算子以原生 SQL 语法直接集成进查询引擎，替代 ML-as-UDF 方案，配合 ML 感知优化器和 SIMD 加速，比 Apache MADlib 快 2-6×。" — [[raw/papers/gaussml_icde2024|gaussml_icde2024]]
- "GaussML 的方案：把 ML 算子做成数据库原生算子，而不是 UDF。" — [[raw/papers/gaussml_icde2024|gaussml_icde2024]]
- "在 openGauss 数据库中实现。" — [[raw/papers/gaussml_icde2024|gaussml_icde2024]]
- "在 openGauss 数据库中实现" (在 openGauss 数据库中实现) — [[raw/papers/gaussml_icde2024|gaussml_icde2024]]
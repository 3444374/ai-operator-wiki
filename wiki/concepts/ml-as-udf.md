---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources:
  - "[[sources/gaussml_icde2024_577060]]"
tags:
  - "method"
aliases:
  - "ML 用户定义函数"
  - "机器学习UDF"
  - "ML-as-UDF"
generation_complete: true
---

# ML-as-UDF

## 定义
ML‑as‑UDF 是一种在数据库内部执行机器学习任务的传统方法。它将完整的模型训练或推理逻辑封装为**用户定义函数（UDF）**，允许用户通过 SQL 语句直接调用这些函数，从而在查询中嵌入 ML 能力。

## 关键特征
- **黑盒执行**：数据库优化器将 UDF 视为不透光的黑盒，无法获取其内部语义、执行逻辑或代价模型，因此无法对“SQL+ML”的联合查询计划进行优化。
- **缺乏算子融合**：UDF 运行在受限的进程上下文中，无法进行跨算子的共享扫表、数据预取或流水线融合，导致大量冗余的数据移动和物化。
- **无法利用现代硬件加速**：UDF 通常以标量方式执行，难以利用底层 CPU 的 SIMD 向量化指令进行批量计算，硬件利用率低下。
- **安全与稳定性风险**：外部 UDF 代码可能引入安全漏洞或运行时错误，威胁数据库的稳定性和数据安全。

## 应用
- 早期的数据库内机器学习原型，如 [[entities/apache-madlib|Apache MADlib]] 将多种经典 ML 算法（逻辑回归、SVM 等）封装为 UDF，使用户能够在 PostgreSQL 等数据库中快速进行实验。
- 简单的预测或评分任务，数据规模较小时可直接通过 UDF 调用模型，避免数据迁出数据库。
- 作为对比基线，后续的原生 AI 系统（如 [[entities/gaussml|GaussML]]）正是为了突破 ML‑as‑UDF 在性能、优化和安全性上的瓶颈而设计。
- GaussML 的原生算子方案相比 [[entities/apache-madlib|Apache MADlib]] 的 ML‑as‑UDF 方案，在典型工作负载上性能可提升 **2–6 倍**，为这一对比基线提供了量化依据。
## 相关概念
- [[concepts/原生-sql-算子集成|原生 SQL 算子集成]]
- [[concepts/ai-aware-query-optimization|AI-aware query optimization]]
- [[concepts/simd-加速|SIMD 加速]]
- [[concepts/ai-sql-operators|AI SQL 算子]]
- [[concepts/外部执行链路|外部执行链路]]

## 相关实体
- [[entities/apache-madlib|Apache MADlib]]
- [[entities/gaussml|GaussML]]
- [[entities/opengauss|openGauss]]

## 来源提及

- "传统“ML-as-UDF”方法有两个核心缺陷：1. 安全风险：UDF 可能引入漏洞代码 2. 性能瓶颈：UDF 受限于 SQL 查询算子的数据访问与执行模式约束（无法利用 SIMD、无法做 ML 感知优化）" — [[raw/papers/gaussml_icde2024|gaussml_icde2024]]
- "GaussML 的方案：把 ML 算子做成数据库原生算子，而不是 UDF。" — [[raw/papers/gaussml_icde2024|gaussml_icde2024]]
- "不是 `SELECT my_udf(x)`，而是让优化器理解 ML 算子的语义和代价" — [[raw/papers/gaussml_icde2024|gaussml_icde2024]]
- "传统 ML-as-UDF 方法有安全风险（UDF 可能引入漏洞代码）和性能瓶颈（无法利用 SIMD、无法做 ML 感知优化）" — [[raw/papers/gaussml_icde2024|gaussml_icde2024]]
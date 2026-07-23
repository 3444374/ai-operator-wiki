---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/inferdb_pvldb2024_424566]]"]
tags: [product]
aliases:
  - "Postgres"
  - "PG"
  - "PostgreSQL 数据库"
generation_complete: true
---


# PostgreSQL

## 描述
PostgreSQL 是一款功能丰富的开源关系型数据库管理系统，以其对 SQL 标准的严格遵循、出色的扩展能力以及可编程性著称。[[entities/inferdb|InferDB]] 选择 PostgreSQL 作为内置 ML 推理的原型实现平台，利用其标准 SQL 表达能力，将有监督离散化后的特征翻译与 [[concepts/prediction-table|Prediction Table]] 的等值连接操作原生表达为 SQL 查询。这使得推理过程无需在数据库内核中引入任何新算子，完全以标准 SQL 方式完成。实验结果显示，PostgreSQL 上的 **Inference-as-Join** 方案不仅实现了可用的推理性能，还充分受益于查询优化器已有的谓词下推与索引选择机制，验证了该方法与现有数据处理系统的深度兼容性。

## 相关实体
- [[entities/inferdb|InferDB]]
- [[entities/postgresml|PostgresML]]
- [[entities/lightgbm|lightgbm]]
- [[entities/xgboost|xgboost]]
- [[entities/optbinning|optbinning]]

## 相关概念
- [[concepts/inference-as-join|Inference as Join]]
- [[concepts/prediction-table|Prediction Table]]
- [[concepts/supervised-discretization|有监督离散化]]

## 来源提及

- "在 DB 内，将测试数据做同样的离散化变换（用 SQL CASE WHEN 实现 bin 映射），然后与 prediction table 做 equi-join。等效于标准 SQL 查询，完全兼容查询优化器的谓词下推、索引选择等优化。" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
- "代码开源（GitHub: hpides/inferdb），Postgres + Python standalone，标准数据集" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/inferdb_pvldb2024_424566]]"]
tags: [method]
aliases:
  - "推理即 Join"
  - "Inference-as-Join"
generation_complete: true
---


# Inference as Join

## 定义
Inference as Join 是 InferDB 系统提出的设计范式，将端到端的机器学习推理转化为标准关系数据库中的等值连接（equi-join）操作。测试数据经过有监督离散化映射到与 Prediction Table 相同的特征空间后，通过一条 equi-join 查询直接从表中获取聚合后的预测值，完全替代特征预处理和模型前向计算。由于整个过程使用标准 SQL 且不引入新算子，查询优化器可自动进行谓词下推、索引选择和连接顺序优化，大幅降低推理延迟。

## 关键特征
- **关系化推理**：将 ML 推理抽象为数据库查询，用 SQL equi-join 替代模型前向计算。
- **特征空间统一**：借助有监督离散化，将测试数据映射到固定的离散特征空间，与 Prediction Table 的表结构对齐。
- **零额外算子**：完全依赖标准 SQL，无需引入自定义函数或新的数据库算子。
- **查询优化器友好**：天然受益于数据库的谓词下推、索引选择与连接顺序优化。
- **显著的性能增益**：是 InferDB 实现 2–3 个数量级推理延迟降低的关键机制。

## 应用
- **InferDB 核心推理引擎**：针对表格数据的分类/回归模型，在数据库内直接完成预测，适用于低延迟、高吞吐的场景。
- **数据库内模型服务**：将已有模型转换为 Prediction Table 后，任何通过离散化映射的查询均可转为 join，使推理成为标准数据库查询的一部分。

## 相关概念
- [[concepts/prediction-table|Prediction Table]]
- [[concepts/supervised-discretization|Supervised Discretization]]
- [[concepts/prefix-search-fallback|Prefix Search Fallback]]

## 相关实体
- [[entities/postgresql|PostgreSQL]]
- [[entities/inferdb|InferDB 系统]]

## 来源引用
- InferDB: End-to-End ML Inference Inside Relational Databases (PVLDB 2024)

## 来源提及

- "推理即 Join (Inference as Join)：在 DB 内，将测试数据做同样的离散化变换（用 SQL CASE WHEN 实现 bin 映射），然后与 prediction table 做 equi-join。等效于标准 SQL 查询，完全兼容查询优化器的谓词下推、索引选择等优化。" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
- "InferDB 将端到端 ML 推理管线（预处理 + 模型预测）替换为基于有监督离散化的轻量级 embedding + 标准数据库索引查找" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
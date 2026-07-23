---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/inferdb_pvldb2024_424566]]"]
tags: [term]
aliases:
  - "结构化数据"
  - "Structured Data"
generation_complete: true
---


# Structured Data

## 定义
结构化数据（Structured Data）是指数据元素被组织成明确的模式（schema），通常以表格形式存在，每条记录由固定字段组成，字段类型可以是数值、类别、日期等。这类数据可高效地存储在关系型数据库或数据仓库中，并支持通过结构化查询语言（SQL）进行精确检索。在 InferDB 系统中，结构化数据特指被用作机器学习模型训练与预测输入的表格数据（tabular data），其每一行代表一个样本，每一列代表一个特征或标签，模式在训练和推理阶段保持稳定。

## 关键特征
- **模式严格**：数据必须符合预定义的 schema，字段名称和类型明确，缺失值可被显式处理。
- **行列结构**：数据以二维表形式呈现，行→样本，列→特征/标签，适合关系代数操作。
- **可量化性**：每个特征通常是数值、有序类别或简单类别，便于离散化和统计建模。
- **适用于推断数据库优化**：InferDB 的监督离散化、预测表构建、推理即连接等核心技术都假设输入为结构化数据，从而利用稀疏性和 join 操作大幅加速推理。
- **边界清晰**：对于非结构化数据（如图像、文本），直接应用表格化的处理方法会出现严重性能下降——例如在 Digits/MNIST 实验中，将像素作为特征进行结构化处理，F1 值从 0.98 降至 0.70，表明了结构化数据范式的局限性。

## 应用
- **推断数据库（InferDB）**：作为系统的核心输入数据源，用于回归和分类任务，通过离散化、稀疏合并和 SQL 引擎实现约 2–3 个数量级的推理加速。
- **传统数据分析与商业智能**：通过 SQL 查询和 OLAP 进行聚合、报告与决策支持。
- **特征工程与监督离散化**：许多离散化工具（如 [[entities/optbinning|OptBinning]]）针对结构化表格数据设计，将连续特征转化为离散箱，提升模型解释性与稳定性。
- **数据仓库与 ETL 流程**：结构化数据是 ETL 管道的目标格式，便于清洗、变换和加载到分析环境。

## 相关概念
- [[concepts/supervised-discretization|Supervised Discretization]]
- [[concepts/prediction-table|Prediction Table]]
- [[concepts/sparsity|Sparsity]]
- [[concepts/structured-query-language|Structured Query Language]]
- [[concepts/relational-database|Relational Database]]

## 相关实体
- [[entities/digitsmnist|Digits/MNIST]]
- [[entities/inferdb|InferDB]]
- [[entities/pvldb-2024|pvldb-2024]]

## 来源提及

- "InferDB 适用于结构化数据上的回归、二分类和多标签分类任务，其中特征数不太高" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
- "对图像/文本等高维非结构化数据效果差（Digits 即是证据）" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
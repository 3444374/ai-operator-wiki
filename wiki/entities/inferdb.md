---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources:
  - "[[sources/inferdb_pvldb2024_424566]]"
tags:
  - "project"
aliases:
  - "InferDB 系统"
  - "InferDB 原型"
  - "hpides/inferdb"
generation_complete: true
---

## 相关实体
- [[entities/ricardo-salazar-díaz|Ricardo Salazar-Díaz]]
- [[entities/boris-glavic|Boris Glavic]]
- [[entities/tilmann-rabl|Tilmann Rabl]]
- [[entities/hasso-plattner-institute|Hasso Plattner Institute]]
- [[entities/optbinning|OptBinning]]
- [[entities/postgresml|PostgresML]]
- [[entities/nyc-rides|NYC-rides]]
- [[entities/digits-mnist|Digits/MNIST]]
- [[entities/pvldb-2024|PVLDB 2024]]

## 相关概念
- [[concepts/supervised-discretization|Supervised Discretization]]
- [[concepts/index-based-inference|Index-based Inference]]
- [[concepts/inference-as-join|Inference as Join]]
- [[concepts/prediction-table|Prediction Table]]
- [[concepts/prefix-search-fallback|Prefix Search Fallback]]
- [[concepts/greedy-feature-selection|Greedy Feature Selection]]
- [[concepts/information-value-iv|Information Value (IV)]]
- [[concepts/sparsity|Sparsity]]
- [[concepts/data-drift|Data Drift]]

## 描述
InferDB 是一个在 PostgreSQL 上实现的学术研究原型系统，发表于 [[entities/pvldb-2024|PVLDB 2024]]（CCF-A 类期刊）。其核心洞察是将端到端的机器学习推理管线（预处理 + 模型预测）替换为基于[[concepts/supervised-discretization|有监督离散化]]的轻量级嵌入与标准数据库索引查找，使得对相似数据点的预测可以用索引中预先聚合的预测值来近似。系统借助 [[entities/optbinning|OptBinning]] 进行有监督离散化，并利用[[concepts/greedy-feature-selection|贪心特征选择]]筛选预测能力最强的特征子集，再构建[[concepts/prediction-table|预测表]]存储聚合预测值。推理时只需一次特征翻译与一次等值连接（equi-join）即可近似整个推理管线，且完全兼容标准 SQL 查询优化器。该方法在面对新数据或数据分布变化（[[concepts/data-drift|数据漂移]]）时，可通过插入或更新预测表行而无需重新训练模型来适应。代码已开源在 GitHub（hpides/inferdb），设计团队包括 [[entities/ricardo-salazar-diaz|Ricardo Salazar-Díaz]]、[[entities/boris-glavic|Boris Glavic]] 和 [[entities/tilmann-rabl|Tilmann Rabl]]，来自 [[entities/hasso-plattner-institute|Hasso Plattner Institute]]。

## 来源提及

- "InferDB 将端到端 ML 推理管线（预处理 + 模型预测）替换为基于有监督离散化的轻量级 embedding + 标准数据库索引查找，在保持近似预测精度的前提下，推理延迟降低两个数量级。" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
- "其核心洞察是：对相似数据点的预测可以用索引中的聚合预测值来近似。" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
- "InferDB 是学术原型（开源、Postgres 上实现），Cortex 是产业生产系统（闭源、Snowflake 内部）。" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
- "代码开源：GitHub: hpides/inferdb" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
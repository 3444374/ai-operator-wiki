---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/inferdb_pvldb2024_424566]]"]
tags: [term]
aliases:
  - "预测表"
  - "Prediction Table"
  - "PT"
generation_complete: true
---


# Prediction Table

## 定义
Prediction Table（预测表）是 InferDB 系统中的核心数据结构，用于存储有监督离散化特征键与聚合模型预测值之间的映射。构建时，训练数据的每个数据点通过选定的离散化特征子集映射为一个键（元组），然后对同一键下的所有数据点应用聚合函数 α（回归任务取均值，分类任务取多数投票或最大概率和）计算出聚合预测值，形成一行记录。推理时，测试数据经过相同离散化处理后，通过等值连接或索引查找即可从 Prediction Table 中检索近似预测结果。表的大小由所选特征数量与各特征分箱数的乘积决定，稀疏性可通过前缀搜索回退机制处理。

## 关键特征
- 以离散化特征值组合为键、聚合预测值为值的映射结构
- 构建依赖有监督离散化，确保每个键内的数据点具有足够同质性
- 推理过程等价于数据库连接操作（[[concepts/inference-as-join|Inference as Join]]），可借助关系型数据库索引高效执行
- 表容量由特征数和每个特征的分箱数乘积决定，可能产生稀疏性
- 引入 [[concepts/prefix-search-fallback|Prefix Search Fallback]] 处理未见过的键，回退到更宽泛的前缀匹配
- 与 [[concepts/fill-factor|Fill-factor]] 概念协作，通过合并小 bin 控制表规模与预测质量之间的平衡

## 应用
- InferDB 原型系统的预测层核心组件，将机器学习模型的预测能力转化为可 SQL 查询的关系表
- 支持对大规模表格数据进行近似预测，尤其适用于在线推理场景，可以绕过昂贵的模型调用
- 可与 PostgreSQL 等关系型数据库集成，利用 B‑Tree 或 Hash 索引加速基于 Prediction Table 的预测检索

## 相关概念
- [[concepts/supervised-discretization|Supervised Discretization]]
- [[concepts/inference-as-join|Inference as Join]]
- [[concepts/prefix-search-fallback|Prefix Search Fallback]]
- [[concepts/fill-factor|Fill-factor]]

## 相关实体
暂无直接关联实体。

## 来源提及

- "Prediction Table 构建与填充：将每个训练数据点通过 δ* 映射到 embedding 空间，对具有相同 key x* 的数据点聚合其模型预测。" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
- "推理即 Join (Inference as Join)：在 DB 内，将测试数据做同样的离散化变换...然后与 prediction table 做 equi-join。" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
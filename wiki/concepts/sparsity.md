---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/inferdb_pvldb2024_424566]]"]
tags: [phenomenon]
aliases:
  - "索引稀疏性"
  - "Prediction Table 稀疏"
  - "Prediction Table 稀疏性"
generation_complete: true
---


# Sparsity

## 定义
在 [[entities/inferdb|InferDB]] 系统中，Sparsity（稀疏性）是指 **Prediction Table 中仅有极小比例的可能离散化 key 组合被训练数据实际填充，绝大多数组合对应的值为空** 的现象。其根源在于：监督离散化（[[concepts/supervised-discretization|Supervised Discretization]]）为每个特征分配多个 bin，所有特征的 bin 做笛卡尔积后，key 空间的大小随特征数量指数级膨胀，而训练集不可能覆盖全部组合，必然导致表中出现大量空值。这种稀疏性会直接降低 equi-join 的命中率，迫使系统退化为 [[concepts/prefix-search-fallback|Prefix Search Fallback]] 进行粗粒度近似，从而可能降低预测精度。

## 关键特征
- **指数级 key 空间增长**：特征数量增加时，离散化 bin 组合数呈指数增长，而训练数据量线性增长，导致稀疏性急剧加重
- **Prediction Table 大量空值**：绝大多数理论上的 key 组合从未在训练中出现，对应的 model 条目为空
- **影响 equi-join 命中率**：查询时若目标 key 组合不存在于表中，系统无法通过精确等值连接直接获取预测，必须回退到前缀搜索近似
- **需要回退机制保障**：稀疏性直接驱动了 [[concepts/prefix-search-fallback|Prefix Search Fallback]] 的设计，以便在缺少精确匹配时仍能返回粗粒度预测
- **与 [[concepts/test-miss-rate|Test-miss-rate]] 紧密关联**：稀疏性表现为 test-miss-rate 上升；InferDB 通过贪心特征选择控制 key 空间大小，并利用训练‑测试分布一致性来保证实际 test-miss-rate 保持在低位

## 应用
- **数据库内模型驻留优化**：在设计 [[entities/inferdb|InferDB]] 的 Prediction Table 时，利用稀疏性分析评估不同特征数量下的 key 空间膨胀程度，指导特征选择策略
- **回退策略设计**：稀疏性分析是决定何时启用 Prefix Search Fallback，以及设置回退深度、聚合粒度的重要依据，直接影响查询延迟与精度之间的权衡
- **预测精度评估**：通过 test-miss-rate 指标观察稀疏性对预测质量的实际影响，用于调优离散化方案或特征组合
- **工业级 ML 系统**：在其他需要预先计算大量离散组合并存储模型参数的系统中（如基于查找表的推荐系统、量化推断引擎），稀疏性同样是核心工程问题，可借鉴类似的贪心筛选和分布一致性校验方法

## 相关概念
- [[concepts/prediction-table|Prediction Table]]
- [[concepts/supervised-discretization|Supervised Discretization]]
- [[concepts/test-miss-rate|Test-miss-rate]]
- [[concepts/prefix-search-fallback|Prefix Search Fallback]]
- [[concepts/feature-engineering|特征工程]]

## 相关实体
暂无直接关联的实体记录；该概念主要源自 [[entities/inferdb|InferDB]] 系统的设计分析。

## 来源提及

- "当特征数增加时，embedding 空间体积指数级增长，fill-factor 急剧下降。论文的 greedy 特征选择缓解了这一问题，但未根本解决" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
- "消融实验: Sparsity 分析（fill-factor / test-miss-rate vs 特征数）" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
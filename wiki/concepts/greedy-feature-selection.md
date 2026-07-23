---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/inferdb_pvldb2024_424566]]"]
tags: [method]
aliases:
  - "贪心特征选择"
generation_complete: true
---


# Greedy Feature Selection

## 定义
Greedy Feature Selection 是 [[entities/inferdb|InferDB]] 中用于从离散化后的全部特征中选取预测能力最强子集的线性贪心启发式算法。该算法按 Information Value 降序遍历特征，逐个尝试将特征加入当前子集，只有当加入后使整体 IV 提升时才保留该特征。选定特征后，再按各特征的 bin 数量降序排列（bin 数多的排前面），以减小 Prediction Table 的索引大小。该方法在指数爆炸的搜索空间中提供了一种廉价的近似最优特征组合策略，有效缓解了高维特征导致的 Prediction Table 稀疏问题。

## 关键特征
- 以 **Information Value (IV)** 作为特征排序和筛选的核心度量指标，确保候选特征按预测能力从强到弱被引入。
- **线性贪心搜索**：仅需一次遍历（按 IV 降序），逐个评估每个特征是否应加入当前子集，复杂度远低于穷举排列。
- **增量 IV 提升检验**：加入新特征后重新计算组合 IV，仅当组合 IV 上升时才保留该特征，否则丢弃。
- **后处理按 bin 数排序**：最终入选的特征按各自离散化后的 bin 数量降序排列，以减小 Prediction Table 索引占用的存储和查询开销。
- **规避维度爆炸**：在高维候选空间中，用贪婪近似代替穷举搜索，使特征选择在实际应用中可行，避免 Prediction Table 过于稀疏。

## 应用
- **InferDB 特征工程管线**：在监督离散化之后，从数百甚至数千个候选离散化特征中自动选取最优子集，构建紧凑且高预测性能的 Prediction Table。
- **高维表格数据的特征压缩**：可用于其他需要从大量派生特征中选择少数具有最高信息量的场景，如信贷评分卡开发、欺诈检测模型的特征精简。

## 相关概念
- [[concepts/information-value|Information Value]]
- [[concepts/supervised-discretization|Supervised Discretization]]
- [[concepts/sparsity|Sparsity]]
- [[concepts/prediction-table|Prediction Table]]

## 相关实体
- [[entities/inferdb|InferDB]]

## 来源提及

- "Greedy 特征选择 (Feature Selection)：不直接使用所有离散化特征（会导致稀疏 index），而是用一个线性贪心启发式算法（Algorithm 1）从 X̃ 中选择预测能力最强的特征子集 X*。" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
- "选完后按 bin 数量降序排列（bin 多的特征排前面以减小 index 大小）。" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
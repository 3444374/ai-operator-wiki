---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/inferdb_pvldb2024_424566]]"]
tags: [term]
aliases:
  - "填充因子"
  - "Fill factor"
  - "FF"
generation_complete: true
---


# Fill-factor

## 定义
Fill-factor（填充因子）是衡量[[concepts/prediction-table|Prediction Table]]中非空键数量与理论最大键数量比值的指标，表征离散化嵌入空间的占用率。它反映了在给定特征离散化（bin）组合下，实际能够命中预测结果的键所占的比例。

## 关键特征
-   **组合爆炸效应**：由于每个特征的 bin 数相乘导致可能键数量呈指数增长，当选定的特征数量增加时，fill‑factor 急剧下降。例如仅有 6 个特征时，fill‑factor 可能远小于 1%。
-   **数据分布依赖**：fill‑factor 的实际值不仅取决于 bin 乘积的理论上界，还强烈依赖于训练数据的分布模式；高频组合会提高有效填充率，而长尾分布会加剧稀疏性。
-   **索引大小敏感**：fill‑factor 直接影响 Prediction Table 的物理存储和索引效率——过低的填充率会导致索引膨胀、查询性能下降。
-   **与稀疏性的关系**：fill‑factor 是[[concepts/sparsity|Sparsity]]的定量补充，低 fill‑factor 意味着高稀疏性，二者共同决定预测查找的命中概率与回退需求。

## 应用
-   **特征选择控制**：InferDB 系统中，贪心特征选择算法将 fill‑factor 作为关键约束之一，优先保留 bin 数少或预测力强的特征，从而在保证预测精度的同时控制索引大小。
-   **前缀搜索回退**：当查询键因 fill‑factor 过低而缺失时，系统可借助前缀搜索回退（Prefix Search Fallback）机制扩大匹配范围，弥补稀疏性带来的[[concepts/test-miss-rate|Test-miss-rate]]上升问题。
-   **离散化设计参考**：在构建[[concepts/supervised-discretization|Supervised Discretization]]模型时，fill‑factor 可用于评估 bin 划分策略是否会导致索引过度稀疏，指导离散化粒度的调整。

## 相关概念
-   [[concepts/sparsity|Sparsity]]
-   [[concepts/test-miss-rate|Test-miss-rate]]
-   [[concepts/prediction-table|Prediction Table]]
-   [[concepts/supervised-discretization|Supervised Discretization]]

## 相关实体
暂无直接关联实体（该概念主要为 InferDB 设计方法论中的内部指标）。

## 来源提及

- "当特征数增加时，embedding 空间体积指数级增长，fill-factor 急剧下降。" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
- "Fill-factor 与 sparsity: 6 特征时 fill-factor << 1%，但 test-miss-rate 仍低" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
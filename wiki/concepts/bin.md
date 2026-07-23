---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/inferdb_pvldb2024_424566]]"]
tags: [term]
aliases:
  - "Bin"
  - "分箱"
  - "离散化区间"
generation_complete: true
---


# Bin

## 定义
Bin 是有监督离散化操作中将连续或类别特征的值域划分成的若干个互不相交的区间/集合。每个 bin 对应一个离散化后的类别标识，同一 bin 内的所有原始值被映射为相同 key。在 InferDB 中，通过 [[concepts/information-value|Information Value]] 指导分箱边界的选择，使得每个 bin 内部模型预测的变异性最小化，从而保证同一 bin 中的数据点可以用一个聚合预测值近似代表。Bin 的数量直接影响 embedding 空间的粒度和 [[concepts/prediction-table|Prediction Table]] 的大小，是权衡精度与索引效率的核心参数。

## 关键特征
- **互不相交**：每个原始特征值只属于唯一的 bin，避免歧义。
- **有监督分箱**：分箱边界由目标变量的信息量决定，而非简单的等频或等宽切割。
- **预测保真度**：每个 bin 内部预测值变化尽可能小，使得 bin 作为聚合单元时保持高精度。
- **粒度控制**：bin 的数量直接决定离散化后的索引大小和查询性能，是空间与效率的权衡杠杆。

## 应用
- **监督离散化**：在 [[concepts/supervised-discretization|Supervised Discretization]] 中作为基本输出单元，将连续特征转换为类别特征。
- **特征工程**：将高基数特征或连续特征映射到有限的 bin，降低模型复杂度并提升泛化能力。
- **In‑DB 推理**：[[entities/inferdb|InferDB 系统]] 使用 bin 以及对应的 [[concepts/prediction-table|Prediction Table]] 来存储预计算的聚合预测值，从而加速 SQL 查询内的 ML 推理。
- **最优分箱库**：[[entities/optbinning|OptBinning 框架]] 等工具通过 IV/WOE 等方法自动计算最优 bin 边界，可直接用于上述流程。

## 相关概念
- [[concepts/supervised-discretization|Supervised Discretization]]
- [[concepts/information-value|Information Value]]
- [[concepts/prediction-table|Prediction Table]]

## 相关实体
- [[entities/inferdb|InferDB 系统]]
- [[entities/optbinning|OptBinning 框架]]

## 来源提及

- "使用 OptBinning 框架，基于 Information Value (IV) 为每个特征选择最优分箱方案。" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
- "IV 衡量分箱后每个 bin 内模型预测的不确定性——IV 越高，bin 内预测越一致。" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
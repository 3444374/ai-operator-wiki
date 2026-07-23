---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/inferdb_pvldb2024_424566]]"]
tags: [method]
aliases:
  - "有监督离散化"
  - "Supervised Discretization"
generation_complete: true
---


# Supervised Discretization

## 定义
有监督离散化（Supervised Discretization）是一种将连续型（或基数过高的离散型）特征映射到有限个离散区间（bin）的特征工程方法。与无监督的等宽或等频分箱不同，它利用目标变量的信息（如模型的预测标签、概率或真实标签）来指导分箱过程，目标是最大化每个 bin 内目标变量的同质性。在 [[entities/inferdb|InferDB]] 系统中，该方法借助 [[entities/optbinning|OptBinning]] 库实现，采用 [[concepts/information-value|Information Value]] 作为分箱质量的核心度量，将原始特征空间压缩为一个紧凑的 embedding 空间，使相似输入落入同一 key，从而可以用聚合预测值代替完整的模型推理。该方法的一个核心假设是：模型预测在离散化后的空间上是足够平滑的。

## 关键特征
- **有监督指导**：分箱边界由目标变量的分布决定，而非仅依赖特征自身的统计量，能够更有效地保留与任务相关的信息。
- **同质性最大化**：通过优化分箱策略，使每个区间内目标变量的取值尽可能一致（例如，同一 bin 内均为正例或均为负例，或者预测概率接近）。
- **Information Value 驱动**：以 [[concepts/information-value|Information Value]] 作为评估分箱质量的主要指标，实现自适应的最优分箱数量与边界选择。
- **紧凑表示**：将高维或连续特征映射到少量离散 key 上，形成紧凑的 embedding，为后续的 [[concepts/prediction-table|Prediction Table]] 查表加速、特征选择等操作奠定基础。
- **平滑性假设**：假设模型的预测函数在离散化空间上变化平缓，从而确保用 bin 内聚合值代替原始预测时不会引入过大误差。

## 应用
- **特征离散化与工程**：在数据预处理阶段，将连续特征转换为离散特征，便于基于规则或查表的模型部署。
- **模型推理加速**：用于构建 [[concepts/prediction-table|Prediction Table]]，使得推理时只需根据离散化 key 查表即可获得近似预测结果，显著降低计算开销。
- **紧凑特征构建**：在 [[entities/inferdb|InferDB]] 的优化执行路径中，利用有监督离散化将特征转化为紧凑 key，配合 [[concepts/greedy-feature-selection|Greedy Feature Selection]] 选择最有信息量的特征子集，实现高效的近似查询处理。

## 相关概念
- [[concepts/information-value|Information Value]]
- [[concepts/bin|Bin]]
- [[concepts/prediction-table|Prediction Table]]
- [[concepts/greedy-feature-selection|Greedy Feature Selection]]

## 相关实体
- [[entities/optbinning|OptBinning]]
- [[entities/inferdb|InferDB]]

## 来源提及

- "有监督离散化 (Supervised Discretization)：使用 OptBinning 框架，基于 Information Value (IV) 为每个特征选择最优分箱方案。" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
- "与无监督等宽/等频分箱不同，有监督离散化以模型预测为目标变量，确保离散化后的 embedding 空间中预测被最大程度保留。" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
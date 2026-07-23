---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/inferdb_pvldb2024_424566]]"]
tags: [term]
aliases:
  - "IV"
  - "信息值"
generation_complete: true
---


# Information Value

## 定义
Information Value（IV，信息值）是一种在信用评分与风险建模中广泛应用的统计量，用于量化一个分类变量对二分类目标变量的整体预测能力。IV 通过比较变量每个分箱（bin）内正负样本的分布差异与其期望分布来评估该变量的判别力，是监督离散化与特征筛选的关键指标。

## 关键特征
- 基于权重证据（Weight of Evidence, WOE）构建，计算公式：$IV = \sum (\text{正例占比} - \text{负例占比}) \times \text{WOE}_i$
- 对缺失值敏感，在使用前通常需要对缺失值进行单独分箱处理
- 常用解释规则：
  - $IV < 0.02$：几乎无预测能力
  - $0.02 \le IV < 0.1$：弱预测能力
  - $0.1 \le IV < 0.3$：中等预测能力
  - $0.3 \le IV \le 0.5$：强预测能力
  - $IV > 0.5$：可能过强，需检查过拟合或数据泄漏
- 可用于比较不同特征的重要性，支持贪心特征选择

## 应用
- **最优分箱**：在 [[concepts/supervised-discretization|监督离散化]] 中，OptBinning 等框架通过最大化 IV 或最小化 IV 损失来选择最优的分箱方案，确保每个 bin 内正负样本分布差异最大化。
- **特征选择**：按 IV 降序排列特征，逐个将高 IV 特征加入模型，通过评估模型 IV 提升或模型性能变化来决定保留哪些特征。
- **信用评分卡开发**：作为衡量变量信息含量的核心指标，用于构建解释性强的评分卡模型。
- **变量筛选**：快速剔除无预测能力的变量，减少模型复杂度。

## 相关概念
- [[concepts/supervised-discretization|监督离散化]]
- [[concepts/greedy-feature-selection|贪心特征选择]]
- [[concepts/bin|分箱]]

## 相关实体
- [[entities/optbinning|OptBinning 框架]]

## 来源提及

- "使用 OptBinning 框架，基于 Information Value (IV) 为每个特征选择最优分箱方案。IV 衡量分箱后每个 bin 内模型预测的不确定性——IV 越高，bin 内预测越一致。" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
- "按 IV 降序遍历特征，每次尝试加入当前特征，仅当 IV 提升时才保留。" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[entities/pvldb-2024]]", "[[entities/inferdb]]"]
tags: [term]
aliases:
  - "测试未命中率"
  - "test miss rate"
generation_complete: true
---


# Test-miss-rate

## 定义
Test-miss-rate 衡量在推理过程中，测试数据点经过离散化后所得到的 key 不在 [[concepts/prediction-table|Prediction Table]] 中的比例。该指标直接量化了模型内部索引结构对未见数据的覆盖能力，是评估基于预计算表（Prediction Table）的近似推理系统可靠性的关键度量。

## 关键特征
- **直接反映索引覆盖度**：低 test-miss-rate 意味着绝大多数测试样本的离散化键值已存在于 Prediction Table 中，可通过等值连接（equi-join）直接获得预测。
- **与 Fallback 机制联动**：当某样本的 key 缺失时，系统需要触发 Prefix Search Fallback，引入额外的近似误差和计算开销。
- **与 Fill-factor 相关但非同一量纲**：即使 [[concepts/fill-factor|Fill-factor]] 极低（例如在 6 个特征时远低于 1%），只要训练与测试分布一致，test-miss-rate 仍可保持在很低的水平。
- **对分布漂移敏感**：在训练‑测试分布发生漂移（即 [[concepts/data-drift|Data drift]]）的场景下，test-miss-rate 会显著恶化，成为检测模型覆盖能力下降的早期信号。

## 应用
- 评估 [[entities/inferdb|InferDB]] 等基于 [[concepts/prediction-table|Prediction Table]] 进行近似推理的系统在实际部署时的覆盖可靠性。
- 在模型上线前或持续监控阶段，通过跟踪 test-miss-rate 来判断是否需要触发重训练或 Fallback 策略。
- 结合 [[concepts/sparsity|Sparsity]] 和 [[concepts/fill-factor|Fill-factor]] 等多维指标，综合分析稀疏表示下的推理质量。

## 相关概念
- [[concepts/fill-factor|Fill-factor]]
- [[concepts/sparsity|Sparsity]]
- [[concepts/prediction-table|Prediction Table]]
- [[concepts/data-drift|Data drift]]

## 相关实体
暂无直接关联实体。

## 来源提及

- "6 特征时 fill-factor << 1%，但 test-miss-rate 仍低 [NYC-rides（分布一致时 sparsity 影响小）]" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
- "Sparsity 分析（fill-factor / test-miss-rate vs 特征数）" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
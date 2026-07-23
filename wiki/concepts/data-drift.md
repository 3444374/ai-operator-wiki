---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/inferdb_pvldb2024_424566]]"]
tags: [concept  # MUST be exactly "concept" - do not change this value, phenomenon]
aliases:
  - "数据漂移"
generation_complete: true
---


# Data drift

## 定义
数据漂移（Data drift）指机器学习模型部署后，生产环境中输入数据的统计分布相对于训练数据发生变化的自然现象。这种漂移会导致模型性能退化，因为模型所依赖的统计假设不再成立。在 InferDB 这类逻辑网络近似系统的场景下，数据漂移使基于静态训练数据构建的 Prediction Table 覆盖不足，出现更多未命中（test-miss），从而增加对 Prefix Search Fallback 的依赖，降低近似精度。

## 关键特征
- **分布偏移随时间演化**：输入特征的均值、方差或联合分布持续变化，可能由用户行为、环境或数据源更新导致。
- **模型性能退化**：预测准确率、近似精度等指标逐渐下降，常表现为 test‑miss‑rate 上升。
- **对静态结构冲击大**：预计算表（如 Prediction Table）无法自适应新数据，需要频繁重建或更新。
- **已知但未完全解决**：InferDB 的设计明确将其列为局限性，并指出自适应索引和合成数据生成是未来方向。

## 应用
- **InferDB 系统监测**：在生产环境中持续监控 test‑miss‑rate，当漂移显著时触发 Prediction Table 再训练。
- **自适应索引研究**：研究 drift‑aware 的索引结构，如增量更新预测表或动态选择 fallback 策略。
- **合成数据生成**：利用当前漂移后的分布生成合成训练数据，以重新训练 Prediction Table 而不依赖原始数据。
- **评估实验设计**：在基准测试中模拟多种漂移模式，验证系统的鲁棒性。

## 相关概念
- [[concepts/test-miss-rate|Test-miss-rate]]：衡量 Prediction Table 未命中率的指标，漂移会直接推高该值。
- [[concepts/prediction-table|Prediction Table]]：基于训练数据构建的静态映射表，对分布漂移敏感。
- [[concepts/sparsity|Sparsity]]：数据稀疏性会加剧漂移的影响，使得 key 区域覆盖更容易失效。

## 相关实体
(本概念暂无密切关联的实体条目)

## 来源提及

- "在实际生产场景中，数据漂移（drift）是常态而非例外。论文在 §7.7 中承认了这一点，但将 index 维护更新留给了 future work。" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
- "如果推理请求的分布随时间变化，predict table miss 率会逐步上升。" — [[raw/papers/inferdb_pvldb2024|inferdb_pvldb2024]]
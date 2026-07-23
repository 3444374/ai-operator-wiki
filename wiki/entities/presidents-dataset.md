---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/galois_sigmod2025_c4af88]]"]
tags: [other]
aliases:
  - "Presidents 数据集"
  - "Presidents Dataset"
generation_complete: true
---


# Presidents dataset

## 描述
Presidents 是 [[entities/palimpzest|Palimpzest]] 在 Galois 实验中用于评估 [[concepts/model-provided-confidence|模型提供的置信度（Model‑provided confidence, MC）]] 场景的数据集之一。该数据集包含各国总统的结构化信息，如姓名、国家、任期等。Presidents 的一个关键特性是它充分暴露了 LLM 在知识提取中的[[concepts/popularity-bias-in-llm-knowledge-extraction|实体流行度偏差（popularity bias）]]——例如，与美国相关的总统记录质量远高于委内瑞拉等小国。通过对 Presidents 数据集的实验，Galois 验证了在引入外部知识辅助后，这种由于训练数据不均衡导致的质量偏差可以得到部分缓解。

## 相关实体
- [[entities/palimpzest|Palimpzest]]
- [[entities/movies-dataset|Movies dataset]]
- [[entities/premier-dataset|Premier dataset]]
- [[entities/fortune-dataset|Fortune dataset]]

## 相关概念
- [[concepts/model-provided-confidence|Model‑provided confidence (MC)]]
- [[concepts/popularity-bias-in-llm-knowledge-extraction|Popularity bias in LLM knowledge extraction]]

## 来源提及

- "7 个数据集：Flight/Geo/World/Scholar（IK 内参知识）+ Movies/Presidents/Premier/Fortune（MC 上下文知识）+ Geo-Test（阈值校准）" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
- "关于 Venezuela 总统的数据质量远低于 USA 总统（AVG-Score 0.482 vs 0.862）——**实体流行度偏差**" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/galois_sigmod2025_c4af88]]"]
tags: [other]
aliases:
  - "World 数据集"
  - "World Data Set"
  - "World Dataset"
generation_complete: true
---


# World dataset

## 描述
World 是 Galois 实验中用于 [[concepts/internal-knowledge|Internal knowledge (IK)]] 场景的数据集之一，包含地理相关的结构化数据（如国家、城市的事实查询），用于评估 LLM 从参数知识中直接提取信息的能力。该数据集与 [[entities/flight-dataset|Flight dataset]]、[[entities/scholar-dataset|Scholar dataset]] 和 [[entities/geo-test|Geo-Test dataset]] 共同构成 IK 测试集，覆盖了不同领域的结构化知识。在 Galois 实验设计中，基于置信度的优化策略在 World 数据集上显著提升了查询质量，并降低了 token 成本，从而验证了方法的跨域泛化能力。

## 相关实体
- [[entities/flight-dataset|Flight dataset]]
- [[entities/scholar-dataset|Scholar dataset]]
- [[entities/geo-test|Geo-Test dataset]]

## 相关概念
- [[concepts/internal-knowledge|Internal knowledge (IK)]]

## 来源提及

- "7 个数据集：Flight/Geo/World/Scholar（IK 内参知识）+ Movies/Presidents/Premier/Fortune（MC 上下文知识）+ Geo-Test（阈值校准）" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
- "AVG-Score 提升（0.254 → 0.622） | LLaMa 3.1 70B，IK 场景" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
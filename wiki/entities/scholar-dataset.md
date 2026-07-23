---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/galois_sigmod2025_c4af88]]"]
tags: [other]
aliases:
  - "Scholar数据集"
  - "Scholar Dataset"
  - "Scholar"
generation_complete: true
---


# Scholar 数据集

## 描述
Scholar 数据集是一个用于内部知识（IK）场景的学术领域数据集，包含论文、作者、会议等结构化信息。在 Galois 系统的实验中，该数据集被用于评估大语言模型（LLM）在学术领域知识提取方面的准确性，是 IK 场景所使用的四个数据集之一。与 [[entities/flight-dataset|Flight 数据集]]、[[entities/world-dataset|World 数据集]] 以及 [[entities/geo-test|Geo-Test 数据集]] 类似，Scholar 数据集的实验结果验证了 Galois 优化策略在不同知识域下的有效性，反映了 IK 场景中结构化数据提取的共通挑战。

## 相关实体
- [[entities/flight-dataset|Flight 数据集]]
- [[entities/world-dataset|World 数据集]]
- [[entities/geo-test|Geo-Test 数据集]]

## 相关概念
- [[concepts/internal-knowledge|内部知识]]

## 来源提及

- "7 个数据集：Flight/Geo/World/Scholar（IK 内参知识）+ Movies/Presidents/Premier/Fortune（MC 上下文知识）+ Geo-Test（阈值校准）" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
- "Galois 质量提升 vs NL：144% AVG-Score 提升（在 IK 场景）" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
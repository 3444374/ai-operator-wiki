---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/galois_sigmod2025_c4af88]]"]
tags: [other]
aliases:
  - "Movies"
  - "Movies Dataset"
  - "MC Movies"
generation_complete: true
---


# Movies dataset

## 描述
Movies 数据集是 Galois 实验中用于 MC（模型提供的上下文知识）场景的数据集，属于 [[concepts/rag-scenario|RAG scenario]] 设置，即查询相关的文本片段作为上下文提供给 LLM。该数据集包含电影相关信息，如片名、导演、年份等，用于评估 Galois 在外部知识增强场景下的性能。在 MC 场景中，Galois 展示了与专用 RAG 系统 [[entities/palimpzest|Palimpzest]] 相当的回答质量，但 token 成本仅为后者的 1/11。Movies 数据集与 [[entities/presidents-dataset|Presidents dataset]]、[[entities/fortune-dataset|Fortune dataset]] 共同构成了 Galois 的 MC 场景评测套件。

## 相关实体
- [[entities/palimpzest|Palimpzest]]
- [[entities/presidents-dataset|Presidents dataset]]
- [[entities/fortune-dataset|Fortune dataset]]

## 相关概念
- [[concepts/model-provided-confidence|Model-provided confidence (MC)]]
- [[concepts/rag-scenario|RAG scenario]]

## 来源提及

- "7 个数据集：Flight/Geo/World/Scholar（IK 内参知识）+ Movies/Presidents/Premier/Fortune（MC 上下文知识）+ Geo-Test（阈值校准）" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
- "RAG 场景质量 | AVG-Score 0.711（vs Palimpzest 0.720，但 token 仅 1/11）" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/galois_sigmod2025_c4af88]]"]
tags: [other]
aliases:
  - "Fortune 数据集"
  - "Fortune Dataset"
  - "Fortune Data"
generation_complete: true
---


# Fortune dataset

## 描述
Fortune dataset 是 [[entities/palimpzest|Palimpzest]] 与 Galois 对比实验中使用的数据资源，重点应用于模型提供置信度（ [[concepts/model-provided-confidence|Model-provided confidence]] ，MC）场景的评估。该数据集内容可能源自《财富》杂志相关的企业排名、营收等商业信息。在 [[concepts/rag-scenario|RAG scenario]] 设置下，Fortune dataset 与 [[entities/premier-dataset|Premier dataset]] 一起被用来衡量 Galois 的优化效果。实验显示，Galois 在该数据集上的平均得分（AVG-Score）与专用 RAG 系统 [[entities/palimpzest|Palimpzest]] 相当，同时 token 消耗大幅减少。

## 相关实体
- [[entities/palimpzest|Palimpzest]]
- [[entities/movies-dataset|Movies dataset]]
- [[entities/premier-dataset|Premier dataset]]

## 相关概念
- [[concepts/model-provided-confidence|Model-provided confidence]]
- [[concepts/rag-scenario|RAG scenario]]

## 来源提及

- "7 个数据集：Flight/Geo/World/Scholar（IK 内参知识）+ Movies/Presidents/Premier/Fortune（MC 上下文知识）+ Geo-Test（阈值校准）" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
- "RAG 场景质量 | AVG-Score 0.711（vs Palimpzest 0.720，但 token 仅 1/11） | Premier + Fortune" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
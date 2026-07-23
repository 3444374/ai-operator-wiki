---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/galois_sigmod2025_c4af88]]"]
tags: [other]
aliases:
  - "Premier League数据集"
  - "英超数据集"
  - "Premier dataset"
generation_complete: true
---


# Premier dataset

## 描述
Premier dataset 是[[entities/palimpzest|Palimpzest]]系统中针对[[concepts/model-provided-confidence|Model-provided confidence (MC)]]场景构造的评测数据集。该数据集以英超联赛（Premier League）为核心，包含球队、球员、赛季排名等高度结构化的信息，具有显著的时效性——联赛排名逐年变化，无法依赖大语言模型预训练时的静态知识。因此，评估中必须引入外部[[concepts/rag-scenario|RAG scenario]]上下文，以验证在检索增强生成条件下基于置信度的优化策略是否有效。Galois 在该数据集上的实验表明，即使数据动态变化，通过模型输出的置信度信号仍能实现高效的查询处理和结果筛选。

## 相关实体
- [[entities/palimpzest|Palimpzest]] — 使用该数据集进行MC场景实验的声明式数据处理系统
- [[entities/movies-dataset|Movies dataset]] — 同为 Palimpzest 实验中用于不同场景的评测数据集
- [[entities/fortune-dataset|Fortune dataset]] — 同为 Palimpzest 实验中的另一个结构化数据集

## 相关概念
- [[concepts/model-provided-confidence|Model-provided confidence (MC)]] — Premier dataset 所验证的核心优化策略类型
- [[concepts/rag-scenario|RAG scenario]] — 由于数据时效性要求，评估必须依赖的外部知识检索范式

## 来源提及

- "7 个数据集：Flight/Geo/World/Scholar（IK 内参知识）+ Movies/Presidents/Premier/Fortune（MC 上下文知识）+ Geo-Test（阈值校准）" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
- "RAG 场景质量 | AVG-Score 0.711（vs Palimpzest 0.720，但 token 仅 1/11） | Premier + Fortune" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
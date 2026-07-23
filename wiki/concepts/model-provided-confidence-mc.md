---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/galois_sigmod2025_c4af88]]"]
tags: [term]
aliases:
  - "MC"
  - "MC context knowledge"
generation_complete: true
---


# Model-provided Confidence (MC)

## 定义
Model-provided confidence（MC）是 Galois 系统中区别于模型内知识（IK）的一种知识获取场景。在该场景下，大语言模型（LLM）**不直接持有回答查询所需的全部知识**，而必须依赖系统从外部源（如检索出的文档片段）提供的上下文。模型基于这些上下文进行推理并生成答案，同时输出针对该答案的置信度评估。MC 场景典型地出现在需要精确事实、实时信息或非通用知识的查询中，对应的评测数据集包括 Movies、Presidents、Premier、Fortune 等。Galois 在 MC 场景下仍能通过选择性裁剪上下文显著降低 token 消耗，但由于模型本身缺乏内部先验，其答案质量提升幅度不如 IK 场景明显。

## 关键特征
- 依赖外部上下文：LLM 自身参数中未编码答案，必须从外部提供的文档片段中提取信息
- 附带置信度输出：模型在生成答案的同时给出置信度估计，用于下游的决策或过滤
- 成本导向优化：Galois 通过去除冗余内容、压缩提示，在 MC 场景下有效降低 API 调用成本
- 质量增益有限：与 IK 相比，MC 场景下模型无法依赖内部先验，优化后的答案质量提升幅度更小
- 典型数据集：Movies、Presidents、Premier、Fortune 等，这些数据集天然要求从文档中检索事实

## 应用
- **检索增强生成（RAG）**：MC 是 RAG 流水线中的核心场景，系统从知识库中检索相关片段后交由 LLM 生成带置信度的答案
- **成本敏感推理**：在 Galois 等框架中，通过上下文剪枝与句子级选择，在 MC 模式下大幅降低 LLM 调用的 token 成本
- **置信度校准评估**：用于测试 LLM 在依赖外部知识时能否给出校准良好的置信度，以提升下游系统的可靠性

## 相关概念
- [[concepts/retrieval-augmented-generation|RAG]]
- [[concepts/intrinsic-knowledge|IK]]

## 相关实体
- [[entities/palimpzest|Palimpzest]]
- [[entities/galois|Galois]]
- [[entities/movies-dataset|Movies]]
- [[entities/presidents-dataset|Presidents]]
- [[entities/premier-dataset|Premier]]
- [[entities/fortune-dataset|Fortune]]

## 来源提及

- "Movies/Presidents/Premier/Fortune（MC 上下文知识）" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
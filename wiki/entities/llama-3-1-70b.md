---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/galois_sigmod2025_c4af88]]"]
tags: [product]
aliases:
  - "Llama 3.1 70B"
  - "LLaMA 3.1-70B"
generation_complete: true
---


# LLaMA 3.1 70B

## 描述

LLaMA 3.1 70B 是 Meta 发布的大规模语言模型，属于 LLaMA 3.1 系列中的 70B 参数版本。在 [[entities/galois|Galois]] 的实验设计中，该模型通过 [[entities/together-ai|Together AI]] 的 API 服务被用作主要的内部知识提取器，专门用于评测 Galois 在 **内部知识（Internal Knowledge, IK）** 场景下的性能表现。LLaMA 3.1 70B 作为能力强大的通用基础模型，为基于 [[concepts/confidence-based-optimization-for-llm-queries|Confidence-based optimization for LLM queries]] 的查询优化策略提供了可靠的检验基准，帮助验证 Galois 是否能有效释放 LLM 内在知识以提升数据库查询效率。

## 相关实体

- [[entities/together-ai|Together AI]]

## 相关概念

- [[concepts/confidence-based-optimization-for-llm-queries|Confidence-based optimization for LLM queries]]
- [[concepts/internal-knowledge|Internal knowledge (IK)]]

## 来源提及

- "144% AVG-Score 提升（0.254 → 0.622）| LLaMa 3.1 70B，IK 场景" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
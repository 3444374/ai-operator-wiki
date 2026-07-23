---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/galois_sigmod2025_c4af88]]"]
tags: [product]
aliases:
  - "GPT-4o mini API"
  - "OpenAI GPT-4o mini"
  - "GPT-4o Mini"
generation_complete: true
---


# GPT-4o mini

## 描述
GPT-4o mini 是 OpenAI 推出的轻量级大语言模型（LLM）API，旨在以更低的推理成本提供高质量的语言理解与生成能力。在 [[sources/galois_sigmod2025_c4af88|Galois 实验（SIGMOD 2025）]]中，该模型被部署为结构化数据提取的 LLM 后端之一，与 [[entities/together-ai|Together AI]] 提供的 [[entities/llama-3-1-70b|LLaMA 3.1 70B]] 模型并列使用。其较低的每查询成本有助于降低整体系统开销，同时输出质量直接影响下游算子的准确率与置信度阈值设定。GPT-4o mini 的推理性价比是 [[entities/galois|Galois]] 系统进行 [[concepts/confidence-based-optimization-for-llm-queries|基于置信度的 LLM 查询优化]] 时选择处理器（GPU/CPU）和调度策略的关键因素之一。

## 相关实体
- [[entities/together-ai|Together AI]]
- [[entities/llama-3-1-70b|LLaMA 3.1 70B]]
- [[entities/galois|Galois]]

## 相关概念
- [[concepts/confidence-based-optimization-for-llm-queries|Confidence-based optimization for LLM queries]]

## 来源提及

- "使用公开 LLM API（GPT-4o mini / Together AI LLaMa）" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
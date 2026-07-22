---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/db_perspective_llm_pvldb2025_300968]]"]
tags: [product]
aliases:
  - "TurboTransformers 推理框架"
  - "TurboTransformers"
generation_complete: true
---


# TurboTransformers

## 描述

TurboTransformers 是一个面向大语言模型（LLM）的推理框架，在本文中被引用为 batch formation 策略的早期代表性工作。其核心设计思路是通过最小化 tensor sparsity（即减少 ragged tensor 中因 padding 造成的填充浪费）来提升 batch 计算效率。在 [[concepts/continuous-batching|Continuous Batching]] 出现之前，传统的 static batching 方法面临 ragged tensor 问题：同一 batch 中不同请求的序列长度差异导致大量无效的填充和计算开销。TurboTransformers 尝试通过更智能的请求分组策略来缓解这一瓶颈，但原文指出其策略仍属于较粗粒度的 batch 构造方式，因此为本课题所提出的 token-budget batching 提供了一个重要的对比基线。该框架体现了 LLM 服务系统中 [[concepts/request-batching|Request Batching]] 这种[[concepts/批量构造策略|Batch 构造策略]]的早期探索方向。

## 相关实体

无

## 相关概念

- [[concepts/continuous-batching|Continuous Batching]]
- [[concepts/request-batching|Request Batching]]
- [[concepts/批量构造策略|批量构造策略]]

## 来源提及

- "Continuous batching 通过周期性重新组批平衡 TTFT 和 TBT，但 batch formation 策略（如 TurboTransformers 最小化 tensor sparsity、ByteTransformer 重打包 ragged tensor）仍较粗粒度。" — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
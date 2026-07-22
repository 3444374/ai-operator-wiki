---
type: entity
created: 2025-07-22
updated: 2026-07-22
sources: ["[[sources/db_perspective_llm_pvldb2025_300968]]"]
tags: [product]
aliases:
  - "ByteTransformer 推理框架"
generation_complete: true
---


# ByteTransformer

## 描述
ByteTransformer 是一个面向大语言模型推理的优化框架，其核心技术是针对不规则（ragged）张量的“重打包”（repacking）策略。该技术通过重新排列可变长度的序列来最大化 GPU 张量核心的利用率，从而大幅减少无效填充带来的计算开销。与 [[entities/turbotransformers|turbotransformers]] 致力于降低张量稀疏性的思路不同，ByteTransformer 专注于在 ragged tensor 内部重组数据以提升计算密度，两者形成互补。然而，原文指出，即便与 [[concepts/continuous-batching|continuous-batching]] 等动态批处理技术结合使用，ByteTransformer 和 TurboTransformers 的批量构造策略仍然停留在较粗的粒度，这为未来引入 token‑level 的更精细调度留下了空间。

## 相关实体
- [[entities/turbotransformers|turbotransformers]]：TurboTransformers 推理框架，通过最小化张量稀疏性提升效率，与 ByteTransformer 的重打包策略互补。

## 相关概念
- [[concepts/continuous-batching|continuous-batching]]：动态批处理技术，ByteTransformer 可与之结合，但组合后批量构造仍偏粗粒度。
- [[concepts/request-batching|Request Batching]]：请求批处理技术的一般概念，ByteTransformer 的 repacking 策略是针对 ragged tensor 场景的一种高效实现。

## 应用
> “ByteTransformer repacks ragged tensors to maximize GPU tensor core utilization, thereby reducing padding overhead. When combined with continuous batching, both ByteTransformer and TurboTransformers still exhibit coarse‑grained batch formation, suggesting the need for token‑level fine‑grained scheduling.” (PVLDB 2025)

## 来源提及

- "batch formation 策略（如 TurboTransformers 最小化 tensor sparsity、ByteTransformer 重打包 ragged tensor）仍较粗粒度。" — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
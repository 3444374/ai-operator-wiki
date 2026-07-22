---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/db_perspective_llm_pvldb2025_300968]]"]
tags: [method]
aliases:
  - "注意力算子"
  - "Attention Operator"
  - "注意力机制"
generation_complete: true
---


# Attention

## 定义
Attention 是 Transformer 架构的核心注意力计算算子，负责计算输入序列中各位置之间的相关性权重，从而生成上下文感知的表示。在 LLM 推理中，Attention 与 [[concepts/ffn|FFN]]、[[concepts/token-sampler|Token Sampler]] 并列为 Request Processing 层的三大基础算子。自回归解码阶段每次生成新 token 都需要与所有历史 KV cache 进行注意力计算，导致其占据大量内存和计算资源。

## 关键特征
- **自注意力机制**：通过 Query、Key、Value 三个矩阵的缩放点积操作捕获序列内依赖关系
- **自回归依赖**：解码过程依赖完整的历史 KV cache，计算复杂度随序列长度平方增长
- **内存密集**：大量 KV cache 占用显存，对带宽敏感，成为推理瓶颈
- **多层级优化**：支持 kernel 级优化（如 [[concepts/flashattention|FlashAttention]]、[[concepts/flashdecoding|FlashDecoding]]、[[concepts/ring-attention|Ring Attention]]）和系统级优化（如 [[concepts/pagedattention|PagedAttention]]）

## 应用
在 LLM 推理流水线中，Attention 算子广泛用于自回归解码和预填充阶段，直接影响首 token 延迟（[[concepts/ttft|TTFT]]）与 token 间延迟（[[concepts/tbt|TBT]]）。通过请求批处理（[[concepts/request-batching|请求批处理]]）与调度策略，可以进一步平衡其计算与内存开销。

## 相关概念
- [[concepts/ffn|FFN]]
- [[concepts/flashattention|FlashAttention]]
- [[concepts/flashdecoding|FlashDecoding]]
- [[concepts/ring-attention|Ring Attention]]
- [[concepts/pagedattention|PagedAttention]]
- [[concepts/token-sampler|Token Sampler]]
- [[concepts/request-batching|请求批处理]]
- [[concepts/ttft|TTFT]]
- [[concepts/tbt|TBT]]

## 相关实体
暂无

## 来源提及

- "Request Processing 层的第一部分是 Operator Design，包括 Attention、FFN 和 Token Sampler。" — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
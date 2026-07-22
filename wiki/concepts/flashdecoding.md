---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: []
tags: [method]
aliases:
  - "Flash-Decoding"
  - "Flash Decoding"
generation_complete: true
---


# FlashDecoding

## 定义
FlashDecoding 是一种针对 Transformer 模型解码阶段优化的注意力计算 CUDA kernel，旨在通过分段并行处理键值（KV）对长序列进行高效注意力计算，显著降低延迟。它是对 FlashAttention 在解码场景的扩展，特别适用于大批量（large batch）和长上下文推理，是推理系统内核层性能优化的重要组成部分。

## 关键特征
- 继承 FlashAttention 的分块重计算策略，专门优化解码阶段自回归生成时只产生单个查询 token 的计算模式。
- 将长序列的键值矩阵沿序列维度切分为多个块，并行计算各块的注意力分数，并结合在线 softmax 归一化保持数值稳定性。
- 显著减少 GPU 高带宽内存（HBM）访问，在保持内存效率的同时提高计算并行度，降低解码延迟。
- 对大批次处理和极长上下文（如 128K tokens）场景具有显著加速效果，可与连续批处理等调度策略协同工作。

## 应用
- **大语言模型推理加速**：作为算子级优化，与 FlashAttention、Ring Attention 等技术共同集成于推理框架（如 vLLM、SGLang）中，提升长序列令牌生成速度。
- **长上下文服务**：在文档理解、对话系统等需要处理大量上下文信息的任务中，降低首 token 延迟和每 token 生成延迟。
- **高吞吐在线推理**：面向大并发请求场景，配合分块预填充（Chunked Prefill）等方法，平衡计算与内存开销，提高 GPU 利用率。

## 相关概念
- [[concepts/flashattention|FlashAttention]]
- [[concepts/ring-attention|Ring Attention]]
- [[concepts/continuous-batching|Continuous Batching]]
- [[concepts/chunked-prefill|Chunked Prefill]]

## 相关实体
暂无直接关联实体。

## 来源提及

- "C1[Kernels FlashAttention / FlashDecoding / Ring Attention]" (C1[内核：FlashAttention / FlashDecoding / Ring Attention]) — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
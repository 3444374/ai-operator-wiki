---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: []
tags: [method]
aliases:
  - "缓存持久化"
generation_complete: true
---


# Cache Persistence

## 定义
Cache Persistence 是 LLM 推理 Memory Management 层中的一类方法，关注如何在**不同的推理请求之间保留、复用 KV cache**，从而减少重复计算，提升整体吞吐和延迟表现。该方法的核心策略包括 **Prefix Sharing**（前缀共享）和 **Selective Reconstruction**（选择性重构），并在 **PagedAttention** 范式之上工作：分页的物理内存管理使得多个请求的 block table 可以指向相同的物理块，实现缓存共享与持久化。

## 关键特征
- **跨请求 KV cache 复用**：将一次请求生成的键值缓存保留下来，供后续请求直接使用，避免对相同前缀或 prompt 的重复计算。
- **Prefix Sharing 机制**：利用 [[concepts/prefix-sharing|Prefix Sharing]] 技术，识别并共享多个请求的公共前缀所对应的 KV cache 块。
- **Selective Reconstruction**：在缓存失效或不完整时，仅对必要的部分重新计算 KV cache，而不必重建整个缓存。
- **依赖 PagedAttention 的分页管理**：底层通过 [[concepts/pagedattention|PagedAttention]] 的虚拟/物理块映射，实现不同请求的 block table 指向同一个物理块，从而支持缓存的持久化与共享。
- **与 Eviction & Offloading、Quantization 并列**：Cache Persistence 与 [[concepts/eviction-and-offloading|Eviction & Offloading]]、量化等技术共同构成内存优化栈，通过不同路径降低内存占用和计算开销。

## 应用
- **多轮对话与 system prompt 复用**：在对话系统中，多次轮次往往共享相同的 system prompt 或历史对话前缀，持久化该部分的 KV cache 可大幅减少计算量。
- **批量相似请求处理**：对于一批具有相同前缀的请求（如相同指令前缀的批量推理），通过前缀共享，避免对公共前缀的重复计算。
- **Serverless 及弹性推理场景**：在 [[entities/vllm|vLLM]]、[[entities/sglang|SGLang]] 等推理框架中，Cache Persistence 有助于缩短冷启动时间，提升请求调度的效率。
- **长文本处理**：对于超长 prompt 或文档的相似片段，缓存持久化可减少解码阶段的冗余计算。

## 相关概念
- [[concepts/prefix-sharing|Prefix Sharing]]
- [[concepts/kv-cache|KV Cache]]
- [[concepts/pagedattention|PagedAttention]]
- [[concepts/eviction-and-offloading|Eviction & Offloading]]

## 相关实体
- [[entities/vllm|vLLM]]
- [[entities/sglang|SGLang]]

## 来源提及

- "Memory Management 层的 Cache Persistence 包括 Prefix Sharing 和 Selective Reconstruction。" — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
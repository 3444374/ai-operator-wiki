---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/readme_425fbb]]"]
tags: [method]
aliases:
  - "PagedAttention"
generation_complete: true
---


# PagedAttention

## 定义
PagedAttention 是一种面向大语言模型（LLM）推理的高效内存管理技术。它借鉴操作系统的**分页**思想，将注意力机制中的**键值缓存（KV Cache）**切分为固定大小的 **Page**，以 Page 为单位进行细粒度的内存分配、回收和共享，从而解决自回归生成过程中 KV 缓存的内存碎片化与浪费问题，显著提升推理系统的吞吐量。

## 关键特征
- **分页式内存管理**：将 KV 缓存划分为固定大小的 Page，允许非连续物理内存块按需映射，避免预先分配一整块连续内存带来的浪费与碎片。
- **细粒度分配与回收**：以 Page 为单位动态申请和释放 KV 缓存，使得内存利用率接近理论最优，支持同时处理更多并发请求。
- **KV 缓存共享**：同一请求内部或多个请求之间可以安全共享相同的 KV 缓存 Page（如 Beam Search、并行解码场景），进一步减少冗余内存占用。
- **兼容现有注意力实现**：基于 PagedAttention 的推理引擎无需修改底层注意力算子（如 FlashAttention），只需在上层调度与内存管理层面实现分页逻辑。
- **解耦 Prefill 与 Decode**：与 [[concepts/prefill-decode-stage|Prefill/Decode Stage]] 调度策略协同，Prefill 阶段批量写入 KV 缓存，Decode 阶段逐个 token 更新，充分发挥分页管理的优势。

## 应用
- **高性能 LLM 推理服务**：作为 [[entities/vllm|vLLM]] 的核心技术，支撑高并发、低延迟的在线推理，吞吐量可达传统实现（如 HuggingFace Transformers）的数倍。
- **内存受限环境下的推理优化**：在资源有限的硬件上 PagedAttention 能够最大化有效内存利用率，允许在相同 GPU 显存下服务更多并发用户或更大模型。
- **Serverless / 弹性推理系统**：[[entities/serverlessllm|ServerlessLLM]] 等系统利用 PagedAttention 的分页特性实现 KV 缓存的快速检查点、迁移与恢复，支撑弹性缩扩容。
- **调度与批处理优化**：[[entities/sarathi-serve|sarathi-serve]] 等系统结合分页管理与 [[concepts/throughput-latency-tradeoff|Throughput-Latency Tradeoff]] 进行 Prefill/Decode 混合调度，进一步提升整体吞吐和 GPU 利用率。

## 相关概念
- [[concepts/prefill-decode-stage|Prefill/Decode Stage]]
- [[concepts/throughput-latency-tradeoff|Throughput-Latency Tradeoff]]
- [[concepts/llm-inference-cost-model|llm-inference-cost-model]]

## 相关实体
- [[entities/vllm|vLLM]]
- [[entities/serverlessllm|ServerlessLLM]]
- [[entities/sarathi-serve|sarathi-serve]]

## 来源提及

- "`3600006.3613165.pdf` | Efficient Memory Management for Large Language Model Serving with PagedAttention | 16 | vLLM；学习机制总览、局部机制放大、吞吐-延迟表达" (`3600006.3613165.pdf` | 高效内存管理用于大语言模型服务中的PagedAttention | 16 | vLLM；用于学习机制总览、局部机制放大和吞吐-延迟表达) — [[raw/papers/README|README]]
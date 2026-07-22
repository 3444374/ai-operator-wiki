---
type: entity
created: 2025-04-09
updated: 2026-07-22
sources:
  - "[[sources/readme_425fbb]]"
  - "[[sources/db_perspective_llm_pvldb2025_300968]]"
tags:
  - "product"
aliases:
  - "vLLM"
  - "Efficient LLM Serving System"
generation_complete: true
---

## 相关实体
- [[entities/sglang|SGLang]]
- [[entities/mooncake|Mooncake]]
- [[entities/sarathi-serve|Sarathi-Serve]]
- [[entities/serverlessllm|ServerlessLLM]]

## 相关概念
- [[concepts/paged-attention|PagedAttention]]
- [[concepts/continuous-batching|Continuous Batching]]
- [[concepts/throughput-latency-tradeoff|Throughput-Latency Tradeoff]]
- [[concepts/prefill-decode-stage|Prefill/Decode Stage]]

## 描述
vLLM 是一个面向大语言模型（LLM）的高效推理服务系统，其核心贡献是 [[concepts/paged-attention|PagedAttention]] 内存管理机制。该系统通过将注意力键值缓存以分页的形式管理，有效解决了传统 KV 缓存的内存碎片问题，从而显著提升推理吞吐并降低首词延迟。vLLM 的架构设计清晰地划分了 [[concepts/prefill-decode-stage|Prefill/Decode Stage]] 两阶段，并通过可视化图表直观地揭示了系统性能瓶颈与优化路径，成为复杂系统机制分析的典型案例。在实际研究中，vLLM 在 [[concepts/throughput-latency-tradeoff|Throughput-Latency Tradeoff]] 方面的精细化分析常被用于与其他推理服务（如 [[entities/sarathi-serve|Sarathi-Serve]]）进行对比，为推理系统的迭代提供了基准。此外，该论文在技术写作层面的表现——包括系统总览、局部放大以及权衡关系的表达——也为学术与工程文档的撰写提供了参考范例。

## 来源提及

- "`3600006.3613165.pdf` | Efficient Memory Management for Large Language Model Serving with PagedAttention | 16 | vLLM；学习机制总览、局部机制放大、吞吐-延迟表达" (`3600006.3613165.pdf` | 高效内存管理用于大语言模型服务中的PagedAttention | 16 | vLLM；用于学习机制总览、局部机制放大和吞吐-延迟表达) — [[raw/papers/README|README]]
- "vLLM [12] 将 KV cache 按 page/block 管理（类比 OS 虚拟内存），解决静态预分配导致的碎片和浪费。" — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
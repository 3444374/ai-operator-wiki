---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/db_perspective_llm_pvldb2025_300968]]"]
tags: [product]
aliases:
  - "SG-Lang"
  - "sglang"
generation_complete: true
---


# SGLang

## 描述
SGLang 是一个高效的 LLM 推理框架，由 Lianmin Zheng 等人开发，专注于结构化输出生成与前缀共享优化。它采用 radix tree 进行前缀匹配、cache-aware scheduler 管理 KV cache 以及 prefill interleaving 策略，能够在低延迟场景下提供卓越的推理性能。在本教程中，SGLang 被列为集中式推理系统的代表，与 [[entities/vllm|vllm]] 形成对比，后者更强调通用性，而 SGLang 在结构化生成和前缀复用上优势明显。SGLang 的设计充分利用了 [[concepts/continuous-batching|continuous-batching]] 和 [[concepts/paged-attention|PagedAttention]] 的思想，但通过更激进的前缀共享和调度优化实现了更低的尾部延迟。

## 相关实体
- [[entities/vllm|vllm]] — 对比框架，常与 SGLang 在推理吞吐与延迟上进行对标
- [[entities/lianmin-zheng|Lianmin Zheng]] — SGLang 的核心开发者

## 相关概念
- [[concepts/continuous-batching|continuous-batching]] — SGLang 的请求调度继承自此技术，并在此基础上增加了 cache-aware 优化
- [[concepts/paged-attention|PagedAttention]] — KV cache 管理方法，SGLang 通过 radix tree 增强了前缀共享能力
- [[concepts/load-balancing|Load Balancing]] — 在分布式部署中，SGLang 需要与负载均衡策略协同以发挥前缀共享的优势

## 来源提及

- "SGLang [20] 使用 radix tree 做前缀匹配 + cache-aware scheduler + prefill interleaving" (SGLang [20] 使用radix树进行前缀匹配，配合缓存感知调度器和prefill交错执行。) — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
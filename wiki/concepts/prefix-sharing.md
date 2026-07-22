---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/db_perspective_llm_pvldb2025_300968]]"]
tags: [method]
aliases:
  - "前缀共享"
  - "前缀缓存"
generation_complete: true
---


# Prefix Sharing

## 定义
Prefix Sharing（前缀共享/前缀缓存）是一种在大型语言模型（LLM）推理过程中优化键值缓存（KV Cache）持久化的技术。其核心思想是：当多个推理请求具有相同的前缀序列时，系统仅计算一次该前缀的 KV 缓存，并让后续请求直接复用，从而避免重复的注意力计算。它在 LLM 推理系统的内存管理层中属于“缓存持久化”子层的关键策略。

## 关键特征
- **基于前缀匹配**：只共享请求之间完全一致的连续前缀部分，后续序列仍然独立计算。
- **树状或块状共享结构**：SGLang 使用基数树（Radix Tree）将所有请求按前缀组织成树，同一前缀路径上的 KV 缓存被所有相关请求复用；vLLM 的 PagedAttention 则通过 Block Sharing 机制在小粒度上实现 KV 块的共享。
- **典型场景驱动**：尤其适用于系统提示词（system prompt）固定复用、多轮对话中的历史共享、批量请求中的公共前缀复用等场景。
- **性能与资源收益**：显著降低首 Token 延迟（TTFT），减少冗余计算与显存占用，提高 GPU 利用率。

## 应用
- **推理引擎优化**：SGLang、vLLM 等主流 LLM 推理框架均将 Prefix Sharing 作为提升并发与降低延迟的核心手段。
- **多轮对话系统**：同一会话中，后续请求可直接复用之前已计算的对话历史 KV 缓存。
- **批量在线服务**：当一批请求共享相同的系统指令或预设上下文时，Prefix Sharing 可大幅削减计算开销，提升吞吐量。

## 相关概念
- [[concepts/kv-cache|KV Cache]]
- [[concepts/pagedattention|PagedAttention]]
- [[concepts/radix-tree|Radix Tree]]
- [[concepts/database-perspective-on-llm-inference|数据库视角下的LLM推理]]

## 相关实体
- [[entities/sglang|sglang]]
- [[entities/vllm|vllm]]

## 来源提及

- "Cache Persistence 包括 Prefix Sharing 和 Selective Reconstruction。" — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
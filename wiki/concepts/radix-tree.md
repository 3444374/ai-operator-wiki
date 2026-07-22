---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/db_perspective_llm_pvldb2025_300968]]"]
tags: [method]
aliases:
  - "基数树"
  - "前缀树"
  - "Radix Tree"
generation_complete: true
---


# Radix Tree

## 定义
Radix Tree（基数树）是 [[entities/sglang|sglang]] 推理系统中用于高效管理和匹配请求前缀共享的压缩前缀树数据结构。它将请求的 token 序列按前缀组织成一棵树，每个节点对应一个 token 前缀，并存储其对应的 [[concepts/kv-cache|KV Cache]] 缓存位置。新请求到达时，系统沿 radix tree 匹配最长公共前缀，直接复用已缓存的 KV 数据，避免重复计算。

## 关键特征
- **压缩前缀组织**：将具有相同前缀的请求合并为树中的共享路径，节点仅存储分叉处的差异部分，节省内存。
- **最长前缀匹配**：通过树的层次遍历快速定位与请求 token 序列匹配的最长前缀，实现 O(L) 或 O(L·log(N)) 的查找复杂度（其中 L 为序列长度，N 为缓存前缀数量）。
- **KV 缓存复用**：每个节点指向一份或多份预计算的 [[concepts/kv-cache|KV Cache]]，推理时直接加载相应缓存，消除重复的注意力和前馈计算。
- **部分共享友好**：支持可变长度前缀的部分共享，比基于 hash 的精确匹配更灵活，能处理如系统提示、多轮对话等常见前缀共享场景。
- **动态演化**：支持运行时插入新前缀节点、合并可压缩路径（如 Patricia trie 变体），以适应新的请求模式。

## 应用
- **LLM 推理加速**：在 [[entities/sglang|sglang]] 等推理框架中，通过在 radix tree 上匹配请求前缀，实现 token-by-token 生成时的 KV 缓存共享，显著降低首 token 延迟（[[concepts/ttft|TTFT]]）和整体计算开销。
- **多轮对话系统**：对具有长共享前缀（如 system prompt）的批量请求，radix tree 天然保留共享部分的缓存，避免每个请求独立计算，提升吞吐量。
- **请求调度优化**：推理调度器可根据 radix tree 的当前形态，将具有相同前缀的请求批量调度到同一 GPU，最大化缓存局部性。

## 相关概念
- [[concepts/prefix-sharing|Prefix Sharing]]
- [[concepts/kv-cache|KV Cache]]
- [[concepts/ttft|TTFT]]
- [[concepts/attention|Attention]]

## 相关实体
- [[entities/sglang|sglang]]
- 其他支持前缀共享的推理系统（如 [[entities/vllm|vLLM]]、[[entities/sarathi-serve|sarathi-serve]]）的部分实现中也可隐式或显式使用 radix tree 变体。

## 来源提及

- "SGLang 使用 radix tree 做前缀匹配 + cache-aware scheduler + prefill interleaving。" — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
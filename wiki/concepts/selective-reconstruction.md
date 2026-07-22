---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: []
tags: [method]
aliases:
  - "选择性 KV cache 重建"
  - "Selective KV Cache Reconstruction"
generation_complete: true
---


# Selective Reconstruction

## 定义
Selective Reconstruction 是 [[concepts/cache-persistence|Cache Persistence]] 中与 [[concepts/prefix-sharing|Prefix Sharing]] 互补的一种方法。当系统因内存压力或调度导致部分 KV cache 块被驱逐或失效后，该方法并不强制整个请求进行完整的 prefill 重计算，而是通过重要性评估（例如基于注意力权重）选择性地重建那些对后续生成最关键的 KV cache 块，从而在恢复速度与计算开销之间取得平衡。在 PagedAttention 范式下，选择性重建可按 block 粒度执行，利用分页管理的灵活性实现局部的缓存恢复。

## 关键特征
- 与 Prefix Sharing 的策略互补：Prefix Sharing 通过跨请求重用前缀减少重复计算，而 Selective Reconstruction 则在缓存丢失后按需补建关键块。
- 基于注意力或其它重要性度量的选择性：仅重建注意力权重最高、对输出质量影响最大的位置对应的 cache 块，而非全部重算。
- 块级粒度恢复：借助 [[concepts/pagedattention|PagedAttention]] 的分页管理，将 KV cache 划分为固定大小的 block，可单独重建被驱逐的块，避免整条序列的 prefill。
- 平衡延迟与吞吐：在高负载、长序列场景下，通过减少不必要的计算降低 prefill 时间，同时保持可接受的生成质量。
- 与 [[concepts/eviction-&-offloading|Eviction and Offloading]] 策略协同：配合驱逐策略记录哪些块需要优先恢复，提升缓存生命周期管理的整体效率。

## 应用
- 大型语言模型在线推理服务：在内存受限或请求突发时，KV cache 被驱逐后通过 Selective Reconstruction 快速恢复服务，降低首 token 延迟。
- 与 Cache-aware Scheduling 结合：调度器预判哪些块可能被重用，结合部分重建策略优化全局缓存命中率。
- 长上下文或多轮对话场景：对于长文档问答或多轮对话，注意力集中在少数关键 token 上，选择性重建能大幅减少不必要的预填充开销，提升交互响应速度。

## 相关概念
- [[concepts/cache-persistence|cache-persistence]]
- [[concepts/prefix-sharing|prefix-sharing]]
- [[concepts/kv-cache|KV Cache]]
- [[concepts/pagedattention|PagedAttention]]
- [[concepts/eviction-&-offloading|eviction-&-offloading]]

## 相关实体
（暂无直接关联实体）

## 来源提及

- "Cache Persistence 包括 Prefix Sharing 和 Selective Reconstruction。" — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
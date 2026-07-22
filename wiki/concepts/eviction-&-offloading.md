---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: []
tags: [method]
aliases:
  - "KV cache 驱逐与卸载"
  - "Eviction and Offloading"
  - "KV Cache Eviction and Offloading"
generation_complete: true
---


# Eviction & Offloading

## 定义
Eviction & Offloading 是 LLM 推理系统的 Memory Management 层中，用于管理 KV cache 容量的两类互补策略。Eviction（驱逐）在 GPU 显存不足时，依据注意力分数、访问频率或位置信息等重要性度量，丢弃部分 KV cache 块以腾出空间；Offloading（卸载）则将暂时不活跃的 KV cache 块从 GPU 显存迁移到 CPU 内存或本地磁盘，并在后续需要时重新换回。两种策略都建立在 [[concepts/pagedattention|PagedAttention]] 的分页管理机制之上，使得对 KV cache 的淘汰和迁移可以按 block 粒度进行，而非整个请求粒度的粗放管理。

## 关键特征
- 基于 block 粒度的细粒度管理：借助分页机制，eviction 和 offloading 独立作用于每一个 KV cache block，避免因单个请求而驱逐或迁移大量连续内存。
- 多维度驱逐策略：Eviction 可采用基于位置（如远离当前 token 的块）、基于注意力分数（低分块优先淘汰）或基于使用频率（LFU/LRU-like）的重要性度量，平衡显存回收与推理质量。
- 分层存储的透明迁移：Offloading 将 GPU 显存中的冷块卸载到 CPU 内存或磁盘，并在 attention 计算需要时提前预取换回，对上层推理流程保持透明。
- 与其它内存优化技术协同：与基于分页的分配、量化（[[concepts/quantization|Quantization]]）、缓存持久化（[[concepts/cache-persistence|Cache Persistence]]）共同构成 Memory Management 层的完整技术栈，实现显存利用率与推理延迟之间的多维权衡。
- 动态、在线决策：Eviction 和 offloading 的触发通常依赖于实时的显存利用率监控和块访问模式分析，保证系统在负载变化时依然可维持高吞吐。

## 应用
- 大吞吐长文本推理：当单个请求的 KV cache 过大（如长上下文或批量并发请求）导致 GPU 显存触及上限时，通过 eviction 淘汰非关键块以避免 OOM，同时通过 offloading 保留完整历史，在需要时再换回。
- 多轮对话与缓存持久化：在多轮对话或持久化缓存场景下，利用 offloading 将历史对话的 KV cache 存放在 CPU/磁盘，新请求到来时按需加载，减少重复 prefill 开销。
- 异构硬件部署：在 GPU 显存受限的边缘设备或服务器中，offloading 可将 LLM 推理扩展到 GPU+CPU 混合内存架构，提升部署灵活性。
- Cache-aware 调度优化：与缓存感知调度（[[concepts/cache-aware-scheduling|Cache-aware scheduling]]）协同，结合请求的前缀共享特征，优先淘汰或卸载非共享块，进一步提高有效显存利用率。

## 相关概念
- [[concepts/kv-cache|KV Cache]]：被管理和优化的核心对象，eviction 与 offloading 直接操作其存储块。
- [[concepts/pagedattention|PagedAttention]]：分页式注意力实现，提供 block 粒度的 KV cache 管理基础，使 eviction/offloading 得以高效实施。
- [[concepts/cache-persistence|Cache Persistence]]：与 offloading 配合，将 KV cache 持久化至磁盘，实现跨请求重用。
- [[concepts/quantization|Quantization]]：通过降低精度进一步压缩 KV cache 体积，可与 eviction/offloading 组合使用。

## 相关实体
- [[entities/vllm|vLLM]]：率先实现 PagedAttention 并支持 block 级 eviction/offloading 的典型推理框架，其内存管理模块是该策略的重要实践案例。

## 来源提及

- "Eviction & Offloading 根据 Position/Attention/Usage-based Importance 决定驱逐或卸载 KV cache。" — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
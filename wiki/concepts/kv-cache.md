---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/db_perspective_llm_pvldb2025_300968]]"]
tags: [term]
aliases:
  - "键值缓存"
  - "Key-Value Cache"
  - "KV cache"
generation_complete: true
---


# KV Cache

## 定义
Transformer 解码器在自回归生成过程中，缓存先前时间步计算出的 **Key** 和 **Value** 矩阵，从而避免对历史 token 重复计算的优化技术。它是大语言模型（LLM）推理阶段内存占用的主要来源。

## 关键特征
- **以空间换时间**：存储历史 Key/Value 投影，使每个新 token 只需计算当前 token 的查询（Query），大幅降低计算量。
- **内存密集型**：KV Cache 的大小与批次大小、序列长度和层数线性增长，是推理内存瓶颈的核心。
- **动态且不确定**：类似于数据库的 buffer pool 管理 volatile data，KV Cache 的分配、驱除和生命周期管理高度依赖请求的实时到达模式。
- **分页管理**：受操作系统虚拟内存启发，PagedAttention 将 KV Cache 划分为固定大小的“页面”，实现细粒度内存分配与零碎片化共享。
- **卸载与共享**：可通过 GPU-CPU 混合存储、跨请求 Prefix Caching 或分布式卸载（如 Mooncake）等方式进一步缓解显存压力。

## 应用
- **LLM 推理引擎**：在 [[entities/vllm|vLLM]] 和 [[entities/sglang|SG-Lang]] 等系统中，KV Cache 的高效管理是实现高吞吐、低延迟服务的核心。
- **Continuous Batching**：通过复用和动态调度 KV Cache 块，支持在单批次内混合处理不同阶段的请求。
- **量化与压缩**：结合 KV Cache 量化（如 INT8/FP8 存储）降低内存占用，以支持更长的上下文窗口。
- **Serverless 推理**：[[entities/mooncake|Mooncake]] 等系统利用解耦的 KV Cache 存储实现弹性扩展。

## 相关概念
- [[concepts/flashattention|Flash Attention]] – 加速注意力计算，减少中间结果显存占用，间接降低 KV Cache 峰值。
- [[concepts/flashdecoding|Flash-Decoding]] – 优化推理解码阶段注意力，高效并行处理 KV Cache。
- [[concepts/ring-attention|Ring Attention]] – 分布式 KV Cache 协同，实现超长序列跨设备生成。

## 相关实体
- [[entities/vllm|vLLM]]
- [[entities/sglang|SG-Lang]]
- [[entities/mooncake|Mooncake 分布式推理系统]]
- [[entities/sarathi-serve|Sarathi-Serve]]
- [[entities/vattention|vAttention]]

## 来源提及

- "PagedAttention 通过分页块管理 KV cache，支持 block sharing" (PagedAttention通过分页块管理KV缓存，支持块共享。) — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
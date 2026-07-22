---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: []
tags: [method]
aliases:
  - "Ring Attention"
  - "环形注意力"
  - "环形注意力机制"
generation_complete: true
---


# Ring Attention

## 定义
Ring Attention 是一种分布式注意力计算方法，通过将长序列切割成多个块（chunk），并在多个 GPU 或计算节点之间以逻辑环（ring）的方式传递 Key 和 Value 块，从而将注意力计算均匀分摊到各个设备上。它能够在单个设备显存有限的情况下，支持对超长序列（如百万级 token）进行高效的训练与推理。

## 关键特征
- 环形通信拓扑：设备间形成逻辑环，每个设备只负责本地的 Query 块，并依次接收来自前一个设备的 Key/Value 块进行计算，完成后传递给下一个设备，通信开销随序列长度线性增长
- 分块注意力计算：将完整的注意力矩阵分解为块级乘法，配合高效的 Kernel 实现（如借鉴 [[concepts/flashattention|FlashAttention]] 的块策略），减少显存占用
- 线性可扩展性：计算和通信随设备数量近线性扩展，理论上可以支持任意长度的序列
- 与 FlashDecoding 协同：在推理场景中，可结合 [[concepts/flashdecoding|FlashDecoding]] 的分段解码策略，进一步提升长上下文生成效率

## 应用
- 超长上下文大语言模型的分布式训练：如训练支持 128k 甚至 1M token 窗口的模型
- 长序列分布式推理：在需要处理完整长文档、基因组序列或长对话历史的场景中，突破单 GPU/KV 缓存的限制
- 环境本身：常作为分布式推理或训练框架的 Kernel 级优化手段，与 [[concepts/contand-batching|Continuous Batching]]、[[concepts/chunked-prefill|Chunked Prefill]] 等技术互补，共同提升吞吐和最大序列长度

## 相关概念
- [[concepts/flashattention|FlashAttention]]
- [[concepts/flashdecoding|FlashDecoding]]
- [[concepts/chunked-prefill|Chunked Prefill]]
- [[concepts/contand-batching|Continuous Batching]]

## 相关实体
暂无直接相关实体（该方法更多以算法和算子形式出现，不是一个特定的系统或项目）。

## 来源提及

- "C1[Kernels FlashAttention / FlashDecoding / Ring Attention]" (C1[内核：FlashAttention / FlashDecoding / Ring Attention]) — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources:
  - "[[sources/readme_425fbb]]"
  - "[[sources/db_perspective_llm_pvldb2025_300968]]"
tags:
  - "term"
aliases:
  - "预填充/解码阶段"
  - "Prefill-Decode 拆分"
  - "Prefill/Decode Disaggregated"
generation_complete: true
---

## 相关概念
- [[concepts/Throughput-Latency Tradeoff|Throughput-Latency Tradeoff]]
- [[concepts/PagedAttention|PagedAttention]]
- [[concepts/LLM-Inference-Cost-Model|LLM-Inference-Cost-Model]]
- [[concepts/load-balancing|Load Balancing]]

## 相关实体
- [[entities/sarathi-serve|Sarathi-Serve]]
- [[entities/vllm|vLLM]]
- [[entities/serverlessllm|ServerlessLLM]]
- [[entities/mooncake|Mooncake]]

## 定义
在大语言模型（LLM）推理过程中，一次请求的处理被划分为两个性质不同的阶段：**Prefill 阶段** （预填充） 一次性编码输入的所有 tokens 并生成第一个输出 token，**Decode 阶段** （解码） 则自回归地逐个生成后续的 tokens。两个阶段对计算、内存和 I/O 资源的需求差异巨大，构成了 LLM 服务系统中吞吐与延迟之间根本权衡的基础。

## 关键特征
- **Prefill 阶段**：计算密集，可高度并行化处理输入序列，利用 GPU 大规模并行能力一次性完成编码。
- **Decode 阶段**：内存密集，自回归逐 token 生成，每一步依赖前一步的键值缓存 （KV Cache），带宽受限。
- **阶段拆分**：同一推理请求内部的两个阶段不可合并，但不同请求的 Prefill 与 Decode 可以交错调度，以优化整体资源利用率。
- **调度挑战**：若 Prefill 过度占用计算资源，会导致 Decode 延迟增加；反之若优先保障 Decode，可能降低吞吐，形成典型的吞吐-延迟权衡。

## 应用
- **推理系统调度优化**：如 [[entities/vllm|vLLM]]、[[entities/serverlessllm|ServerlessLLM]] 等系统通过分离 Prefill 与 Decode 的阶段调度策略来提升服务吞吐或降低尾部延迟。
- **内存管理设计**：Prefill 生成的 KV Cache 直接影响 Decode 阶段的访问模式，驱动了连续内存分配、分页存储等机制，例如 [[concepts/PagedAttention|PagedAttention]]。
- **性能建模与可视化**：[[entities/sarathi-serve|Sarathi-Serve]] 等系统通过显式的 Prefill/Decode 阶段拆分图来可视化时间片分配，辅助研究者理解不同策略对延迟构成的影响。

## 来源提及

- "`osdi24-agrawal.pdf` | Taming Throughput-Latency Tradeoff in LLM Inference with Sarathi-Serve | 19 | Sarathi-Serve；学习吞吐-延迟权衡、prefill/decode 阶段拆分图" (`osdi24-agrawal.pdf` | 用Sarathi-Serve驯服LLM推理中的吞吐-延迟权衡 | 19 | Sarathi-Serve；用于学习吞吐-延迟权衡和prefill/decode阶段拆分图) — [[raw/papers/README|README]]
- "Distributed（Mooncake P/D disaggregated 面向高吞吐、DeepFlow serverless 面向共享硬件弹性伸缩）。" — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
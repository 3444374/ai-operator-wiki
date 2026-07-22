---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources:
  - "[[sources/db_perspective_llm_pvldb2025_300968]]"
tags:
  - "method"
aliases:
  - "分块预填充"
  - "Chunked Prefill"
  - "Prefill Interleaving"
generation_complete: true
---

# Chunked Prefill

## 定义
Chunked Prefill 是一种针对大语言模型（LLM）推理的请求批处理优化技术，由 [[entities/sarathi-serve|Sarathi-Serve]] 提出。它将原本较长的 Prefill 计算切分成多个较小的 chunk，并与 Decode 步骤交错执行，从而在降低首次令牌延迟（TTFT）的同时，有效控制令牌间延迟（TBT）。该技术建立在 [[concepts/continuous-batching|Continuous Batching]] 之上，进一步平衡了硬件利用率与请求的响应实时性，其设计思想类似于数据库查询执行中的分阶段流水线优化。

## 关键特征
- **Prefill 分块**：将完整的 Prefill 阶段拆解为多个大小可控的计算块（chunk），避免一次性长计算阻塞后续请求。
- **交错执行**：在 chunk 之间穿插正在进行的 Decode 步骤，形成“Chunked Prefill → Decode → Chunked Prefill”的交替模式。
- **延迟控制**：同时优化两个关键延迟指标——首次令牌延迟（TTFT）和令牌间延迟（TBT），避免因大请求导致延迟尖峰。
- **提升硬件利用**：在连续批处理基础上进一步减少 GPU 空闲时间，使计算与访存更密集。
- **类比流水线**：从数据库视角看，类似于查询执行中通过分阶段流水线减少长操作对后续操作的阻塞，提升整体吞吐与响应平衡。

## 应用
- **交互式 LLM 服务**：适用于聊天、代码补全等对响应实时性要求高的场景，确保长提示词或长文本输入不会导致后续请求严重排队。
- **高并发推理系统**：在[[entities/sarathi-serve|Sarathi-Serve]]、[[entities/vllm|vLLM]] 等高性能推理框架中，利用 Chunked Prefill 改善调度器效率，提高系统级吞吐量。
- **混合负载推理**：在同时包含长 Prefill 和短 Decode 的工作负载中，避免“长请求欺负短请求”的现象，实现更公平的服务质量。

## 相关概念
- [[concepts/continuous-batching|Continuous Batching]]
- [[concepts/request-batching|Request Batching]]
- [[concepts/prefill-decode-stage|Prefill/Decode Stage]]

## 相关实体
- [[entities/sarathi-serve|Sarathi-Serve]]
- [[entities/orca|Orca]]
- [[entities/sglang|SGLang]]

## 来源提及

- "chunked prefill [1, Sarathi-Serve OSDI'24] 将长 prefill 拆分为多个 chunk 交错执行以平衡 TTFT 和 TBT" (分块预填充 [1, Sarathi-Serve OSDI'24] 将长的预填充拆分成多个块并与解码操作交错执行，以平衡首令牌延迟和令牌间延迟。) — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
- "SGLang 使用 radix tree 做前缀匹配 + cache-aware scheduler + prefill interleaving。" — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
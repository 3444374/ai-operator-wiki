---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: []
tags: [project]
aliases:
  - "Mooncake System"
  - "Mooncake 分布式推理系统"
generation_complete: true
---


# Mooncake

## 描述
Mooncake 是一个面向高吞吐场景的分布式大语言模型（LLM）推理系统，核心架构采用 [[concepts/prefill-decode-disaggregation|Prefill/Decode 分离]]，将预填充（prefill）与解码（decode）阶段解耦到不同的计算节点上，以提升资源利用率与整体吞吐。其负载均衡器基于延迟估计模型，综合评估节点上的 [[concepts/load-balancing|负载均衡]] 状态、KV‑cache 可用性、数据传输时间及 worker 实际负载，通过贪婪式最小负载路由策略将请求动态分发至最优实例。在本教程中，Mooncake 被作为分布式推理系统的典型代表之一介绍，与 [[entities/sglang|SGLang]]、[[entities/vllm|vLLM]] 等系统共同构成现代 LLM 服务化的重要范式。

## 相关实体
- [[entities/vllm|vLLM]]
- [[entities/sglang|SGLang]]

## 相关概念
- [[concepts/load-balancing|负载均衡]]
- [[concepts/prefill-decode-disaggregation|Prefill/Decode 分离]]

## 来源提及

- "Mooncake [16] 采用 Prefill/Decode 分离架构，greedy load balancer 基于延迟估计模型（考虑 cache 可用性、传输时间、worker 负载）" (Mooncake [16] 采用预填充/解码分离架构，贪婪负载均衡器基于延迟估计模型（考虑缓存可用性、传输时间、worker负载）。) — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
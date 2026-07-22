---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: []
tags: [term]
aliases:
  - "Time to First Token"
  - "首 Token 延迟"
generation_complete: true
---


# TTFT

## 定义
TTFT（Time to First Token，首 Token 延迟）是大型语言模型推理系统中的一个核心延迟指标，衡量从客户端提交推理请求到系统生成第一个输出 token 之间的时间间隔。它直接反映了 prefill 阶段的完成时间，是用户感知响应速度的关键因素。

## 关键特征
- **与 prompt 长度强相关**：TTFT 主要受 prefill 阶段的长度和计算效率影响——输入 prompt 越长，所需的 prefill 计算越多，TTFT 越高。
- **与 TBT 共同构成端到端延迟**：TTFT 负责首个 token 的等待时间，而 TBT（Time Between Tokens）衡量后续 token 的生成间隔，两者加起来决定了总响应延迟。
- **受批处理策略影响**：在 continuous batching 中，增大 batch 大小可以提高吞吐量，但可能导致新请求的 TTFT 延长，因为新请求必须等待当前 batch 中的 prefill 完成。
- **可通过 Chunked Prefill 优化**：Chunked Prefill 将长 prefill 拆分为多个较短的 chunk，与 decode step 交错执行，从而在不显著增加 TTFT 的前提下提升 GPU 利用率，并缓解首 token 延迟过高的问题。

## 应用
- **交互式应用**：如聊天机器人、语音助手等，低 TTFT 可显著改善用户体验，避免用户感到“卡顿”或“反应迟钝”。
- **实时系统**：在需要即时反馈的场景（如实时翻译、对话式 AI），TTFT 是衡量系统可用性的核心指标。
- **推理系统调度优化**：在设计请求调度、批处理策略（如 continuous batching、chunked prefill）时，TTFT 是关键的优化目标，常与吞吐量、TBT 等指标进行权衡。

## 相关概念
- [[concepts/tbt|TBT]]
- [[concepts/chunked-prefill|Chunked Prefill]]
- [[concepts/continuous-batching|Continuous Batching]]

## 相关实体
无直接相关实体。

## 来源提及

- "Continuous batching [19, Orca OSDI'22] 利用自回归生成的特性周期性重新组批，chunked prefill [1, Sarathi-Serve OSDI'24] 将长 prefill 拆分为多个 chunk 交错执行以平衡 TTFT 和 TBT。" — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
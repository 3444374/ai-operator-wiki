---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: []
tags: [term]
aliases:
  - "TBT"
  - "Time Between Tokens"
  - "Token 间延迟"
generation_complete: true
---


# TBT

## 定义
TBT（Time Between Tokens）是衡量自回归语言模型推理系统中解码阶段效率的核心指标，定义为生成两个连续输出 token 之间的时间间隔。它直接反映了生成每一步的延迟，是影响流式响应流畅度的关键性能参数。

## 关键特征
- 主要受解码阶段的 batch 大小、KV cache 访问效率及内存带宽影响：每个 decode step 都需要读取全部历史 token 的 KV cache 来计算下一个 token。
- 在 Continuous Batching 场景下，若 prefill 阶段耗时过长，会阻塞 decode step，导致 TBT 骤增；Chunked Prefill 通过将长序列的 prefill 切分为小段并交错插入 decode 步，避免长时间阻塞，从而维持稳定的低 TBT。
- TBT 越小且波动越小，流式生成体验越平滑；对实时对话、文本补全等交互式应用至关重要。
- 与 TTFT 共同构成端到端延迟的组成部分，TTFT 关注首 token 的生成延迟，而 TBT 关注后续 token 的生成节奏。

## 应用
- 实时对话系统，要求输出 token 延迟低且平稳，避免卡顿。
- 流式文本生成服务，如代码补全、写作助手等，用户体验直接取决于稳定的 TBT。
- 推理系统性能优化：通过改进 KV cache 管理、调度策略（如 chunked prefill）或加速 decode 内核来降低 TBT。

## 相关概念
- [[concepts/ttft|TTFT]]
- [[concepts/chunked-prefill|Chunked Prefill]]
- [[concepts/continuous-batching|Continuous Batching]]
- [[concepts/kv-cache|KV Cache]]

## 相关实体
（暂无直接关联实体）

## 来源提及

- "chunked prefill [1, Sarathi-Serve OSDI'24] 将长 prefill 拆分为多个 chunk 交错执行以平衡 TTFT 和 TBT。" — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
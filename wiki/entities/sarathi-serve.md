---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources:
  - "[[sources/readme_425fbb]]"
  - "[[sources/db_perspective_llm_pvldb2025_300968]]"
tags:
  - "product"
aliases:
  - "Sarathi-Serve"
  - "sarathi-serve"
generation_complete: true
---

# Sarathi-Serve

## 描述
Sarathi-Serve 是一个在 OSDI 2024 上发表的研究型推理服务框架，专注于优化大语言模型（LLM）推理中的[[concepts/throughput-latency-tradeoff|Throughput-Latency Tradeoff]]。其核心设计在于将推理过程拆分为 [[concepts/prefill-decode-stage|Prefill/Decode Stage]] 并进行精细调度，通过分阶段拆分图（Staged Splitting Graph）直观展示推理流水线的瓶颈与优化机会。在项目 README 中，Sarathi-Serve 被用作教学工具，演示如何将复杂的性能权衡以图表形式清晰表达，包括 [[concepts/prefill-decode-stage|prefill/decode 阶段拆分图]] 和吞吐–延迟曲线。该工作与 [[entities/vllm|vLLM]]、[[entities/serverlessllm|ServerlessLLM]] 等系统共同构成了现代 LLM 推理服务系统化研究的重要支点。

Sarathi-Serve 进一步引入了 chunked prefill 技术，将长 prefill 请求切分为多个小 chunk 并与 decode 步骤交错执行，从而在连续批处理中同时优化首 token 延迟（TTFT）与每 token 间隔（TBT），缓解传统方法中 prefill 与 decode 对资源的独占性竞争。
## 相关实体
- [[entities/vllm|vLLM]]
- [[entities/serverlessllm|ServerlessLLM]]
- [[entities/orca|Orca]] (新来源将 Sarathi-Serve 与 Orca 关联，作为请求批处理优化的重要发展相关系统。)
## 相关概念
- [[concepts/throughput-latency-tradeoff|Throughput-Latency Tradeoff]]
- [[concepts/prefill-decode-stage|Prefill/Decode Stage]]
- [[concepts/chunked-prefill|Chunked Prefill]]
- [[concepts/continuous-batching|Continuous Batching]]
- [[concepts/request-batching|Request Batching]]

## 来源提及

- "`osdi24-agrawal.pdf` | Taming Throughput-Latency Tradeoff in LLM Inference with Sarathi-Serve | 19 | Sarathi-Serve；学习吞吐-延迟权衡、prefill/decode 阶段拆分图" (`osdi24-agrawal.pdf` | 用Sarathi-Serve驯服LLM推理中的吞吐-延迟权衡 | 19 | Sarathi-Serve；用于学习吞吐-延迟权衡和prefill/decode阶段拆分图) — [[raw/papers/README|README]]
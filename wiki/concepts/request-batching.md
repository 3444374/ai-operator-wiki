---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/db_perspective_llm_pvldb2025_300968]]"]
tags: [method]
aliases:
  - "请求批处理"
generation_complete: true
---


# Request Batching

## 定义
Request Batching（请求批处理）是一种将多个独立的推理请求动态或静态地组合成单个批次进行统一计算的技术。其核心目标是最大化 GPU 等加速器的利用率，通过提升计算密度来摊销 Kernel Launch 与数据移动的开销。在 LLM 推理场景中，该技术被类比为数据库中的查询批处理，是模型优化与执行引擎的关键组成部分。

## 关键特征
- **提升硬件效率**：通过凑批将小规模请求合并，减少 GPU 空闲时间，显著提高吞吐量。
- **从静态到动态的演进**：早期静态 batching 要求批次内所有请求的序列长度对齐，导致“ragged tensor”问题；后来的连续批处理（Continuous Batching）允许请求在任意时刻动态加入或离开批次。
- **分块预填充**：为了进一步优化延迟与吞吐的平衡，衍生出 Chunked Prefill 策略，将长序列的预填充分解为多个小块并与解码请求混合调度。
- **与内存管理耦合**：批处理策略需要与 KV Cache 管理（如 PagedAttention 等）深度配合，以避免不合理的内存占用。
- **类比数据库查询批处理**：在系统设计中，LLM 请求的批处理与数据库的批量查询执行在调度抽象上具有相似性，用于提升整体系统效能。

## 应用
- **LLM 推理框架**：如 vLLM、Orca、Sarathi‑Serve 等系统均将 Request Batching 作为核心调度策略，通过连续批处理或混合预填充来服务高并发场景。
- **Serverless 推理**：在 ServerlessLLM 等平台中，批处理用于平衡冷启动延迟与资源利用率。
- **数据库内 AI 分析**：像 GaussML、LEADS 等系统将模型推理请求进行批量执行，以提升在数据库环境中运行 ML 模型时的 GPU 效率。

## 相关概念
- [[concepts/continuous-batching|Continuous Batching]]
- [[concepts/chunked-prefill|Chunked Prefill]]
- [[concepts/load-balancing|负载均衡]]
- [[concepts/kv-cache|KV Cache]]

## 相关实体
- [[entities/orca|Orca]]
- [[entities/sarathi-serve|Sarathi-Serve]]
- [[entities/vllm|vLLM]]
- [[entities/serverlessllm|ServerlessLLM]]
- [[entities/gaussml|GaussML]]
- [[entities/leads|LEADS]]

## 来源提及

- "Batching 策略只讲到 continuous batching + chunked prefill，未涉及按 token 量/frame 量组织 batch 的细粒度策略" (批处理策略只讲到连续批处理和分块预填充，未涉及按token量或帧量组织批次的细粒度策略。) — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
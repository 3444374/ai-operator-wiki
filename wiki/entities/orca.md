---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/db_perspective_llm_pvldb2025_300968]]"]
tags: [product]
aliases:
  - "Orca OSDI'22"
  - "Orca System"
generation_complete: true
---


# Orca

## 描述
Orca 是由 Yu 等人提出的启发式调度系统，发表于 OSDI 2022。它首次提出了 **iteration‑level scheduling** 和 [[concepts/continuous-batching|Continuous Batching]] 的概念，通过对同一迭代中可合并的请求进行动态批处理，显著提高了 GPU 利用率。Orca 被视为现代 LLM 推理系统中 [[concepts/request-batching|Request Batching]] 技术的奠基性工作，为后续如 [[entities/sarathi-serve|sarathi-serve]] 等系统的设计提供了核心启发。其迭代级调度思想也直接影响了 [[concepts/chunked-prefill|Chunked Prefill]] 等更细粒度的调度策略的发展。

## 相关实体
- [[entities/sarathi-serve|sarathi-serve]]

## 相关概念
- [[concepts/continuous-batching|Continuous Batching]]
- [[concepts/request-batching|Request Batching]]
- [[concepts/chunked-prefill|Chunked Prefill]]

## 来源提及

- "Continuous batching [19, Orca OSDI'22] 利用自回归生成的特性周期性重新组批" (连续批处理 [19, Orca OSDI'22] 利用自回归生成特性周期性地重新组合批次。) — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
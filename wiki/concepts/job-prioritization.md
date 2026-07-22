---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/db_perspective_llm_pvldb2025_300968]]"]
tags: [method]
aliases:
  - "任务优先级调度"
  - "Job Scheduling Priority"
  - "作业优先级"
generation_complete: true
---


# Job Prioritization

## 定义
Job Prioritization（任务优先级调度）是指在推理系统中决定多个待处理请求调度顺序的技术。其核心目标是在延迟和吞吐之间取得平衡，通过为不同请求赋予优先级来优化系统资源利用率。该技术可类比于传统数据库中的查询调度器（Query Scheduler），但在 LLM 推理场景下，由于请求完成时间、缓存复用潜力等因素的动态变化，传统静态优先级策略往往缺乏对实时队列状态的适应性，因此需要更具动态和上下文感知的调度方法。

## 关键特征
- **平衡延迟与吞吐**：通过优先级排序，在满足延迟敏感请求的同时最大化整体吞吐量。
- **基于完成时间或缓存复用**：常见方法利用请求的预估完成时间或其对 KV 缓存的复用潜力制定优先级。
- **静态优先级的局限**：现有方法大多依赖预定义的优先级规则，未能实时响应队列深度、模型负载或请求紧迫性的变化。
- **执行层关键环节**：位于模型推理的执行调度层，直接影响端到端推理服务的性能。
- **类数据库调度概念**：与数据库系统中的查询调度器思想相似，但需要针对 LLM 的 Prefill‑Decode 两阶段特性进行专门设计。

## 应用
- **LLM 推理服务系统**：在 [[entities/vllm|vllm]]、[[entities/sglang|sglang]] 等框架中，用于管理并发请求的调度顺序，提升 GPU 利用率和用户体验。
- **混合负载优化**：在处理在线低延迟请求与离线高吞吐批量任务混合的场景时，通过动态优先级分配避免资源饥饿。
- **延迟关键型应用**：如对话系统、实时摘要等，需要为对用户响应时间敏感的请求赋予更高优先级。

## 相关概念
- [[concepts/load-balancing|负载均衡]] — 调度请求到不同计算单元，与优先级调度共同决定请求的整体分布和资源分配。
- [[concepts/request-batching|Request Batching]] — 请求批量组合策略，优先级调度常与批处理策略耦合，以在批内和批间优化执行顺序。

## 相关实体
- [[entities/sglang|sglang]]
- [[entities/vllm|vllm]]
- [[entities/sarathi-serve|sarathi-serve]]（可能的优先级调度实现）
- [[entities/mooncake|mooncake]]（分布式推理中的调度考虑）

## 来源提及

- "Job Prioritization<br/>Cost-based / Cache-aware Scheduling" (任务优先级：基于代价的调度 / 缓存感知调度) — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/db_perspective_llm_pvldb2025_300968]]"]
tags: [method]
aliases:
  - "贪心最小负载均衡"
  - "Greedy Least Load"
  - "Least-Load First"
generation_complete: true
---


# Greedy Least-Load

## 定义
Greedy Least-Load（贪心最小负载）是分布式 LLM 推理系统中最通用的负载均衡策略，核心思想是将每个新到达的推理请求路由到当前负载最低的计算节点。该策略实现简单，无需维护请求状态或建立复杂的预测模型。

## 关键特征
- **实现极简**：仅依赖节点当前负载指标（如并发请求数、GPU 利用率），不保留请求历史状态
- **贪心决策**：永远选择“此刻负载最低”的节点，不考虑未来负载变化或请求的长期影响
- **双重不确定性挑战**：
  - 请求生命周期不确定 —— 新请求的 token 生成长度不可预知，导致短请求可能被阻塞在长请求之后
  - 未来负载不确定 —— 当前负载最低的节点可能在下一时刻成为瓶颈，贪心选择未必是全局最优
- **缺乏代价估计**：该策略无法感知缓存状态、传输延迟、Worker 负载差异等更细粒度的开销，因而在异构环境或需要前缀共享的场景下表现欠佳

## 应用
- 作为分布式推理框架（如 [[entities/vllm|vLLM]]、[[entities/sglang|sglang]]）的基础负载均衡策略
- 在对延迟要求不严苛、请求长度分布较均匀的批推理系统中提供高效的分发机制
- 作为后续精细化调度策略（如延迟估计模型）的比较基准

## 相关概念
- [[concepts/load-balancing|Load Balancing]]
- [[concepts/cache-aware-scheduling|Cache-aware Scheduling]]

## 相关实体
- [[entities/mooncake|Mooncake]]

## 来源提及

- "分布式推理系统中的负载均衡面临请求生命周期不确定 + 未来负载不确定的双重挑战，大多数系统采用 greedy least-load 启发式。" — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
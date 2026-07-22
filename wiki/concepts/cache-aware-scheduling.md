---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: []
tags: [method]
aliases:
  - "缓存感知调度"
  - "Cache-aware scheduling"
generation_complete: true
---


# Cache-aware Scheduling

## 定义
Cache-aware Scheduling 是一种面向大语言模型（LLM）推理的请求调度策略，其核心思想是**利用 KV cache 的数据局部性**，将新到达的请求优先调度到已经缓存了其所需 prefix 的计算节点或 batch 上。通过匹配前缀来命中已缓存的 key/value 张量，可以避免重复执行 prefill 阶段，从而显著降低首 token 延迟（TTFT）和整体计算开销。

## 关键特征
- **前缀感知的路由**：依据请求 prompt 与节点已缓存 prefix 的重合度来决定调度目标，而非仅基于传统负载（如队列长度或 GPU 利用率）。
- **与负载均衡和优先级调度的协同**：通常作为 Job Prioritization 和 Load Balancing 两个子层的依据，在保证缓存命中的同时兼顾系统的整体吞吐与公平性。
- **基于 Radix Tree 的精确命中判断**：常用 Radix Tree 数据结构来高效组织和管理 KV cache 块，实现 O(前缀长度) 级别的前缀匹配，避免全量遍历。
- **降低首 token 延迟与计算冗余**：命中缓存后请求可直接进入 decode 阶段，消除 prefill 带来的计算和 I/O 开销，使 TTFT 大幅缩短。

## 应用
- **SGLang 的 Cache-Aware Scheduler**：使用 Radix Tree 全局管理多轮对话的共享前缀，新请求到达时先查询树以找到最长的可复用前缀，再将请求调度到持有该前缀的 GPU batch，从而实现“一次 prefill，多次复用”。
- **Mooncake 的负载均衡器**：在分布式推理集群中，将每个节点上可用的 KV cache 前缀信息作为延迟估计模型的关键输入，把 cache 可用性与请求大小、节点负载等因素共同纳入调度决策，进一步提升首 token 延迟的稳定性。

## 相关概念
- [[concepts/job-prioritization|Job Prioritization]]
- [[concepts/load-balancing|Load Balancing]]
- [[concepts/prefix-sharing|Prefix Sharing]]
- [[concepts/radix-tree|Radix Tree]]

## 相关实体
- [[entities/sglang|sglang]]
- [[entities/mooncake|mooncake]]

## 来源提及

- "Job Prioritization 中请求调度顺序影响延迟和吞吐——当前方法基于 completion time 估计 [11] 或 cache 复用潜力 [20] 做优先级决策。" — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
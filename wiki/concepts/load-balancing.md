---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: []
tags: [method]
aliases:
  - "负载均衡"
  - "LB"
generation_complete: true
---


# Load Balancing

## 定义
Load Balancing（负载均衡）是分布式推理系统中将推理请求动态分配到不同计算节点的调度策略，目标是在系统层面最大化吞吐量、最小化请求延迟。由于大型语言模型（LLM）推理任务的生命周期和资源消耗具有高度不确定性（如不同提示长度、响应长度、batch 大小等），传统的轮询或最少连接等方案往往无法适应，当前实践多采用启发式方法，例如贪婪最小负载（greedy least-load）和缓存感知路由（cache-aware routing），但普遍缺乏精确的代价模型，是开放的优化方向。

## 关键特征
- **动态调度**：实时监控各节点的负载（如队列长度、GPU 利用率、KV 缓存压力），动态调整请求分配，而非使用静态规则
- **缓存感知**：考虑每个服务实例的 KV 缓存状态，优先将具有相似前缀的请求路由到已缓存对应 Key/Value 的节点，以减少重复计算和显存占用
- **启发式驱动**：当前主流方案多基于启发式策略（如最小负载 first-fit、前缀命中率估计），缺乏基于精确代价模型的全局最优解
- **多目标优化**：在吞吐量、延迟、尾延迟、能耗等多维度之间寻求平衡，代价模型通常难以对准所有目标
- **不确定性适应**：能够应对请求到达时间、内容长度、资源消耗的巨大波动，避免负载倾斜和资源碎片化

## 应用
- **LLM 推理框架**：在 [[entities/vllm|vLLM]]、[[entities/sglang|sglang]] 等系统中，负载均衡模块负责将传入的推理请求分配到多个 GPU 节点或 worker 上，以提升整体服务吞吐并控制延迟
- **缓存感知路由**：[[entities/mooncake|Mooncake]] 分布式推理系统通过缓存感知路由实现跨节点的负载分配，有效减少重复的 prefill 计算，提升端到端性能
- **Serverless 推理**：[[entities/deepflow|DeepFlow]] 等 Serverless 推理平台在调度函数实例时使用负载均衡策略，在资源弹性伸缩的背景下保持请求的均匀分布
- **批处理调度结合**：与 [[concepts/request-batching|Request Batching]] 协同工作，根据批处理窗口内的请求组合和当前节点能力进行智能路由

## 相关概念
- [[concepts/request-batching|Request Batching]] — 将多个推理请求合并为一次性执行的批次，与负载均衡共同决定请求如何被分配到节点和批次中
- [[concepts/job-prioritization|Job Prioritization]] — 当多个请求竞争资源时，优先级调度策略影响负载均衡的路由决策，例如高优先级请求优先分配到空闲度高的节点

## 相关实体
- [[entities/mooncake|Mooncake]] — 采用缓存感知路由实现跨节点负载均衡的分布式推理系统
- [[entities/deepflow|DeepFlow]] — Serverless 推理平台，内建动态负载分配机制以应对弹性计算环境
- [[entities/vllm|vLLM]] — 高性能 LLM 推理引擎，利用动态负载均衡将请求分派到多个加速器

## 来源提及

- "分布式推理系统中的负载均衡面临请求生命周期不确定 + 未来负载不确定的双重挑战，大多数系统采用 greedy least-load 启发式。" (分布式推理系统中的负载均衡面临请求生命周期不确定和未来负载不确定的双重挑战，大多数系统采用贪婪最小负载启发式。) — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
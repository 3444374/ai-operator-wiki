---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/db_perspective_llm_pvldb2025_300968]]"]
tags: [project]
aliases:
  - "DeepFlow"
  - "DeepFlow 系统"
  - "DeepFlow Serverless 推理系统"
generation_complete: true
---


# DeepFlow

## 描述
DeepFlow 是一种面向共享云端硬件弹性伸缩的 serverless LLM 推理系统。它通过按需分配 GPU 资源实现细粒度的弹性扩展，特别面向 serverless 场景下的高效资源调度。与 [[entities/mooncake|Mooncake]] 采用的预填充‑解码分离（P/D 分离）架构不同，DeepFlow 侧重 serverless 环境中的动态适配与快速扩缩。在该文讨论中，DeepFlow 被作为分布式推理系统的另一代表方案，展示了不同路径下解决大规模模型服务成本与延迟矛盾的尝试。其核心思想结合了细粒度资源管理、[[concepts/load-balancing|Load Balancing]] 以及 [[concepts/serverless-inference|Serverless Inference]] 等技术。

## 相关实体
- [[entities/mooncake|Mooncake]]：采用 P/D 分离架构的分布式推理系统，与 DeepFlow 的 serverless 弹性路线形成对比。

## 相关概念
- [[concepts/load-balancing|Load Balancing]]：DeepFlow 在弹性伸缩过程中需要动态分配请求到可用 GPU，涉及负载均衡策略。
- [[concepts/serverless-inference|Serverless Inference]]：DeepFlow 的核心理念，即通过按需分配资源实现推理服务的无服务器化。

## 来源提及

- "Distributed Systems：DeepFlow serverless 面向共享硬件弹性伸缩" (分布式系统：DeepFlow serverless面向共享硬件弹性伸缩。) — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
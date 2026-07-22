---
type: source
created: 2026-07-22
updated: 2026-07-22
tags:
  - "deep-reading"
  - "paper/db-perspective-llm"
  - "tutorial"
  - "llm-inference"
  - "pvldb2025"
aliases:
  - "DB视角LLM推理系统 (PVLDB 2025)"
  - "数据库视角LLM推理系统教程"
  - "DB Perspective LLM Inference (PVLDB 2025)"
generation_complete: true
---


# Database Perspective on LLM Inference Systems (PVLDB 2025) - Summary

## 来源
- Original file: [[raw/papers/db_perspective_llm_pvldb2025.md]]
- Ingested: 2026-07-22

## 核心内容
本教程论文以数据库系统的四大核心组件（请求处理、优化执行、内存管理）为透镜，系统化审视 [[concepts/llm-inference-systems|LLM 推理系统]] 的技术栈。作者 [[entities/james-pan|James Pan]] 和 [[entities/guoliang-li|Guoliang Li]] 将推理过程类比为查询处理流水线，将 [[concepts/request-batching|请求批处理]]、[[concepts/job-prioritization|任务优先级调度]] 和 [[concepts/load-balancing|负载均衡]] 分别对应 DBMS 的查询解析、优化器和调度器，并把 [[concepts/kv-cache|KV Cache]] 的内存管理（如 [[concepts/eviction-&-offloading|驱逐与卸载]]、[[concepts/prefix-sharing|前缀共享]]）类比于数据库的缓冲池管理。文章重点指出当前批处理与调度仍以启发式方法为主，缺乏类似数据库代价估计的精确模型，并总结了集中式低延迟系统（[[entities/vllm|vLLM]]、[[entities/sglang|SGLang]]）与分布式高吞吐架构（[[entities/mooncake|Mooncake]]、[[entities/deepflow|DeepFlow]]）两大流派。这一框架为本课题的研究定位与动机提供了清晰的支撑。

## 关键实体
- [[entities/james-pan|James Pan]] — 论文第一作者，清华大学研究员
- [[entities/guoliang-li|Guoliang Li]] — 共同作者，清华大学数据库系统教授
- [[entities/清华大学|清华大学]] — 作者所属机构
- [[entities/pvldb-2025|PVLDB 2025]] — 论文发表会议/期刊
- [[entities/vllm|vLLM]] — 集中式推理系统代表，提出 [[concepts/kv-cache|PagedAttention]]
- [[entities/sglang|SGLang]] — 集中式推理系统，采用 [[concepts/radix-tree|radix tree]] 前缀匹配与 [[concepts/prefill-interleaving|prefill interleaving]]
- [[entities/mooncake|Mooncake]] — 分布式 P/D 分离架构系统，应用 [[concepts/greedy-least-load|贪心最小负载]] 路由
- [[entities/deepflow|DeepFlow]] — 面向 serverless 弹性伸缩的分布式推理系统
- [[entities/orca|Orca]] — 首次提出 [[concepts/request-batching|continuous batching]] 的系统
- [[entities/sarathi-serve|Sarathi-Serve]] — 提出 [[concepts/chunked-prefill|chunked prefill]] 以平衡 [[concepts/ttft|TTFT]] 与 [[concepts/tbt|TBT]]

## 关键概念
- [[concepts/database-perspective-on-llm-inference|数据库视角下的LLM推理]] — 论文提出的核心分析方法
- [[concepts/四层推理技术栈|四层推理技术栈]] — 请求处理 → 模型优化与执行 → 内存管理 → 推理系统架构
- [[concepts/request-batching|请求批处理]]、[[concepts/chunked-prefill|分块预填充]] — 当前最先进的批处理技术
- [[concepts/load-balancing|负载均衡]]、[[concepts/job-prioritization|任务优先级调度]] — 调度与路由的关键挑战
- [[concepts/kv-cache|KV Cache]]、[[concepts/eviction-&-offloading|KV Cache 驱逐与卸载]]、[[concepts/cache-persistence|缓存持久化]] — 内存管理的核心技术
- [[concepts/flashattention|FlashAttention]]、[[concepts/flashdecoding|FlashDecoding]]、[[concepts/ring-attention|Ring Attention]] — 算子级优化方法

## 要点
- 系统化地将数据库概念映射到推理系统，降低了数据库研究者的理解门槛
- 当前系统在批处理 (batching) 和调度 (scheduling) 上主要依赖启发式规则，缺乏精确的代价模型，为开放研究问题
- [[concepts/vllm|PagedAttention]] 的分页内存管理类比操作系统虚拟内存，有效解决了 KV cache 动态分配与碎片问题
- 分布式推理系统分化为中心化低延迟与分离式高吞吐两大路线，其负载均衡和缓存感知调度仍有优化空间
- 本文作为教程综述，不包含独立实验，但提供了清晰的设计空间视图和未来研究方向指引
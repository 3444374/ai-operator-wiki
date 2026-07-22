---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources:
  - "[[sources/db_perspective_llm_pvldb2025_300968]]"
tags:
  - "term"
aliases:
  - "数据库视角下的LLM推理"
  - "Database Perspective on LLM Inference"
  - "LLM Inference Systems"
generation_complete: true
---

## 相关概念
- [[concepts/four-layer-inference-stack|四层推理技术栈]]
- [[concepts/llm-inference-systems|LLM Inference Systems]]
- [[concepts/request-batching|请求批处理]]
- [[concepts/kv-cache|键值缓存]]
- [[concepts/load-balancing|负载均衡]]
- [[concepts/quantization|量化]]

## 相关实体
- [[entities/james-pan|James Pan]]
- [[entities/guoliang-li|Guoliang Li]]
- [[entities/pvldb-2025|PVLDB 2025]]
- [[entities/vllm|vLLM]]
- [[entities/sglang|SG-Lang]]
- [[entities/mooncake|Mooncake]]

## 定义
一种将LLM推理系统与数据库管理系统（DBMS）进行类比的分析框架，由[[entities/james-pan|James Pan]]和[[entities/guoliang-li|Guoliang Li]]在[[entities/pvldb-2025|PVLDB 2025]] Tutorial 中提出。其核心思想是把推理系统中的关键组件一一映射到数据库领域的成熟概念：请求处理对应查询解析、算子与执行对应查询优化、内存管理对应缓冲池、系统架构对应分布式 DBMS。这一视角有助于数据库研究者快速建立对推理系统设计空间的结构化理解，并揭示当前推理系统在代价估计和自适应调度方面的缺失。

## 关键特征
- **请求-查询映射**：将用户请求的生命周期视为类似 SQL 查询的解析‑优化‑执行流程，突出请求路由与预处理的重要性。
- **算子-优化类比**：注意力计算、MLP 等内核算子对应关系代数算子，调度策略（如 continuous batching）类比查询计划的生成与执行优化。
- **内存-缓冲池对照**：KV Cache 管理类比 DBMS 的缓冲池，强调缓存驱逐、重用与预取策略，直接影响端到端吞吐与延迟。
- **分布式架构归一化**：多节点推理系统可类比分布式 DBMS，涉及数据/模型并行、一致性协议和负载均衡。
- **揭示系统性短板**：通过类比发现 LLM 推理系统中普遍缺少准确的代价模型和自适应调度器，这是数据库领域多年积累的优势。

## 应用
- **跨领域知识迁移**：帮助数据库研究者将查询优化、索引、缓冲池管理、分布式事务等成熟技术引入 LLM 推理系统设计。
- **系统分析框架**：为评估现有推理系统（如[[entities/vllm|vLLM]]、[[entities/sglang|SG-Lang]]）的架构缺陷提供一套结构化分析工具。
- **教学与综述**：作为 PVLDB 2025 Tutorial 的主线，引导数据库社区快速进入 LLM 推理方向，促进跨领域协作。

## 来源提及

- "本文以数据库系统的视角（请求处理、优化执行、内存管理）系统化梳理 LLM 推理技术栈" (本文以数据库系统的视角（请求处理、优化执行、内存管理）系统化梳理LLM推理技术栈。) — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
- "LLM 推理的计算和内存需求巨大，请求生命周期不确定，硬件利用复杂" (LLM推理的计算和内存需求巨大，请求生命周期不确定，硬件利用复杂。) — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
---
type: source
created: 2026-07-22
updated: 2026-07-22
source_file: "raw/papers/README.md"
tags: [note]
aliases: ["本地参考PDF子集", "Local Reference PDFs"]
contentHash: 980-10d77521
generation_complete: true
---

# Local Reference PDF Subset - Summary

## 来源
- Original file: `raw/papers/README.md`
- Ingested: 2026-07-22

## 核心内容
本 README 文件记录了用户在本地维护的一组文献 PDF 子集，共 14 篇，并非完整文献库——完整候选列表以 `opening/literature/ai_operator_literature_inventory.md` 为准。该子集的核心目标是支撑**精读、机制图/架构图学习与引用核验**，涵盖了 AI‑Native 数据库（[[entities/andb|AnDB]]、[[entities/neurdb|NeurDB]]）、大模型推理服务（[[entities/vllm|vLLM]]、[[entities/sarathi-serve|Sarathi‑Serve]]、[[entities/serverlessllm|ServerlessLLM]]）、数据库内推理（[[entities/leads|LEADS]]、[[entities/ray-data|Ray Data]]）以及数据管理领域的 LLM 应用（[[entities/d-bot|D‑Bot]]）等方向。每篇论文均标明了页数与学习用途，尤其强调从示意图中提取 **running example、系统边界、时序链条、规则表与吞吐‑延迟曲线**等关键设计元素，为后续系统架构范式积累与引用准确性提供直接输入。

## 关键实体
- [[entities/andb|AnDB]] — AI‑Native Database 演示系统
- [[entities/vllm|vLLM]] — 基于 PagedAttention 的高效 LLM 推理系统
- [[entities/galois|Galois]] — LLM 上 SQL 查询的逻辑与物理优化
- [[entities/sarathi-serve|Sarathi‑Serve]] — 控制 LLM 推理吞吐‑延迟权衡的调度系统
- [[entities/serverlessllm|ServerlessLLM]] — 面向大模型的无服务器推理
- [[entities/d-bot|D‑Bot]] — 利用 LLM 进行数据库诊断
- [[entities/neurdb|NeurDB]] — AI 驱动的自治数据库
- [[entities/leads|LEADS]] — 数据库内动态模型切片分析系统
- [[entities/ray-data|Ray Data]] — 高效异构执行的流式批处理引擎

## 关键概念
- [[concepts/pagedattention|PagedAttention]] — vLLM 提出的内存页面化管理方法
- [[concepts/streaming-batch-model|Streaming Batch Model]] — Ray Data 的流式批处理执行模型
- [[concepts/prefilldecode-stage|Prefill/Decode Stage]] — LLM 推理的两阶段分解
- [[concepts/throughput-latency-tradeoff|Throughput‑Latency Tradeoff]] — 推理服务的核心性能权衡现象
- [[concepts/in-database-inference|In‑Database Inference]] — 将模型推理内嵌于数据库引擎的方法
- [[concepts/dynamic-model-slicing|Dynamic Model Slicing]] — 运行时动态选取模型子图的技术
- [[concepts/heterogeneous-execution|Heterogeneous Execution]] — 跨异构资源的协同计算
- [[concepts/adaptive-structural-encodings|Adaptive Structural Encodings]] — Lance 列式存储的自适应编码
- [[concepts/ai-native-database|AI‑Native Database]] — 原生集成 AI 能力的新一代数据库范式
- [[concepts/in-database-machine-learning|In‑Database Machine Learning]] — 库内 ML 端到端训练与推理
- [[concepts/llm-for-data-management|LLM for Data Management]] — LLM 在数据管理中的系统性研究
- [[concepts/llm-inference-stack|LLM Inference Stack]] — 大模型推理服务的完整软件栈
- [[concepts/resource-lane|Resource Lane]] — 分布式系统中任务隔离的资源通道

## 要点
- 该 PDF 子集是**精读与图形范式提取**的素材库，而非完整文献目录；完整的文献清单以 `ai_operator_literature_inventory.md` 为准。
- 重点学习每篇论文的**系统架构图、机制图、时间线与性能曲线**，从而支撑设计方法论的图形化积累。
- 文档明确列出了看图时优先提取的六类要素：running example、系统边界、data/control path、timeline、规则表以及实验曲线表达，为后续设计提供了统一的观察视角。
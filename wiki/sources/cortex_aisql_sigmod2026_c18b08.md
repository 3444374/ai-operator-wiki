---
type: source
created: 2026-07-22
updated: 2026-07-22
tags:
  - "SIGMOD2026"
  - "工业轨"
  - "AI算子"
  - "查询优化"
  - "模型级联"
  - "语义连接"
  - "非结构化数据"
  - "生产系统"
  - "DB4AI"
  - "精读笔记"
aliases:
  - "Cortex AISQL 精读笔记"
  - "Cortex AISQL (SIGMOD 2026) 笔记"
  - "Cortex AISQL (SIGMOD 2026)"
generation_complete: true
---


# 精读笔记：Cortex AISQL (SIGMOD 2026) - Summary

## 来源
- Original file: [[raw/papers/cortex_aisql_sigmod2026.md]]
- Ingested: 2026-07-22

## 核心内容
本笔记是对 [[entities/snowflake|Snowflake]] 在 SIGMOD 2026 工业轨发表的 Cortex AISQL 论文的深度阅读。论文阐明了将六类 AI 算子（EMBED、COMPLETE、FILTER、CLASSIFY、JOIN、AGG）作为 SQL 执行引擎一等公民的生产系统设计，并提出了三项核心技术：AI 感知查询优化（2–8 倍加速）、自适应模型级联（小模型过滤大部分数据、大模型处理高难度样本，5.85 倍加速）以及语义 Join 重写（将 O(N×M) 交叉连接转换为线性分类，平均 30.7 倍加速）。笔记同时指出，系统的关键假设——线性推理成本与 [[concepts/internal-model-serving|内部模型服务]]——与外部执行链路（如通过 Ray/vLLM 调用）的[[concepts/continuous-batching|动态批处理]]特性存在根本差异。这使得 Cortex AISQL 成为 DB4AI 路线产业代表的同时，也从反面验证了“数据出库再写回”的外部执行路线的现实必要性。

## 关键实体
- [[entities/snowflake|Snowflake]]：该论文的研究主体，在生产环境中深度集成 AI 算子的云数据仓库公司。
- [[entities/smart|Smart]]：VLDB 2025 的推理重写系统，学术优化更精细，但缺乏生产数据，与 Cortex 形成对照。

## 关键概念
- [[concepts/continuous-batching|Continuous batching]]：现代推理框架的批处理技术，具有边际成本递减的特点，是外部执行链路的核心优势，但 Cortex AISQL 未予采用。
- [[concepts/internal-model-serving|Internal model serving]]：Snowflake 内部 GPU 服务架构，保证低延迟线性成本，但限制了系统的跨平台适用性和批处理优化空间。

## 要点
- Cortex AISQL 系统将 EMBED、COMPLETE、FILTER、CLASSIFY、JOIN、AGG 六类 AI 算子原生集成到 SQL 引擎，支持对非结构化数据的语义操作。
- 核心优化包括：AI 感知查询优化（算子重排与消除）、自适应模型级联（双阈值路由，98% 请求由小模型处理）以及语义 Join 重写（将交叉连接转换为过滤‑分类模式，消除数据膨胀）。
- 系统严格假设所有 AI 推理调用均在内部集群完成，且成本为 `C_op(n) = n × c_model + α` 的线性模型，未考虑 [[concepts/continuous-batching|Continuous batching]] 带来的边际成本递减效应。
- 生产监控数据证实 AI 算子已成为查询成本主导因素，约 40% 的多表查询涉及 AI 操作，为 AI SQL 算子的工业真实需求提供了强证据。
- 该论文对采用“数据出库再写回”的外部执行路线提供了产业动机引用，但需注意其闭源实验无法复现、基线较为简单，且工业轨同行评审力度相对较弱。
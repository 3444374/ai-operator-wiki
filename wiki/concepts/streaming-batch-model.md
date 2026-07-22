---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/readme_425fbb]]"]
tags: [method]
aliases:
  - "流式批处理模型"
  - "Streaming Batch Model"
  - "SBM"
generation_complete: true
---


# Streaming Batch Model

## 定义
Streaming Batch Model（流式批处理模型）是一种面向分布式数据处理系统的执行模型，旨在以统一、高效且容错的方式支持流式与批量处理的异构执行。它通过流水线图（pipeline graph）、资源通道（resource lane）和时间线图（timeline graph）等形式化表达系统的任务调度与资源分配，从而实现流式和批处理工作负载的语义统一。

## 关键特征
- **流批一体语义**：将流处理和批处理抽象为统一的执行原语，消除传统架构中流、批两套执行引擎的割裂
- **异构执行支持**：原生支持 CPU、GPU 等不同加速器的异构任务调度与数据流转
- **容错设计**：通过资源通道与确定性回放（deterministic replay）等机制保障任务级容错能力
- **形式化表达**：采用 pipeline 图、资源通道和时间线图对系统执行过程进行精确建模，便于性能分析和调优
- **弹性批处理**：能够动态适应数据的到达模式，在微批和连续流之间灵活切换

## 应用
- **分布式 AI 数据处理**：在 [[entities/ray-data|Ray Data]] 等系统中，Streaming Batch Model 用于表达和优化大规模 AI 数据管线的执行流程，确保数据预处理的高吞吐与低延迟
- **机器学习训练管线**：统一数据加载、预处理、增强等阶段的执行语义，减少数据等待与资源闲置
- **混合工作负载平台**：在需要同时支持实时分析和批量 ETL 的数据平台上，作为底层执行模型统一调度计算资源
- **系统性能分析**：借助时间线图和资源通道分析瓶颈、优化并行度，提升分布式系统的整体利用率

## 相关概念
- [[concepts/heterogeneous-execution|Heterogeneous Execution]]：异构执行是该模型的核心场景，通过统一抽象管理 CPU/GPU 等不同资源
- [[concepts/数据预取|数据预取]]：在流式批处理中，数据预取策略直接影响管道效率
- [[concepts/批量构造策略|批量构造策略]]：批处理的构造方式与 Streaming Batch Model 的执行效率密切相关
- [[concepts/查询计划|查询计划]]：流式批处理模型的执行可视为一种持续执行的查询计划

## 相关实体
- [[entities/ray-data|Ray Data]]：该模型在 Ray Data 中被用于实现高效的异构数据管道执行
- [[entities/ray|Ray]]：作为底层分布式框架，Ray 为 Streaming Batch Model 提供了任务调度与资源管理基础

## 来源提及

- "`2501.12407v5.pdf` | The Streaming Batch Model for Efficient and Fault-Tolerant Heterogeneous Execution | 19 | Ray Data / heterogeneous execution；学习 pipeline、resource lane、timeline 图" (`2501.12407v5.pdf` | 高效容错异构执行的流式批处理模型 | 19 | Ray Data / 异构执行；用于学习pipeline、资源通道和时间线图) — [[raw/papers/README|README]]
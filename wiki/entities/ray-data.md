---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: []
tags: [product]
aliases:
  - "Ray Data 数据处理库"
generation_complete: true
---


# Ray Data

## 描述

Ray Data 是 [[entities/ray|Ray]] 分布式计算框架中的核心数据处理库，专为 AI 工作负载设计，提供高性能的数据加载、转换与流式处理能力。它引入了 **异构执行（Heterogeneous Execution）** 模式，允许在同一数据处理流水线中混合使用 CPU 与 GPU 等不同计算设备，从而高效衔接模型训练、推理与预处理阶段。Ray Data 通过 **资源通道（Resource Lane）** 机制隔离不同类型计算任务，避免资源争用，保证流水线的稳定吞吐。该库的设计范式展现了现代 AI 基础设施如何将数据预处理与异构计算深度整合，其流水线设计、资源通道划分以及性能可视化（如时间线图）的方法对理解数据库场景中的外部数据管线具有重要参考价值。

## 相关实体

- [[entities/ray|Ray]]

## 相关概念

- [[concepts/resource-lane|Resource Lane]]
- [[concepts/heterogeneous-execution|Heterogeneous Execution]]

## 来源提及

- "`2501.12407v5.pdf`: The Streaming Batch Model for Efficient and Fault-Tolerant Heterogeneous Execution" — [[raw/papers/README|README]]
- "Ray Data / heterogeneous execution；学习 pipeline、resource lane、timeline 图" — [[raw/papers/README|README]]
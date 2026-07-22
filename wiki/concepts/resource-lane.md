---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/readme_425fbb]]"]
tags: [term]
aliases:
  - "资源通道"
  - "Resource Lane"
generation_complete: true
---


# Resource Lane

## 定义
Resource Lane（资源通道）是在分布式数据处理系统中为不同类型计算任务划分的独立资源通道，每条通道拥有专属的 CPU、GPU 或内存配额，以保证执行的可预测性和故障隔离。通过将异构计算任务部署在各自的资源通道内，系统能够避免资源争抢，并维持流水线（pipeline）的高效运行。

## 关键特征
- **资源隔离**：每条 Resource Lane 绑定专属的计算、存储或加速资源，任务之间互不干扰。
- **可预测性**：固定配额使任务的执行时间和资源消耗高度可预测，便于容量规划与 SLA 保障。
- **防止争抢**：GPU 推理任务与 CPU 预处理任务分别使用不同通道，消除相互等待与降级。
- **流水线友好**：为流水线中不同阶段分配独立通道，保障上下游之间数据流动不受单点资源瓶颈影响。
- **结构化的系统设计视角**：常与流水线图（pipeline diagram）和时间线图（timeline chart）并列，作为分析分布式系统执行的关键观察点。

## 应用
- **Ray Data 分布式数据处理**：在 [[entities/ray-data|Ray Data]] 中，Resource Lane 用于隔离异构执行（Heterogeneous Execution）任务，例如将数据预处理、模型推理、结果聚合分配到不同资源通道，避免抢占并提高吞吐。
- **数据库内 AI（DB4AI）融合系统**：[[entities/neurdb|NeurDB]] 或 [[entities/andb|AnDB]] 等系统中，可为 SQL 查询处理和模型推理分别创建独立资源通道，防止分析型查询与 ML 推理争抢 CPU/GPU，保障混合负载下的服务质量。
- **系统观测与调优**：通过可视化各通道的资源利用率、排队时长等指标，开发者可以快速定位瓶颈并进行动态扩缩容或通道重新分配。

## 相关概念
- [[concepts/heterogeneous-execution|异构执行]]：Resource Lane 是支持异构执行的一种资源抽象，使得不同类型的计算（CPU/GPU、批/流）能够安全地共存于同一流水线中。
- [[concepts/streaming-batch-model|流式批处理模型]]：Resource Lane 常配合流式批处理模型使用，为流水线的不同阶段（如批读取、流式解码）提供资源隔离，防止执行干扰。

## 相关实体
- [[entities/ray-data|Ray Data]]
- [[entities/neurdb|NeurDB]]
- [[entities/andb|AnDB]]

## 来源提及

- "学习 pipeline、resource lane、timeline 图" — [[raw/papers/README|README]]
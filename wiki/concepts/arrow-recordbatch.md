---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/gaussml_icde2024_577060]]"]
tags: [term]
aliases:
  - "RecordBatch"
  - "Arrow 列式数据"
generation_complete: true
---


# Arrow RecordBatch

## 定义
Arrow RecordBatch 是 Apache Arrow 项目定义的一种列式内存数据格式，由一组具有相同长度且满足特定模式（Schema）的数组组成。RecordBatch 能够在系统间实现零拷贝数据传输，无需序列化/反序列化开销，在数据科学计算和大规模数据管道中被广泛采用。在本课题架构中，从数据库导出到外部执行引擎的数据以 Arrow RecordBatch 格式承载，而 [[entities/gaussml|GaussML]] 则直接使用数据库内部格式，避免了格式转换。

## 关键特征
- **列式内存布局**：数据按列连续存储，提升缓存局部性和向量化计算效率，与 [[concepts/simd-加速|simd-加速]] 等技术天然契合
- **零拷贝共享**：通过标准化的内存表示，不同的语言运行时和进程可以在不复制数据的前提下访问同一块内存，显著降低传输开销
- **强模式结构**：每个 RecordBatch 携带明确的 schema 信息（列名、数据类型），保证数据自描述性和跨系统互操作性
- **连续批次抽象**：可作为 Apache Arrow 流式接口中的基本数据块，构成 Arrow 表（Table）或 Arrow 数据集（Dataset）的底层单元

## 应用
- **外部执行链路中的数据交换格式**：数据库触发 ML 任务后，通过 Arrow RecordBatch 将数据发送给 [[entities/ray|Ray]] 等执行引擎，实现高效的数据预取和零拷贝传递（见 [[concepts/数据预取|数据预取]]）。
- **GPU 模型服务对接**：RecordBatch 可直接映射到 GPU 上的张量框架（如 CuDF、PyTorch），避免在数据预处理阶段引入额外的拷贝或转换，保证端到端推理性能。
- **跨语言数据分析管道**：在 Python、Rust、Java 等混合语言栈中，RecordBatch 作为统一的内存中间表示，简化了不同组件之间的集成。

## 相关概念
- [[concepts/外部执行链路|外部执行链路]]
- [[concepts/数据预取|数据预取]]
- [[concepts/simd-加速|simd-加速]]
- [[concepts/批量构造策略|批量构造策略]]

## 相关实体
- [[entities/ray|Ray]]
- [[entities/gaussml|GaussML]]

## 来源提及

- "数据格式：Arrow RecordBatch" (数据格式：Arrow RecordBatch（列式数据格式）) — [[raw/papers/gaussml_icde2024|gaussml_icde2024]]
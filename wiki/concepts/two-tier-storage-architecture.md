---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/diskann_neurips2019_009b0e]]"]
tags: [term]
aliases:
  - "RAM + SSD 两层存储"
  - "SSD-aware storage hierarchy"
  - "Two-tier storage"
generation_complete: true
---


# Two-tier storage architecture

## 定义
Two-tier storage architecture 是指一种将向量搜索所需数据按照访问延迟和精度要求解耦为两层的存储分层设计。该架构由 [[entities/diskann|DiskANN]] 在 2019 年提出，将 Vamana 图的邻接表与 PQ 压缩向量放入内存（RAM），而将全精度原始向量保留在 SSD 上。这种设计使得图遍历阶段的导航过程完全不必访问慢速存储，仅在最终重排序时才按需读取全精度向量，从而将 SSD 的访问次数从全量扫描降为与 beam width 呈线性关系，突破内存容量瓶颈，实现十亿级近似最近邻检索。

## 关键特征
- **两层存储解耦**：内存层存放低延迟、低精度的导航数据（图邻接表 + PQ 码本），SSD 层存放高精度、高容量的全精度原始向量
- **计算与 I/O 分离**：beam search 的所有距离近似计算均基于 RAM 中的 PQ 压缩向量完成，全程不触发 SSD 读操作
- **按需重排序**：仅在搜索的最后一步，才从 SSD 读取候选列表对应的全精度向量，以进行精确距离计算和重排序
- **线性 SSD 访问**：SSD 的实际读取次数仅取决于 beam width L 与候选大小的乘积，而非数据集总规模 N，有效避免了全量扫描
- **内存效率**：将原本需要全部放入内存的 d 维原始向量（d × N × 4 bytes）迁移至 SSD，使单机可处理的数据规模增大数十倍

## 应用
- **十亿级向量搜索**：通过将原始向量卸载至 SSD，使单机磁盘近似最近邻检索系统能够处理 SIFT1B、DEEP1B 等十亿级别数据集
- **数据库 AI 场景**：为向量数据库（如 [[entities/milvus|Milvus]]）的 writeback 存储分层提供设计蓝本，在内存中维护图索引，在持久化层维护完整数据
- **全闪存存储架构**：在现代 NVMe SSD 高带宽低延迟的特性上，利用 two-tier 架构平衡成本与性能，支撑大规模相似性搜索服务
- **索引构建优化**：与 [[concepts/two-pass-index-construction|Two-pass index construction]] 协同，支撑大规模图索引的一次性构建与后续检索分离

## 相关概念
- [[concepts/vamana-graph|Vamana graph]]：内存中存放的图索引结构，其邻接表是两层架构中 RAM 层的核心组成部分
- [[concepts/product-quantization|Product Quantization]]：用于生成内存中压缩向量的编码方法，实现高效距离近似计算
- [[concepts/ssd-access-optimization|SSD access optimization]]：通过减少随机 I/O 与对齐读取等策略，最大化 SSD 在向量搜索中的吞吐
- [[concepts/two-pass-index-construction|Two-pass index construction]]：与 two-tier 架构相配合的离线索引构建流程，确保图结构与压缩数据一致

## 相关实体
- [[entities/diskann|DiskANN]]：该架构的提出者与实现载体，在 NeurIPS 2019 中展示了基于 Vamana 的磁盘搜索系统
- [[entities/faiss|FAISS]]：提供 GPU/CPU 端的 PQ 与 IVF 等索引，其部分索引结构（如 IVF-PQ）在设计思路上与 two-tier 理念有共通之处
- [[entities/wisckey|WiscKey]]：将键值存储的索引与数据分离的 LSM-tree 变体，其存储解耦思想对 two-tier 架构的设计有启发意义

## 来源提及

- "RAM 存图 + PQ 压缩向量，SSD 存全精度向量" — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
- "DiskANN 提出 Vamana 图索引算法 + SSD 感知的两层存储架构" — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
- "§4.1 Two-Tier Storage：RAM 存 PQ + graph，SSD 存 full-precision vectors，beam search 仅最后一步访问 SSD。" — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
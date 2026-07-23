---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/diskann_neurips2019_009b0e]]"]
tags: [method]
aliases:
  - "SSD 访问优化"
  - "DFS/BFS layout for SSD"
generation_complete: true
---


# SSD access optimization

## 定义
SSD access optimization（SSD 访问优化）是指在基于 SSD 的近似最近邻（ANN）索引构建过程中，通过有意识地重排向量数据在磁盘上的物理存储布局，将搜索阶段的读取模式从随机 I/O 转换为近似顺序 I/O，从而充分利用 SSD 顺序读带宽远高于随机读带宽的特性来降低查询延迟的一种系统优化方法。该技术由 DiskANN 系统在 Vamana 图构建后引入，按照图遍历顺序（如 DFS 或 BFS）重新组织全精度向量的磁盘存储顺序。

## 关键特征
- **存储布局重排**：在 Vamana 图索引构建完成后，对全精度向量数据按照图的遍历顺序（深度优先 DFS 或广度优先 BFS）进行物理重排，使得图上相邻的节点在 SSD 上也趋于相邻存储。
- **读取模式转换**：将 beam search 等搜索算法在图上遍历时原本大量的随机 4KB 小块读取，转化为大块的顺序读取，接近 SSD 的顺序访问带宽上限。
- **带宽利用差异**：充分利用消费级 SSD 顺序读带宽（~500 MB/s）远高于随机读带宽（~50 MB/s）的硬件特性，大幅降低磁盘 I/O 等待时间。
- **对索引构建的侵入性**：该优化作为 DiskANN 两遍索引构建（Two‑pass index construction）流程的一部分，在第一遍构建存储高效图后执行，不改变图结构，仅改变数据布局。
- **通用性启示**：其“事先按访问模式排列数据以优化后续扫描”的思想，可推广到 AI 算子结果写回等场景，通过有顺序的批量写入来优化下游向量索引的构建或扫描效率。

## 应用
- **大规模向量近似搜索**：在内存容量不足以容纳全精度向量、必须依赖 SSD 存储的场景下（如十亿级别数据集），SSD 访问优化使 DiskANN 能够在仅使用 64 GB 内存和一块 SSD 的情况下，对 SIFT1B 数据集实现高召回、低延迟的搜索。
- **混合存储系统的 I/O 调度**：为两级存储架构（Two‑tier storage architecture）中“热数据在内存、冷数据在 SSD”的设计提供了互补优化——即使冷数据在 SSD，通过合理的布局也能显著提升访问速度。
- **AI 推理系统的结果写回优化**：该技术启发在向量搜索与 AI 算子结合的场景中，可在 GPU 结果写回 CPU 或持久化存储时，预先按后续索引构建或搜索所需的顺序进行批量写入，减少二次排序的开销，提升端到端吞吐。

## 相关概念
- [[concepts/vamana-graph|Vamana graph]]：SSD 访问优化基于 Vamana 图的结构进行存储重排，图的连通性决定了顺序读取的连续性。
- [[concepts/two-tier-storage-architecture|Two‑tier storage architecture]]：该优化是解决两级存储中 SSD 层 I/O 瓶颈的关键技术，与内存/SSD 两层分级存储设计紧密结合。
- [[concepts/two-pass-index-construction|Two‑pass index construction]]：SSD 访问优化在 DiskANN 索引构建的第二遍执行，是第一遍生成 Vamana 图后的数据后处理步骤。

## 相关实体
- [[entities/diskann|DiskANN]]：提出并实现 SSD 访问优化的系统，在其索引构建流程中集成了基于图遍历的向量重排策略。

## 来源提及

- "索引构建时将向量按图遍历顺序（DFS/BFS）重新排列存储在 SSD 上，使搜索过程中连续访问的向量在物理存储上趋于连续，将随机读转化为近似顺序读" — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
- "此假设依赖 Vamana 图的边布局经过 DFS/BFS 重排。" — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
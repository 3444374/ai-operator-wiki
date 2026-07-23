---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/diskann_neurips2019_009b0e]]"]
tags: [product]
aliases:
  - "DiskANN (NeurIPS 2019)"
  - "Vamana-based search engine"
  - "磁盘近似最近邻"
generation_complete: true
---


# DiskANN

## 描述
DiskANN 是一个针对十亿级向量近邻搜索的高性能系统，由 Suhas Jayaram Subramanya 等人在 NeurIPS 2019 提出并开源为 C++ 实现（GitHub: microsoft/DiskANN）。其核心是由 [[concepts/vamana-graph|Vamana graph]] 图索引算法与 SSD 感知的 [[concepts/two-tier-storage-architecture|Two-tier storage architecture]] 相结合：邻接表和经 [[concepts/product-quantization|Product Quantization]] 压缩的向量驻留在 RAM 中，全精度向量存储在 SSD 上。搜索时，beam search 利用 RAM 中的距离近似快速引导图遍历，仅对 Top-K 候选通过 [[concepts/ssd-access-optimization|SSD access optimization]] 调取全精度向量进行精确重排序，从而大幅降低昂贵的 SSD 访问次数。在 [[entities/sift1b|SIFT1B]] 数据集上，单台 64GB RAM 机器可实现 95.3% recall@1 且平均查询延迟低于 3ms，证明了单节点足以支撑大规模向量检索，无需分布式集群。该系统对数据库 AI 写回优化中的存储分层设计具有直接启发意义。

## 相关实体
- [[entities/sift1b|SIFT1B]]
- [[entities/deep1b|DEEP1B]]
- [[entities/faiss|FAISS]]
- [[entities/sptag|SPTAG]]
- [[entities/nmslib|NMSLib]]

## 相关概念
- [[concepts/vamana-graph|Vamana graph]]
- [[concepts/product-quantization|Product Quantization]]
- [[concepts/alpha-pruning|α-pruning]]
- [[concepts/two-tier-storage-architecture|Two-tier storage architecture]]
- [[concepts/ssd-access-optimization|SSD access optimization]]

## 来源提及

- "DiskANN 提出 Vamana 图索引算法 + SSD 感知的两层存储架构，在单台 64GB RAM + SSD 的 commodity 机器上实现 10 亿级向量近邻搜索，95%+ recall@1 且延迟 < 3ms，证明了十亿级向量搜索不需要分布式集群。" — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
- "DiskANN 的 SSD 感知设计是差异化创新。" — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
- "DiskANN 可以看作 NSG + SSD offload。" — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
- "DiskANN 代码开源（GitHub: microsoft/DiskANN，C++ 实现）。" — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
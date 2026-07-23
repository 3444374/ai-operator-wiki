---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/diskann_neurips2019_009b0e]]"]
tags: [product]
aliases:
  - "Non-Metric Space Library"
generation_complete: true
---


# NMSLib

## 描述
NMSLib 是一个高效的非度量空间相似度搜索库，实现了多种图索引算法，包括 [[concepts/hnsw|HNSW]] 和 SW‑graph 等。在 [[entities/diskann|diskann]] 论文中，NMSLib 被用作对比基线之一。实验表明，当内存限制为 64 GB 时，DiskANN 在召回率和延迟上均优于 NMSLib 的全内存实现，这主要因为 NMSLib 默认需要将所有向量常驻内存，难以直接处理十亿级数据集。DiskANN 通过 SSD offload，仅需少量 RAM 维护图结构，即可达到与全内存方案可比的精度，从而克服了 NMSLib 在面对超大规模索引时的内存瓶颈。

## 相关实体
- [[entities/diskann|diskann]]
- [[entities/faiss|FAISS]]
- [[entities/sptag|SPTAG]]

## 相关概念
- [[concepts/hnsw|HNSW]]
- [[concepts/vamana-graph|Vamana graph]]

## 来源提及

- "Baseline: ... NMSLib" — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
- "DiskANN 的核心贡献是实现'降内存而不降精度'——用 SSD + PQ 替代全量 RAM。" — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/diskann_neurips2019_009b0e]]"]
tags: [product]
aliases:
  - "Facebook AI Similarity Search"
  - "Faiss library"
  - "FAISS 库"
generation_complete: true
---


# FAISS

## 描述
FAISS（Facebook AI Similarity Search）是 Meta（前 Facebook）AI Research 开源的高性能向量相似度搜索库。它支持多种索引策略，如 IVF、IMI 和 HNSW+PQ 等，被广泛用于大规模向量检索任务。在 [[entities/diskann|DiskANN]] 论文中，FAISS 作为关键对比基线出现：在内存受限条件下（如 64GB RAM 处理 10 亿向量），FAISS 基于聚类/倒排的方法召回率（recall@1）显著低于 DiskANN（约 75% vs 95%），这凸显了图索引在精度上的优势。DiskANN 借鉴了 FAISS 中的 [[concepts/product-quantization|Product Quantization]]（PQ）压缩思路，同时通过 SSD offload 和 [[concepts/vamana-graph|Vamana graph]] 弥补了精度损失，在同等资源约束下实现了性能超越。FAISS 与 [[entities/sptag|SPTAG]]、[[entities/nmslib|NMSLib]] 等同属向量相似度搜索领域的代表性工具，其在极端内存限制下的表现推动了后续基于图和磁盘的混合索引研究。

## 相关实体
- [[entities/diskann|DiskANN]]
- [[entities/sptag|SPTAG]]
- [[entities/nmslib|NMSLib]]

## 相关概念
- [[concepts/product-quantization|Product Quantization]]
- [[concepts/vamana-graph|Vamana graph]]

## 来源提及

- "FAISS IVF/IMI（倒排索引）、FAISS HNSW+PQ（内存压缩方案）" — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
- "FAISS 的聚类方法在同等内存约束下 recall 显著低于 DiskANN（~75% vs 95% @ SIFT1B recall@1）" — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
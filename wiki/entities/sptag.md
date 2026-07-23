---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/diskann_neurips2019_009b0e]]"]
tags: [product]
aliases:
  - "Space Partition Tree and Graph"
  - "Microsoft SPTAG"
generation_complete: true
---


# SPTAG

## 描述
SPTAG（Space Partition Tree and Graph）是微软 Bing 团队在 KDD 2018 上提出的向量近似最近邻搜索库，采用树与图混合索引结构，面向大规模高维向量检索场景。在 [[entities/diskann|DiskANN]] 论文中，SPTAG 被列为对比基线，与 [[entities/faiss|FAISS]] 等流行库一同评估。两者均为微软系向量检索工作，但代表了不同设计侧重上的演进路线：SPTAG 依赖内存中的混合索引，原始设计未专门优化 SSD 存储层级，因此在大内存约束下其 offload 效率不如 [[entities/diskann|DiskANN]] 的 SSD‑感知策略。[[entities/diskann|DiskANN]] 则通过纯图索引（Vamana）与显式的 SSD 感知设计，在单机十亿级搜索任务上实现了更优的性能。

## 相关实体
- [[entities/diskann|DiskANN]]
- [[entities/faiss|FAISS]]

## 相关概念
- [[concepts/vamana-graph|Vamana graph]]

## 来源提及

- "比 SPTAG（Microsoft/Bing, KDD 2018）：同为微软出品，SPTAG 是树+图混合索引，DiskANN 是纯图索引。DiskANN 的 SSD 感知设计是差异化创新。" — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
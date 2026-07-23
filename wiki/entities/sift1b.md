---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/diskann_neurips2019_009b0e]]"]
tags: [other]
aliases:
  - "SIFT1B dataset"
generation_complete: true
---


# SIFT1B

## 描述
SIFT1B 是一个广泛使用的标准大规模向量检索基准数据集，包含 10 亿个 128 维的 SIFT 描述向量，采用 L2 距离度量。该数据集代表了十亿级规模的静态图像特征匹配场景，是评估 ANN 索引方法 scalability 的关键 benchmark。在 [[entities/diskann|DiskANN]] 论文中，SIFT1B 作为核心实验数据集，展示了单节点方案在 64GB RAM + SSD 环境下达到 95.3% recall@1 且查询延迟 < 3ms 的效果。与 [[entities/deep1b|DEEP1B]] 类似，该数据集常与 [[entities/faiss|FAISS]] 等 ANN 库配合使用，用于验证 [[concepts/vamana-graph|Vamana graph]] 和 [[concepts/product-quantization|Product Quantization]] 等索引技术的可扩展性。

## 相关实体
- [[entities/deep1b|DEEP1B]]
- [[entities/diskann|DiskANN]]
- [[entities/faiss|FAISS]]

## 相关概念
- [[concepts/vamana-graph|Vamana graph]]
- [[concepts/product-quantization|Product Quantization]]

## 来源提及

- "SIFT1B（128 维，1B 点，L2 距离）" — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
- "SIFT1B recall@1 95.3%，α=1.2, R=64, L=100, M=16，64GB RAM + SATA SSD" — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
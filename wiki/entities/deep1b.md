---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/diskann_neurips2019_009b0e]]"]
tags: [other]
aliases:
  - "DEEP1B dataset"
  - "Deep1B"
generation_complete: true
---


# DEEP1B

## 描述
DEEP1B 是一个十亿级向量检索基准数据集，包含 10 亿个 96 维深度神经网络特征，使用余弦距离度量。在 [[entities/diskann|DiskANN]] 的实验中，基于 [[concepts/vamana-graph|Vamana graph]] 图索引在该数据集上达到了 98.2% recall@1，验证了 Vamana 图在非 SIFT 特征上的有效性。与 [[entities/sift1b|SIFT1B]] 相比，DEEP1B 的特征维度略低，但来源于实际深度学习应用，因此对评估向量搜索系统（如 [[entities/faiss|FAISS]]）的实用性更有参考价值。该数据集推动了 [[concepts/product-quantization|Product Quantization]] 等近似最近邻搜索技术的基准测试与优化。

## 相关实体
- [[entities/sift1b|SIFT1B]]
- [[entities/diskann|DiskANN]]
- [[entities/faiss|FAISS]]

## 相关概念
- [[concepts/vamana-graph|Vamana graph]]
- [[concepts/product-quantization|Product Quantization]]

## 来源提及

- "DEEP1B（96 维，1B 点，cosine 距离）" — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
- "DEEP1B recall@1 98.2%，α=1.2, R=32, L=80, M=32, NVMe SSD" — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
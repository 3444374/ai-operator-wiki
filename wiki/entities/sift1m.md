---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/diskann_neurips2019_009b0e]]"]
tags: [other]
aliases:
  - "SIFT1M dataset"
  - "SIFT1M 数据集"
generation_complete: true
---


# SIFT1M

## 描述
SIFT1M 是一个公开的标准图像特征向量数据集，包含一百万个 128 维 SIFT 描述符向量。它是近似近邻搜索（ANN）领域的经典 benchmark 之一，许多图索引和量化方法均在其上报告结果。在 [[entities/diskann|DiskANN (NeurIPS 2019)]] 论文中，SIFT1M 被用作小规模验证数据集，与十亿级数据集 [[entities/sift1b|SIFT1B]] 配合使用，以评估索引构建和搜索算法从百万级到十亿级的泛化性能。该数据集与 [[entities/sift1b|SIFT1B]]、[[entities/deep1b|DEEP1B]] 等共同构成了 ANN 算法的标准评测体系。

## 相关实体
- [[entities/sift1b|SIFT1B]]
- [[entities/deep1b|DEEP1B]]

## 相关概念
- [[concepts/vamana-graph|Vamana graph]]

## 来源提及

- "**数据集** | SIFT1B（128 维，1B 点，L2 距离）、DEEP1B（96 维，1B 点，cosine 距离）、SIFT1M（1M 点）；均为公开标准 benchmark |" (**数据集** | SIFT1B（128 维，10亿点，L2 距离）、DEEP1B（96 维，10亿点，cosine 距离）、SIFT1M（100万点）；均为公开标准基准测试 |) — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
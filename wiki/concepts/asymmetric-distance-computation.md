---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: []
tags: [method]
aliases:
  - "ADC"
  - "ADC distance"
generation_complete: true
---


# Asymmetric distance computation

## 定义
Asymmetric distance computation (ADC) 是 Product Quantization (PQ) 压缩场景下，计算未压缩查询向量与压缩数据库中码本距离的标准方法。与对称距离计算 (Symmetric Distance Computation, SDC) 不同，ADC 中查询向量保持全精度，仅数据库向量被量化压缩，从而在计算效率和精度之间取得有利平衡。

## 关键特征
- **非对称性**：查询向量不做量化，直接使用原始浮点向量；数据库向量由 PQ 编码的短码表示
- **查表加速**：预先计算查询的每个子向量与对应子空间内所有聚类中心的距离，构建距离查找表（lookup table）
- **无解压计算**：对每一个数据库向量，仅通过查表累加对应子码的距离，全程无需从码本重建原始向量
- **误差可控**：主要由 PQ 量化误差引起，典型配置（M=16~32 字节）下 recall 损失通常不超过 3 个百分点
- **beam search 友好**：在 DiskANN 等图索引方法中，ADC 被用于快速评估 PQ 候选与查询的近似距离，引导图遍历方向

## 应用
- 基于 PQ 压缩的大规模向量检索（ANN）场景，如 DiskANN 的 beam search 阶段使用 ADC 快速评分
- Faiss、Milvus 等向量数据库在 PQ 索引上的距离计算
- 内存受限或需高吞吐的近似最近邻搜索，如移动端离线检索、磁盘驻留索引
- 任何需要快速近似距离且允许微小精度损失的相似度查询任务

## 相关概念
- [[concepts/product-quantization|Product Quantization]]
- [[concepts/vamana-graph|Vamana graph]]

## 相关实体
- [[entities/diskann|DiskANN]]
- [[entities/faiss|faiss]]
- [[entities/milvus|milvus]]

## 源头中的提及
（暂无具体引文，待补充）

## 来源提及

- "距离计算使用 asymmetric distance computation (ADC)：查询向量的子向量与存储的 centroid code 做查表 + 累加。" — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
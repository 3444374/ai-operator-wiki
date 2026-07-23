---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/diskann_neurips2019_009b0e]]"]
tags: [method]
aliases:
  - "Reranking"
  - "Re-ranking"
  - "重排序"
generation_complete: true
---


# 重排序 (Reranking)

## 定义

重排序是 DiskANN 查询管线中的最后一个阶段，其核心作用是对 beam search 返回的 Top-K 候选向量，使用从 SSD 按需读取的全精度向量重新计算精确距离（如 L2 或余弦距离），从而修正前面步骤中由乘积量化（PQ）近似计算带来的距离误差，并按精确距离重新排序，输出最终查询结果。该阶段通过小规模的 SSD 随机读取实现了高召回率与低延迟的平衡，是 RAM + SSD 两层近似搜索架构的关键环节。

## 关键特征

- 距离校准：用全精度向量替代 PQ 编码向量进行最终距离计算，消除量化近似误差，保证输出结果与暴力搜索在 Top-K 上高度一致。
- 按需 SSD 访问：仅对 beam search 输出的少量候选向量（通常几百个）触发 SSD 随机读取，避免了全量扫描 SSD 的开销。
- 低延迟影响：由于候选集远小于原始数据集，SSD 随机 I/O 次数极有限，不会显著增加查询延迟。
- 架构解耦：允许将海量全精度向量存储在廉价的 SSD 上，而将搜索图索引和 PQ 编码保留在内存中，实现存储容量与查询性能的横向扩展。
- 管线化集成：紧接在 beam search 之后执行，与 graph-based 的候选生成和 PQ 距离近似协同工作，形成完整的两阶段搜索流程。

## 应用

- 亿级乃至十亿级高维向量近似最近邻搜索（ANN）：通过重排序阶段，在保证召回率 > 95% 的同时，使单条查询的延迟保持在几毫秒到几十毫秒量级。
- 磁盘驻留向量数据库：如 DiskANN 自身的实现，支持在单机大容量 SSD 上构建索引并服务低延迟查询，适用于成本敏感的推荐系统、图像检索、语义搜索等场景。
- 混合存储场景：适用于任何采用“快速近似 + 精确重排”两阶段范式的 ANN 系统，可扩展到其它基于 SSD 的向量索引方案。

## 相关概念

- [[concepts/beam-search|Beam Search]] — 用于生成候选集的高召回近似搜索算法，为重排序提供 Top-K 候选向量。
- [[concepts/product-quantization|Product Quantization]] — 用于压缩向量和快速计算近似距离的量化技术，其误差正是重排序阶段所要修正的对象。
- [[concepts/two-tier-storage-architecture|Two-tier storage architecture]] — 将快速存储器（RAM）与大容量廉价存储器（SSD）分层利用的架构，重排序是使该架构可行的关键技术之一。

## 相关实体

- [[entities/diskann|DiskANN]] — 提出并集成重排序阶段的可扩展向量搜索系统，利用 RAM + SSD 两层架构实现海量向量的高召回率近似搜索。

## 来源中的引用

（暂无具体引述，相关描述可参考 DiskANN 原始论文中关于“Re‑ranking using full-precision vectors stored on SSD”的章节）

## 来源提及

- "搜索收敛后，仅对 Top-K 候选读取 SSD 上的全精度向量做精确重排序。" (搜索收敛后，仅对 Top-K 候选从 SSD 读取全精度向量进行精确重排序。) — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
- "SSD 访问次数 = O(L)，远小于全量扫描。" (SSD 访问次数 = O(L)，远小于全量扫描。) — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
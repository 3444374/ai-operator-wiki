---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/diskann_neurips2019_009b0e]]"]
tags: [method]
aliases:
  - "两阶段索引构建"
  - "增量索引构建"
  - "incremental index building"
generation_complete: true
---


# Two-pass index construction

## 定义
Two-pass index construction（两阶段索引构建）是 DiskANN 针对十亿级向量数据集提出的一种高效索引构建方法。其核心思想是将全量数据的 Vamana 图构建拆分为两个阶段：第一轮在随机采样的较小数据子集（约 2%）上构建初始图；第二轮以该初始图为起点，将剩余 98% 的数据逐点增量插入并同步更新边结构，从而避免全量数据上执行 KNN 搜索带来的 O(N²) 计算开销。

## 关键特征
- 两阶段分工：第一阶段在少量采样数据上建立近似图，第二阶段利用该图进行快速增量插入。
- 显著降低构建时间：对十亿级数据，索引构建时间由数天缩减至 2.5–6 小时。
- 适用于静态数据集：该方法假定数据集构建后不再频繁写入，因此在静态场景下性能最优。
- 增量插入开销较高：单点增量插入的延迟约为查询的 100 倍，对需要在线持续写入的场景（如 AI 推理写回）构成瓶颈。
- 启发后续优化方向：提示在动态写入场景下应探索批量插入与延迟索引构建相结合的策略。

## 应用
- 大规模近似最近邻（ANN）搜索引擎的离线索引构建，如 DiskANN 在处理 SIFT1B、DEEP1B 等十亿级数据集时的应用。
- 适用于静态知识库或定期重建索引的推荐系统、图像检索等场景。
- 作为动态索引构建的基准，用于评估增量插入策略的性能上限。

## 相关概念
- [[concepts/vamana-graph|Vamana graph]]
- [[concepts/ssd-access-optimization|SSD access optimization]]

## 相关实体
- [[entities/diskann|DiskANN]]

## 来源提及

- "Pass 1 在随机采样的子集（~2%）上构建 Vamana 图；Pass 2 利用已有图作为起点，将剩余 98% 数据逐点增量插入。" — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
- "构建阶段离线、查询在线，但对于需要持续增量更新的场景（新数据持续写入），必须原地增量构建，此时构建阶段的 512GB 内存需求成为限制。" — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/diskann_neurips2019_009b0e]]"]
tags: [method]
aliases:
  - "MRNG"
  - "单调相对邻域图"
  - "Monotonic Relative Neighborhood Graph"
generation_complete: true
---


# Monotonic Relative Neighborhood Graph

## 定义
单调相对邻域图（Monotonic Relative Neighborhood Graph, MRNG）是一种用于近似最近邻搜索的单调性图结构，它是NSG索引方法的核心基础。MRNG通过保证搜索路径上距离严格递减的单调性，避免贪心搜索陷入局部最优或死循环，从而在无需全局遍历的情况下高效收敛到近邻点。

## 关键特征
- **单调距离递减**：从任意起点出发，沿图边移动时到目标点的距离严格递减，天然形成一条收敛路径。
- **无死循环保护**：由于单调性，搜索不会在局部区域反复震荡或停滞。
- **长程边与局部边平衡**：MRNG的结构天然引入了长程边，支持快速跳转到远处区域，兼顾局部精度与全局导航能力。
- **对内存的依赖**：构建MRNG需要将所有向量保存在内存中以维护图结构，这成为大规模场景下的瓶颈。
- **与Vamana图的对比**：MRNG的边选择基于图论上的严格单调性理论，而Vamana图通过α-pruning参数化地控制剪枝强度，两者均通过精心设计的剪枝策略引入长程边。

## 应用
- **近似最近邻搜索（ANN）**：作为NSG算法的基础图结构，用于高维向量的高精度、高效率检索。
- **大规模向量检索系统**：在推荐、图像与多媒体检索、自然语言处理等依赖向量相似度的场景中，MRNG提供理论支撑的搜索保障。
- **DiskANN的研究基础**：DiskANN在讨论中引用MRNG，指出其在内存中的全量向量需求限制了扩展性，从而引出通过SSD offload的新型图索引设计。

## 相关概念
- [[concepts/nsg|NSG]]
- [[concepts/vamana-graph|Vamana graph]]
- [[concepts/alpha-pruning|α-pruning]]

## 相关实体
- [[entities/diskann|DiskANN (NeurIPS 2019)]]

## 来源提及

- "比 **NSG** (Fu et al., VLDB 2019)：NSG 也是图索引，构建思路类似（Monotonic Relative Neighborhood Graph），但 NSG 同样要求全量向量驻留 RAM。" (相比 **NSG** (Fu et al., VLDB 2019)：NSG 也是一种图索引，构建思路类似（单调相对邻域图），但 NSG 同样要求全量向量驻留在 RAM 中。) — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
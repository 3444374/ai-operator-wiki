---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/diskann_neurips2019_009b0e]]"]
tags: [method]
aliases:
  - "PQ"
  - "PQ compression"
  - "product quantization"
generation_complete: true
---


# Product Quantization

## 定义
Product Quantization (PQ) 是一种向量压缩方法，将原始高维向量空间分解为多个低维子空间的笛卡尔积，然后在每个子空间内独立进行向量量化。具体而言，将 d 维向量分割成 M 个互不相交的子向量，每个子向量在其子空间内通过 K‑means 聚类为 256 个中心点，每个中心点用 1 byte 编码，使得原向量压缩后仅需 M bytes 表示。距离计算采用不对称距离计算 (Asymmetric Distance Computation, ADC)，查询向量在量化时不做压缩，而是将其各子向量与对应的码本中心点距离制表后，通过查表累加获得近似距离。

## 关键特征
- **子空间分割与独立量化**：将高维向量切分为 M 个子向量，各子空间单独学习码本，码本大小通常为 256，实现每个子向量压缩为 1 byte。
- **极低存储开销**：压缩后每个向量仅占用 M bytes（典型 M=16 或 32），相比原始 4d bytes（float32）或 2d bytes（bfloat16）大幅降低。
- **非对称距离计算 (ADC)**：查询向量保持原始精度，仅对数据库向量进行量化；距离计算时通过查表加和避免显式解压，平衡精度与速度。
- **可调的精度‑存储折衷**：通过调节子空间数量 M 控制压缩率与召回率损失，通常在大型数据集上以较小精度损失换取数十倍的内存节省。
- **向量近邻搜索加速**：压缩表示可直接存于内存或高速缓存，支撑大规模近似最近邻（ANN）搜索的快速图遍历或索引扫描。

## 应用
- **大规模向量索引的存储优化**：如 [[entities/diskann|DiskANN]] 利用 PQ 将原始向量的 512 bytes/vector 压缩至 16 bytes/vector，在 SIFT1B 数据集上召回率仅下降约 3 个百分点，使图索引能够装入内存引导搜索。
- **向量数据库的低精度表示**：常用于 [[entities/faiss|Faiss]] 等库中为 IVF‑ADC、IVF‑PQ 等索引提供压缩存储，支撑十亿级向量的相似性检索。
- **AI 推理的即时压缩决策**：在 writeback 场景下，AI 算子产出 embedding 后可实时采用 PQ 压缩，在精度损失可控的前提下降低存储与传输开销，优化 LLM 推理系统中的向量缓存与传输。
- **边缘设备与内存受限环境**：将高维特征压缩为紧凑码本，适配移动端、IoT 等场景的轻量化检索。

## 相关概念
- [[concepts/quantization|Quantization]]
- [[concepts/vamana-graph|Vamana graph]]
- [[concepts/two-tier-storage-architecture|Two‑tier storage architecture]]

## 相关实体
- [[entities/diskann|DiskANN]]
- [[entities/faiss|Faiss]]

## 来源提及

- "PQ 压缩向量：M bytes/vector（典型值 M=16~32，即 16~32 bytes/vector vs 原始 512 bytes）。" — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
- "§4.3 PQ Compression：M=16 bytes/vector 下 recall 下降仅 ~3 points。" — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
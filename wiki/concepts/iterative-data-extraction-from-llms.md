---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/galois_sigmod2025_c4af88]]"]
tags: [method]
aliases:
  - "迭代式LLM数据提取"
  - "Iterative LLM Extraction"
  - "Iterative data extraction from LLMs"
generation_complete: true
---


# Iterative data extraction from LLMs

## 定义
Iterative data extraction from LLMs 是一种通过多次大规模语言模型（LLM）调用逐步累积、精炼结构化信息的方法。在 [[entities/galois|Galois]] 系统中，该方法体现在 **Table-Scan** 的逐行迭代生成和 **Key-Scan** 的两步分解提取过程中。迭代次数并非固定，而是根据每次调用的置信度评分和查询语义复杂度动态调整，从而在保证输出质量的同时显著降低总体延迟与调用成本。

## 关键特征
- 将复杂的结构化抽取任务分解为一组编排好的 LLM 调用序列，避免单次大上下文处理的失败率高、成本高的问题。
- 迭代次数自适应：基于置信度阈值和查询复杂度，实验表明优化后平均迭代次数从 **6.82** 降至 **3.92**。
- 每次迭代只处理当前尚未完成或低置信度的信息片段，形成“增量构建”的数据流。
- 与物理算子 [[concepts/table-scan|Table-Scan]] 和 [[concepts/key-scan|Key-Scan]] 紧密绑定，作为这两个算子的核心执行策略。
- 迭代过程中的中间状态（如已提取的行、已验证的键）可被缓存与复用，进一步减少冗余 LLM 调用。

## 应用
- 半结构化文本中表格的自动提取：通过 [[concepts/table-scan|Table-Scan]] 逐行迭代，逐步生成结构化的数据表。
- 键值对抽取：通过 [[concepts/key-scan|Key-Scan]] 先定位候选键范围，再在范围内迭代提取完整键值对。
- 任何需要从长文本、多文档或高噪声数据中获取可靠结构化信息的场景，例如知识图谱填充、合同条款提取、法律文书解析等，均可采用该迭代抽取范式以平衡质量与成本。

## 相关概念
- [[concepts/table-scan|Table-Scan]] —— Galois 中实现逐行迭代抽取的物理算子
- [[concepts/key-scan|Key-Scan]] —— Galois 中实现两步迭代键值抽取的物理算子

## 相关实体
- [[entities/galois|Galois]] —— 该迭代抽取方法的载体系统

## 来源提及

- "Table-Scan 直接迭代式 prompt 获取所有属性值" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
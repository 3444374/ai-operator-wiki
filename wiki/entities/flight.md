---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/galois_sigmod2025_c4af88]]"]
tags: [other]
aliases:
  - "Flight 数据集"
  - "Flight dataset"
generation_complete: true
---


# Flight

## 描述
Flight 是 [[moc/实验设计|Galois 实验]]中使用的一个小型结构化数据集，专门服务于[[concepts/internal-knowledge|内部知识（IK）]]场景。该数据集旨在评估语言模型在 SQL-over-LLM 任务中的查询生成质量，验证系统能否基于内部知识准确生成结构化查询。Flight 与 [[entities/geo-test|geo-test]] 数据集共同构成了实验的基础数据，两者分别覆盖不同维度的查询挑战。作为 IK 场景的基准之一，Flight 的表格结构和查询负载均经过精心设计，以探测 LLM 在受限知识条件下的表现。

## 相关实体
- [[entities/geo-test|geo-test]]

## 相关概念
- [[concepts/internal-knowledge|Internal knowledge (IK)]]

## 来源提及

- "Flight/Geo/World/Scholar（IK 内参知识）" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
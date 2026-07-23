---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/galois_sigmod2025_c4af88]]"]
tags: [phenomenon]
aliases:
  - "实体频率偏差"
  - "entity popularity bias"
  - "流行度偏差"
generation_complete: true
---


# Popularity bias in LLM knowledge extraction

## 定义
一种系统性的偏差现象：大型语言模型（LLM）在提取参数化知识时，其输出质量和完整性高度依赖于目标实体在训练语料中的出现频率。高频实体（如美国总统）的知识提取得分（AVG-Score 0.862）显著高于低频实体（如委内瑞拉总统，AVG-Score 0.482），该偏差是 LLM 作为存储层时固有的局限性，直接影响结构化查询的召回率和精度。

## 关键特征
- **频率相关**：提取质量与实体的训练数据流行度正相关，而非仅由模型容量决定。
- **系统偏差**：不是偶发错误，而是可复现、可量化的结构性缺陷，在 [[entities/presidents-dataset|Presidents 数据集]] 等多实体场景中表现稳定。
- **影响知识覆盖**：导致低频实体（长尾知识）的召回率严重不足，降低 “LLM as Storage” 范式的可靠性。
- **独立于查询形式**：即使采用相同的结构化提示和抽取框架，偏差依然存在，反映的是参数化知识存储本身的约束。

## 应用
- **知识抽取系统设计**：在 [[entities/lotus|LOTUS]] 或 [[entities/tag|TAG]] 等语义查询系统中，需评估实体流行度偏差对最终准确率的影响，并引入外部检索或频率校准机制。
- **数据集与基准构建**：在 [[entities/presidents-dataset|Presidents 数据集]]、[[entities/scholar-dataset|Scholar 数据集]] 等评测集中，需分层控制实体频率，以公平衡量 LLM 的内部知识。
- **查询优化**：对于结构化查询（如 “列出所有总统”），可预先识别候选实体的频率分布，动态调整推理策略（如追加外部证据、改写提示）以缓解偏差。

## 相关概念
- [[concepts/llm-as-storage|LLM as Storage]]
- [[concepts/internal-knowledge|Internal Knowledge (IK)]]
- [[concepts/knowledge-extraction|Knowledge Extraction]]

## 相关实体
- [[entities/galois|Galois]]
- [[entities/presidents-dataset|Presidents 数据集]]
- [[entities/lotus|LOTUS]]
- [[entities/tag|TAG]]

## 来源提及

- "实体流行度偏差（popularity bias）是一个根本性限制" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
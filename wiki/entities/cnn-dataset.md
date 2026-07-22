---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/cortex_aisql_sigmod2026_c18b08]]"]
tags: [other]
aliases:
  - "CNN/Daily Mail dataset"
  - "CNN-DailyMail"
generation_complete: true
---


# CNN dataset

## 描述
CNN dataset 是一个用于图像分类或语义匹配任务的数据集，可能指代广泛使用的 CNN/Daily Mail 摘要数据集，或在特定实验中构造的自定义数据集。在 [[entities/cortex-aisql|Cortex AISQL]] 的语义 Join 重写实验中，该数据集被用作基准测试的一部分：原始 AI_JOIN 查询耗时 4.4 小时，而经过重写优化后耗时降至 3.8 分钟，实现了约 69.5 倍的端到端加速。该实验展示了语义查询重写技术在真实数据集上的显著性能收益。

## 相关实体
- [[entities/cortex-aisql|Cortex AISQL]]

## 相关概念
- [[concepts/semantic-join-rewrite|Semantic join rewrite]]
- [[concepts/multi-label-classification-rewrite|Multi-label classification rewrite]]

## 来源提及

- "CNN 数据集上从 4.4 小时降至 3.8 分钟（69.5×）" (在 CNN 数据集上从 4.4 小时降至 3.8 分钟（69.5 倍加速）。) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
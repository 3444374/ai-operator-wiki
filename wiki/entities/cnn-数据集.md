---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/cortex_aisql_sigmod2026_c18b08]]"]
tags: [other]
aliases:
  - "CNN/Daily Mail 数据集"
  - "CNN-DailyMail"
  - "CNN"
generation_complete: true
---


# CNN 数据集

## 描述
CNN 数据集（常指 **CNN/Daily Mail** 新闻摘要数据集）是由 CNN 和 Daily Mail 新闻文章及其对应的人工摘要组成的基准数据集，广泛用于文本摘要与文档理解任务。在 [[entities/cortex-aisql|Cortex AISQL]] 的研究中，该数据集被用来验证语义 Join 重写的效果：通过将原本复杂度为 O(N×M) 的交叉连接 [[concepts/AI_JOIN|AI_JOIN]] 重写为线性的 [[concepts/AI_CLASSIFY|AI_CLASSIFY]]，成功将执行时间从 4.4 小时压缩到 3.8 分钟（加速约 69.5 倍），同时平均 F1 分数提升了 44.7 个百分点。该实验为缓解非结构化数据上的二次复杂度问题提供了关键证据，证明 [[concepts/语义Join重写|语义Join重写]] 技术具备在生产系统中推广 AI_JOIN 的潜力。

## 相关实体
- [[entities/cortex-aisql|Cortex AISQL]] — 在语义 Join 重写实验中直接使用该数据集
- [[entities/snowflake|Snowflake]] — Cortex AISQL 的宿主平台

## 相关概念
- [[concepts/语义Join重写|语义Join重写]]
- [[concepts/AI_JOIN|AI_JOIN]]
- [[concepts/AI_CLASSIFY|AI_CLASSIFY]]

## 来源提及

- "语义 Join 重写（15-70× 加速）... 效果：平均 30.7× 加速。CNN 数据集上从 4.4 小时降至 3.8 分钟（69.5×），F1 平均提升 44.7 个百分点。" (语义 Join 重写（15-70 倍加速）…… 结果：平均 30.7 倍加速。在 CNN 数据集上，时间从 4.4 小时降至 3.8 分钟（69.5 倍），F1 平均提升 44.7 个百分点。) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
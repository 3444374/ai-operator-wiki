---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources:
  - "[[sources/cortex_aisql_sigmod2026_c18b08]]"
tags:
  - "other"
aliases:
  - "Natural Questions dataset"
  - "NQ"
  - "NQ 数据集"
generation_complete: true
---

# NQ dataset

## 描述
NQ dataset（Natural Questions dataset）是 Google 推出的一个大规模问答数据集，广泛用于自然语言处理和信息检索任务，尤其是开放域问答与文档检索。在 [[entities/sigmod-2026|sigmod-2026]] 的相关论文中，该数据集被用于评估 [[concepts/adaptive-model-cascading|Adaptive model cascading]] 在 [[entities/cortex-aisql|Cortex AISQL]] 系统上的效果：通过自适应模型级联，系统在保证 F1 值接近纯 oracle 大模型（如 [[entities/llama-3.3-70b|Llama 3.3-70B]]）的前提下，实现了约 5.85 倍的推理加速。

NQ 数据集由真实用户提出的自然语言问题构成，每个问题都对应维基百科中相关的段落，是目前广泛使用的开放域问答基准之一。
## 相关实体
- [[entities/cortex-aisql|Cortex AISQL]]
- [[entities/llama-3.1-8b|Llama 3.1-8B]]
- [[entities/llama-3.3-70b|Llama 3.3-70B]]

## 相关概念
- [[concepts/adaptive-model-cascading|Adaptive model cascading]]

## 来源提及

- "NQ 数据集上 5.85× 加速，F1 接近 oracle 水平" (在 NQ 数据集上实现了 5.85 倍加速，F1 值接近预言机水平。) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
- "效果：NQ 数据集上 5.85× 加速，F1 接近 oracle 水平。" (结果：在 NQ 数据集上实现了 5.85 倍加速，F1 分数接近 oracle 水平。) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
- "平均节省 65.5% 执行时间。" (平均节省了 65.5% 的执行时间。) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
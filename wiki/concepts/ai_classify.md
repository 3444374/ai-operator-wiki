---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/cortex_aisql_sigmod2026_c18b08]]"]
tags: [term]
aliases:
  - "AI 分类算子"
  - "classification operator"
  - "AI classifier"
generation_complete: true
---


# AI_CLASSIFY

## 定义
AI_CLASSIFY 是 [[entities/cortex-aisql|Cortex AISQL]] 中的六类 AI SQL 算子之一，属于 AI 谓词类别。它执行分类任务，接受输入数据并输出一个类别标签，而不是像 [[concepts/ai_filter|AI_FILTER]] 那样输出布尔值。AI_CLASSIFY 在语义 Join 重写中扮演核心角色，能够将原本具有二次复杂度的 [[concepts/ai_join|AI_JOIN]] 操作重写为线性复杂度的 AI_CLASSIFY 调用，从而显著加速查询。

## 关键特征
- 输出类别标签而非真假值，与 [[concepts/ai_filter|AI_FILTER]] 形成互补
- 在 [[concepts/semantic-join-rewriting|语义Join重写]] 中承担关键角色，将右侧表的列作为分类标签，将 [[concepts/ai_join|AI_JOIN]] 的二次复杂度降至线性
- 是语义 Join 重写实现 15-70 倍查询加速的核心机制
- 作为 AI 谓词算子，可与传统 SQL 谓词（如 WHERE 条件）无缝集成

## 应用
- 在 [[entities/cortex-aisql|Cortex AISQL]] 中用于需要对表列或文本数据进行分类的场景，如情感分类、主题标记
- 与语义 Join 重写配合，大幅优化需要 AI 模型参与的连接查询性能，适用于大规模数据集上的分类驱动查询

## 相关概念
- [[concepts/ai_filter|AI_FILTER]]
- [[concepts/ai_join|AI_JOIN]]
- [[concepts/semantic-join-rewriting|语义Join重写]]

## 相关实体
- [[entities/cortex-aisql|Cortex AISQL]]

## 来源提及

- "AI_CLASSIFY：分类 / AI predicate" (AI_CLASSIFY：分类 / AI 谓词) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
- "将二次复杂度的语义 Join 重写为线性多标签分类——将右侧表的列作为标签，AI_JOIN 转换为 AI_CLASSIFY 操作" (将二次复杂度的语义 Join 重写为线性多标签分类——将右侧表的列作为标签，AI_JOIN 转换为 AI_CLASSIFY 操作) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
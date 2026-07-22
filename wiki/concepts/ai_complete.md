---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/cortex_aisql_sigmod2026_c18b08]]"]
tags: [term]
aliases:
  - "AI 文本生成算子"
  - "completion operator"
  - "AI_COMPLETE算子"
generation_complete: true
---


# AI_COMPLETE

## 定义
AI_COMPLETE 是 [[entities/cortex-aisql|Cortex AISQL]] 中定义的六类原生 AI SQL 算子之一，对应**文本生成**类任务。它使 SQL 查询能够直接调用大语言模型（LLM）进行内容补全与文本生成，将生成式 AI 能力内嵌入 SQL 引擎，而无需通过外部服务调用。

## 关键特征
- **内置 SQL 算子**：AI_COMPLETE 不是外部函数或 UDF 的黑盒包装，而是查询优化器可感知的一等公民算子
- **参与查询优化**：优化器可基于该算子的代价模型进行成本估算，将其纳入整体执行计划的选择与调优
- **面向离线大模型推理**：典型应用场景为 offline LLM 推理，适合批量、高吞吐的文本生成任务
- **统一的 AI 算子体系成员**：与 [[concepts/ai_embed|AI_EMBED]]、AI_FILTER、AI_CLASSIFY、AI_JOIN、AI_AGG 等共同构成 Cortex AISQL 的 AI 算子族
- **声明式调用**：用户通过简单的 SQL 语法即可触发文本补全，避免编写复杂的模型调用代码

## 应用
- **表格数据增强**：为结构化数据补充自然语言描述、总结或解释列内容
- **基于上下文的自动补全**：在数据清洗或转化流程中，按照已有内容生成缺失字段值
- **批量报告生成**：对查询结果集直接进行文段生成，输出可读性高的分析报告
- **与 AI 管道集成**：在包含多个 AI 算子的流水线中负责生成阶段，和筛选、嵌入、聚合等步骤联动

## 相关概念
- [[concepts/ai_embed|AI_EMBED]]
- AI_FILTER
- AI_CLASSIFY
- AI_JOIN
- AI_AGG
- [[concepts/ai-aware-query-optimization|ai-aware-query-optimization]]
- [[concepts/adaptive-model-cascading|adaptive-model-cascading]]

## 相关实体
- [[entities/cortex-aisql|Cortex AISQL]]

## 来源提及

- "AI_COMPLETE：文本生成 / offline LLM" (AI_COMPLETE：文本生成 / 离线大语言模型) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
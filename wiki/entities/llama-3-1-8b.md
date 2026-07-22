---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/cortex_aisql_sigmod2026_c18b08]]"]
tags: [product]
aliases:
  - "Llama 3.1 8B"
  - "Llama-3.1-8B"
  - "Meta Llama 3.1-8B"
generation_complete: true
---


# Llama 3.1-8B

## 描述
Llama 3.1-8B 是 Meta 开源的 80 亿参数大语言模型，在 [[entities/cortex-aisql|Cortex AISQL]] 的 [[concepts/adaptive-model-cascading|自适应模型级联]]方案中充当代理小模型（proxy model），负责处理大部分确定性行，以降低整体推理成本，构成级联系统的第一级。与之协同工作的大型模型为 [[entities/llama-3.3-70b|Llama 3.3-70B]]，后者通过 [[concepts/importance-sampling-routing|重要性采样路由]]机制处理少数不确定性较高的样本，从而实现整体性价比的优化。

## 相关实体
- [[entities/llama-3.3-70b|Llama 3.3-70B]]：级联方案中的大型骨干模型
- [[entities/cortex-aisql|Cortex AISQL]]：采用该模型的自适应查询系统

## 相关概念
- [[concepts/adaptive-model-cascading|Adaptive model cascading]]：指导大小模型分工的级联策略
- [[concepts/importance-sampling-routing|Importance sampling routing]]：用于决定样本路由的重要性采样机制

## 来源提及

- "小模型（如 Llama 3.1-8B）作为 proxy，处理大部分行；大模型（如 Llama 3.3-70B）作为 oracle，仅处理 proxy 不确定的行" (小模型（如 Llama 3.1-8B）作为代理，处理大部分行；大模型（如 Llama 3.3-70B）作为预言机，仅处理代理不确定的行。) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
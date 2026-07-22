---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/cortex_aisql_sigmod2026_c18b08]]"]
tags: [product]
aliases:
  - "Llama 3.3 70B"
  - "Meta Llama 3.3-70B"
generation_complete: true
---


# Llama 3.3-70B

## 描述
Llama 3.3-70B 是 Meta 发布的开源大语言模型，拥有 700 亿参数。在 [[concepts/adaptive-model-cascading|Adaptive model cascading]] 方案中，该模型被定位为 Oracle 大模型——即仅在轻量级模型（如 [[entities/llama-3.1-8b|Llama 3.1-8B]]）对当前样本的预测置信度不足时才被激活推理。这种“小模型兜底、大模型保底”的设计在 [[entities/snowflake|Snowflake]] 的 [[entities/cortex-aisql|Cortex AISQL]] 项目（如 [[entities/sigmod-2026|SIGMOD 2026]] 实验）中得到验证，能够在保持整体输出质量接近纯大模型水平的前提下大幅降低计算开销。

## 相关实体
- [[entities/llama-3.1-8b|Llama 3.1-8B]]
- [[entities/cortex-aisql|Cortex AISQL]]
- [[entities/snowflake|Snowflake]]
- [[entities/sigmod-2026|SIGMOD 2026]]

## 相关概念
- [[concepts/adaptive-model-cascading|Adaptive model cascading]]

## 来源提及

- "大模型（如 Llama 3.3-70B）作为 oracle，仅处理 proxy 不确定的行" (大模型（如 Llama 3.3-70B）作为预言机，仅处理代理不确定的行。) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
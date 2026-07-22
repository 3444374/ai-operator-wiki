---
type: concept
created: 2025-07-22
updated: 2026-07-22
sources:
  - "[[sources/cortex_aisql_sigmod2026_c18b08]]"
tags:
  - "method"
aliases:
  - "AI operator cost model"
  - "LLM cost function"
  - "代价模型"
generation_complete: true
---

# LLM inference cost model

## 定义
LLM inference cost model 是一个用于量化大语言模型推理成本的数学模型，核心公式为：
**C_op(n) = n × c_model + α**
其中：
- **n** 表示批处理中的输入行数（例如，一个 batch 中包含的文本行数）；
- **c_model** 为每行推理的边际成本，主要受 GPU 计算时间主导，通常以秒/行或美元/行等计量；
- **α** 为固定开销，包括模型加载、冷启动、API 调用建立等与行数无关的启动成本。

该模型将原本黑箱的 LLM 调用抽象为一个可计算、可预测的成本函数，使得查询优化器能够像处理传统关系算子一样，对包含 AI 算子的执行计划进行代价估算与比较。

## 关键特征
- **线性分解**：将推理成本拆分为与数据量成比例的可变部分和固定启动部分，符合实际 GPU 推理的资源消耗规律。
- **算子级建模**：直接对应 AI 嵌入算子（如 `AI_EMBED`、`AI_EXTRACT` 等），便于统一纳入查询执行计划。
- **成本可比较**：提供了统一的计量框架，使得优化器能够在谓词上拉、级联路由等不同策略之间进行代价比较。
- **支持 AI 感知优化**：是 [[concepts/ai-aware-query-optimization|AI-aware query optimization]] 的数值基础，为自适应模型级联提供决策依据。
- **联合代价函数**：采用加权和形式 \( w_1 \cdot C_{\text{LLM}} + w_2 \cdot C_{\text{CPUIO}} \) 进行查询计划选择，将 LLM 推理成本提升为一阶优化目标，使数据库能够显式感知 AI 算子的昂贵性和吞吐特性。
## 应用
- **谓词上拉决策**：通过比较 LLM 算子执行成本与谓词过滤后的成本，决定是否将选择条件下推到 AI 算子之前，以减少 n。
- **自适应模型级联（Adaptive Model Cascading）**：在 [[concepts/adaptive-model-cascading|自适应模型级联]] 中，利用该模型估算不同大小模型（如 Llama 3.1 8B vs. 70B）的处理成本，实现成本与质量的动态权衡。
- **批处理与并发优化**：指导如何设置最优 batch size 以分摊 α，避免模型加载开销成为主导。
- **查询预算控制**：在类似 Snowflake Cortex AISQL 等系统中，为单条查询设定推理预算上限，并在执行前进行成本预测。
- 基于该模型，优化器会将昂贵的 AI 谓词上拉至 Join 之后执行，避免盲目下推导致的百万级 LLM 调用；典型场景下可将调用次数从 11 万次降至 330 次。
## 相关概念
- [[concepts/ai-aware-query-optimization|AI-aware query optimization]]
- [[concepts/ai_embed|AI 嵌入算子]]

## 相关实体
- [[entities/lance|Lance]]
- [[entities/daft|Daft]]
- [[entities/ray|Ray framework]]
- [[entities/llama-3-1-8b|Llama 3.1 8B]]
- [[entities/llama-3-3-70b|Llama 3.3 70B]]
- [[entities/snowflake|Snowflake Inc.]]
- [[entities/cortex-aisql|Cortex AISQL]]

## 来源引用
- 该模型的定义和公式来源于对 Cortex AISQL 系统的分析，原文表述为：“We model the cost of an AI operator as C_op(n) = n × c_model + α, where n is the number of rows, c_model is the per-row inference cost dominated by GPU time, and α is the fixed overhead.”（参见 `sources/cortex_aisql_sigmod2026_c18b08`）

## 来源提及

- "代价模型：C_op(n) = n × c_model + α（每行 GPU 成本 + 固定开销）" (代价模型：C_op(n) = n × c_model + α（每行 GPU 成本 + 固定开销）。) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
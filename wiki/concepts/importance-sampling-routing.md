---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources:
  - "[[sources/cortex_aisql_sigmod2026_c18b08]]"
tags:
  - "method"
aliases:
  - "Importance Sampling Routing"
  - "基于重要性采样的路由"
  - "ISR"
  - "重要性采样"
generation_complete: true
---

# Importance Sampling Routing

## 定义
重要性采样路由（Importance Sampling Routing）是一种用于自适应模型级联的动态样本调度方法。它利用重要性采样技术在运行时学习两个决策阈值，将每一条输入行实时划分到三个区域：**接受区**（置信度高，直接由小模型处理）、**不确定区**（交由大模型 oracle 处理）和**拒绝区**（直接被过滤，不做进一步处理）。该策略在保证输出质量的前提下，使轻量的小模型覆盖绝大多数样本，从而显著降低总体计算成本。

该方法基于重要性采样这一核心统计采样技术，通过对样本置信度分布的估计来驱动决策阈值的动态划分，从而在高性价比下实现查询处理的自适应分流。
## 关键特征
- **双阈值在线学习**：通过重要性采样估计样本的置信度分布，动态确定接受阈值与拒绝阈值，无需预先固定。
- **三级区域划分**：将输入空间划分为接受、不确定、拒绝三类处理路径，实现细粒度的成本-质量折衷。
- **对小模型友好**：设计目标是让较便宜的小模型尽可能多地处理高置信度样本，仅在不确定性较高时调用昂贵的大模型。
- **自适应调整**：路由策略可以根据运行时的数据分布变化实时更新，保持最优级联性能。
- **与级联框架集成**：作为 [[concepts/adaptive-model-cascading|自适应模型级联]] 的核心路由组件，与模型成本估计和查询优化器紧密配合。
- **显著性能提升**：在 NQ 数据集上，该路由策略实现 5.85 倍加速，平均节省 65.5% 的执行时间，同时保持最终 F1 接近 oracle 水平。
## 应用
- **AI SQL 算子优化**：在需要对自然语言文本进行分类、过滤、补全等场景中，决定何时使用轻量级的 [[concepts/ai_filter|ai_filter]]、[[concepts/ai_classify|ai_classify]] 或 [[concepts/ai_complete|ai_complete]]，何时升级到大型语言模型。
- **自适应查询处理**：作为 [[concepts/ai-aware-query-optimization|AI 感知查询优化]] 的一部分，在 Cortex AISQL 等系统中实现对大模型调用的智能调度，降低特定查询的推理延迟和费用。
- **大规模数据处理流水线**：适用于需要在海量行上应用 AI 模型，同时又要求严格控制推断成本的业务场景。

## 相关概念
- [[concepts/adaptive-model-cascading|自适应模型级联]] —— 本路由方法所支撑的级联框架
- [[concepts/ai-aware-query-optimization|AI 感知查询优化]] —— 整体查询优化范式
- [[concepts/llm-inference-cost-model|llm-inference-cost-model]] —— 用于成本估算的 LLM 成本模型
- [[concepts/ai-sql-operators|ai-sql-operators]] —— AI SQL 算子概念集合

## 相关实体
- 暂无直接关联的实体（可通过 [[entities/cortex-aisql|Cortex AISQL]] 或 [[entities/snowflake|Snowflake]] 间接关联，但本概念作为通用方法独立存在）

## 来源提及

- "使用重要性采样在运行时学习双阈值路由策略，将行划分到接受区、不确定区和拒绝区" (使用重要性采样在运行时学习双阈值路由策略，将行划分到接受区、不确定区和拒绝区。) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
- "使用重要性采样在运行时学习双阈值路由策略，将行划分到接受区、不确定区和拒绝区。" (使用重要性采样在运行时学习双阈值路由策略，将行划分到接受区、不确定区和拒绝区。) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/db_perspective_llm_pvldb2025_300968]]"]
tags: [method]
aliases:
  - "自一致性"
  - "Self-Consistency"
  - "SC"
generation_complete: true
---


# Self-Consistency

## 定义
Self-Consistency（自一致性）是一种用于提升大型语言模型（LLM）输出可靠性的策略。其核心思想是对同一输入问题进行多次采样，生成多条不同的推理路径或答案，然后通过多数投票（或其他共识机制）选出最一致、最稳定的结果。该方法不改动模型本身的参数或结构，仅利用采样过程的多样性来增强最终输出的准确性，属于序列生成领域的高级推理时增强技术。

## 关键特征
- **不改变模型本质**：Self-Consistency 是一种后处理/推理时策略，无需重新训练或微调模型，直接作用于现有 LLM 的生成过程。
- **依赖采样多样性**：通过调整温度参数、使用核采样（nucleus sampling）等方式，从模型中获得多个不同的候选答案，多样性是该方法生效的前提。
- **多数投票共识**：对多个候选答案进行聚合，主流实现采用简单多数投票，也可扩展为加权投票或基于置信度的选择。
- **适用于复杂推理任务**：特别适合需要多步推理、逻辑链条较长的问题（如数学应用题、常识推理），单一采样可能偶然出错，但多数采样的共识往往能纠正个别错误。
- **序列生成高级方法**：常与 [[concepts/beam-search|Beam Search]] 等解码策略并列讨论，作为提升生成质量的互补手段。

## 应用
- **问答系统**：在开放域或闭域问答中，对同一个问题生成多个答案，取出现频率最高的回答，提升准确率。
- **数学推理**：针对需要分步计算的应用题，多次生成推理链，选择最终答案最一致的链作为最终输出。
- **代码生成**：为同一需求生成多个代码片段，通过测试用例或静态分析选出最正确、最高效的实现。
- **逻辑推理与决策**：在需要严谨推理的场景，如法律、医学辅助诊断，用 Self-Consistency 降低单一幻觉风险。
- **基准测试优化**：在评估 LLM 能力的榜单（如 GSM8K、MMLU）中，Self-Consistency 常作为一种不费力气的提分手段，与多数投票结合使用。

## 相关概念
- [[concepts/beam-search|Beam Search]] —— 另一种提升生成质量的解码策略，通过保留多条候选序列并扩展选择，与 Self-Consistency 的采样后聚合思路互相补足。
- [[concepts/graph-of-thoughts|Graph-of-Thoughts]] —— 更复杂的推理增强方法，将思维过程组织为图结构并进行推理，Self-Consistency 可视为其中一种轻量级多路径聚合方式。
- [[concepts/sampling-strategy|采样策略]] —— 用于产生多样性的各种采样方法（如 top-k、top-p、温度调节），是 Self-Consistency 的前置条件。

## 相关实体
暂无直接对应的实体页面，相关方法通常在多种推理框架或服务系统中作为可配置选项实现，例如 [[entities/vllm|vLLM]] 或 [[entities/sglang|SG-Lang]] 等系统可能集成类似的多采样与投票逻辑。

---

> *注：本条目参考了“大模型视角下的数据库”综述（PVLDB Vol. 18 Issue 12, 2025），其中将 Self-Consistency 列为序列生成的高级方法之一。*

## 来源提及

- "Sequence Generation<br/>Beam Search / Graph-of-Thoughts / Self-Consistency" (序列生成：束搜索 / 思维图 / 自一致性) — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/db_perspective_llm_pvldb2025_300968]]"]
tags: [method]
aliases:
  - "束搜索"
  - "Beam Search 算法"
generation_complete: true
---


# Beam Search

## 定义
Beam Search（束搜索）是一种启发式搜索算法，广泛应用于序列生成任务。它在每一步保持固定数量（beam width）的候选序列，按得分扩展并保留最优的部分，从而在穷举搜索的高计算成本与贪心解码的低质量之间取得平衡。在本文的 LLM 请求处理上下文中，Beam Search 被列为一种序列生成策略，其类比于数据库查询的**排序**与**剪枝**逻辑，与 [[concepts/graph-of-thoughts|Graph-of-Thoughts]]、[[concepts/self-consistency|Self-Consistency]] 并列。

## 关键特征
- **限制搜索宽度**：仅保留 $k$ 个当前最优候选，$k$ 为 beam width，控制探索范围和计算开销。
- **启发式评分**：使用模型输出的对数概率、条件概率或人工设计的打分函数对候选序列进行排序。
- **逐步剪枝**：每一时间步扩展所有保留序列的可能后续标记，仅保留得分最高的一批，其余被剪枝。
- **平衡质量与速度**：相较于贪心解码（$k=1$）提高输出多样性，相较于穷举搜索显著降低内存和计算开销。
- **应用多样性**：可用于有监督序列生成，也常与长度惩罚、多样化束等技巧结合使用。

## 应用
- **自然语言生成**：在机器翻译、文本摘要、图像描述等任务中生成高质量序列。
- **语音识别**：解码声学模型输出的概率序列，得到最可能的文本假设。
- **结构化预测**：如序列标注、句法分析等。
- **LLM 推理调度**：在本文语境中作为请求处理策略的一种，类比数据库引擎中的 **Top-k 排序与剪枝**，用于在延迟与输出质量之间折中。

## 相关概念
- [[concepts/graph-of-thoughts|Graph-of-Thoughts]]
- [[concepts/self-consistency|Self-Consistency]]
- [[concepts/flashattention|Flash Attention]] — 虽为注意力优化，同属 LLM 高效推理技术栈。
- [[concepts/continuous-batching|Continuous Batching]] — 同为动态请求级优化策略。

## 相关实体
暂无直接相关实体。

## 来源提及

- "Sequence Generation<br/>Beam Search / Graph-of-Thoughts / Self-Consistency" (序列生成：束搜索 / 思维图 / 自一致性) — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
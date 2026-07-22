---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/db_perspective_llm_pvldb2025_300968]]"]
tags: [method]
aliases:
  - "Token 采样器"
generation_complete: true
---


# Token Sampler

## 定义
Token Sampler 是 LLM 推理 Request Processing 层中的算子组件，负责在自回归解码的每一步根据模型输出的 logits 采样生成下一个 token。它的设计直接决定了生成质量与多样性之间的 trade-off，并可结合多种解码策略，如贪心解码（greedy decoding）、top‑k 采样、top‑p（nucleus）采样、temperature 调节等。在请求处理层中，Token Sampler 与 Attention 和 FFN（前馈网络）并列为三大核心算子。

## 关键特征
- 自回归决策核心：每一步解码都需要从 logits 分布中选出下一个 token，直接影响输出文本的质量与风格
- 解码策略无关：支持灵活切换或组合多种采样策略（greedy, top‑k, top‑p, temperature, beam search, self‑consistency 等），从而权衡准确度、多样性和计算开销
- 计算轻量但策略敏感：常规操作仅为 softmax + 采样，计算开销远低于 Attention 和 FFN；但在 beam search 或 self‑consistency 等需要多次采样的策略下，采样器的选择和实现会显著影响整体延迟与吞吐
- 质量‑多样性平衡：通过 temperature 缩放及剪枝（top‑k, top‑p）控制分布的锐度，避免生成重复或低概率的无意义 token

## 应用
- 对话系统与聊天助手：通过 top‑p 与 temperature 混合策略生成流畅且多样的回复
- 代码补全与生成：常使用较低的温度和较大的 top‑k 以保证语法与逻辑正确性
- 批量请求推理：在 [[concepts/request-batching|请求批处理]] 场景下，高效的采样实现可以降低生成阶段的计算瓶颈
- 复杂推理任务：结合 [[concepts/beam-search|Beam Search]] 或 [[concepts/self-consistency|Self-Consistency]] 提升事实准确性与推理一致性

## 相关概念
- [[concepts/beam-search|Beam Search]]
- [[concepts/self-consistency|Self-Consistency]]
- [[concepts/graph-of-thoughts|Graph-of-Thoughts]]

## 相关实体
暂无直接关联实体。

## 来源提及

- "Request Processing 层分为 Operator Design（Attention / FFN / Token Sampler）和 Sequence Generation（Beam Search / Graph-of-Thoughts / Self-Consistency）。" — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
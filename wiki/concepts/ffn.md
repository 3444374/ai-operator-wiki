---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: []
tags: [method]
aliases:
  - "Feed-Forward Network"
  - "前馈网络算子"
generation_complete: true
---


# FFN

## 定义
FFN（Feed-Forward Network）是 Transformer 架构中的核心算子之一，位于 LLM 推理的 Request Processing 层，与 [[concepts/attention|Attention]] 和 [[concepts/token-sampler|Token Sampler]] 并列。FFN 层通常由两个线性变换和一个非线性激活函数组成，负责对注意力输出进行逐 token 的特征变换。在 LLM 中，FFN 参数规模极大（例如 Llama‑3‑70B 中约占模型总参数的 2/3），因此其计算是推理延迟的重要组成部分，也是量化、kernel 融合等优化的重点目标。

## 关键特征
- 结构简洁：两个全连接层夹一个非线性激活函数（通常为 GELU 或 SiLU）
- 参数量庞大：在大型模型中 FFN 权重矩阵可占总参数量的三分之二以上
- 计算密集：逐 token 的矩阵乘法，是推理延迟的主要来源之一
- 优化敏感：对 weight quantization、activation quantization 以及 CUDA kernel fusion 极为友好，量化后可以显著降低计算开销
- 位置无关但 token 独立：每个 token 的 FFN 计算完全相同且可并行，适合批处理

## 应用
- LLM 推理系统：在 [[concepts/database-perspective-on-llm-inference|数据库视角下的LLM推理]] 中，FFN 作为请求处理的关键阶段，直接影响 [[concepts/tbt|TBT]] 和吞吐
- 量化推理：通过 INT8/INT4 权重量化和激活量化大幅减少 FFN 的计算量和内存占用
- Kernel 优化：将 FFN 内部的矩阵乘法和激活函数融合为单个 CUDA kernel，降低访存开销
- 分布式推理：在多 GPU 场景下，FFN 的权重可以切片（tensor parallelism）或流水线并行

## 相关概念
- [[concepts/attention|Attention]]
- [[concepts/token-sampler|Token Sampler]]
- [[concepts/quantization|Quantization]]
- [[concepts/request-batching|Request Batching]]
- [[concepts/ttft|TTFT]]
- [[concepts/tbt|TBT]]

## 相关实体
- [[entities/vllm|vLLM]]（提供了高效的 FFN 算子融合实现）
- [[entities/turbotransformers|TurboTransformers]]（专注于 Transformer 算子的高性能优化）
- [[entities/bytetransformer|ByteTransformer]]（对 FFN 等算子进行了量化优化）
- [[entities/llama-3-3-70b|Llama 3.3 70B]]（FFN 参数量占比极大的典型模型）

## 来源提及

- "Request Processing 层分为 Operator Design——即 Attention、FFN 和 Token Sampler 这三个核心算子的实现与优化。" — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/db_perspective_llm_pvldb2025_300968]]"]
tags: [method]
aliases:
  - "Flash Attention"
  - "FA"
generation_complete: true
---


# FlashAttention

## 定义
FlashAttention 是一种 IO‑aware 的精确注意力（exact attention）计算算法，通过分块（tiling）和重计算（recomputation）技术，最小化高带宽内存（HBM）的读写次数，从而显著加速 Transformer 模型中注意力层的训练与推理。

## 关键特征
- **IO‑aware 设计**：根据 GPU 内存层次结构优化数据搬运，减少 HBM 和 SRAM 之间的数据交换
- **分块计算（Tiling）**：将注意力矩阵分块，在快速内存（SRAM）中逐块计算 softmax，避免将完整注意力矩阵写入 HBM
- **重计算（Recomputation）**：反向传播时不保存中间结果，而是重新计算所需的值，从而节省内存带宽
- **精确注意力**：与原始注意力公式数学等价，不引入近似误差
- **训练与推理兼顾**：既加速前向传播，也通过高效的梯度重计算加速反向传播

## 应用
- **大语言模型（LLM）训练**：在 GPT、Llama、BERT 等 Transformer 模型训练中，FlashAttention 可将注意力层计算加速 2‑4 倍，并支持更长的上下文窗口
- **长序列推理**：在长文档摘要、多轮对话等需要处理长上下文的推理场景中，大幅降低延迟和显存占用
- **主流框架集成**：已被 PyTorch、TensorFlow、JAX 等框架原生支持，以及 vLLM、TGI 等推理系统中作为核心 kernel 优化
- **分布式扩展**：与 FlashDecoding、Ring Attention 等技术配合，进一步支撑超大规模序列的高效处理

## 相关概念
- [[concepts/flashdecoding|FlashDecoding]]
- [[concepts/ring-attention|Ring Attention]]
- [[concepts/attention-mechanism|Attention Mechanism]]

## 相关实体
<!-- 无直接相关实体 -->

## 来源提及

- "C1[Kernels FlashAttention / FlashDecoding / Ring Attention]" (C1[内核：FlashAttention / FlashDecoding / Ring Attention]) — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
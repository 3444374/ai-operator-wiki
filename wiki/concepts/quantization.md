---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/db_perspective_llm_pvldb2025_300968]]"]
tags: [method]
aliases:
  - "量化"
  - "Model Quantization"
generation_complete: true
---


# Quantization

## 定义
量化（Quantization）是一种模型压缩方法，通过将神经网络中的浮点参数（weight）和激活值（activation）映射到更低比特的整数表示（如 INT8、INT4），从而大幅减小模型体积、降低推理时的内存占用和计算开销。

## 关键特征
- **精度降低但可接受**：在损失少量模型精度的情况下，换取数倍存储和计算效率的提升。
- **多粒度应用**：可应用于权重量化（weight quantization）、激活量化（activation quantization）以及键值缓存量化（[[concepts/kv-cache|KV Cache]] quantization）。
- **硬件友好**：整数运算在现代处理器（CPU/GPU/NPU）上通常比浮点运算更快，且功耗更低。
- **多种策略**：包括训练后量化（PTQ）、量化感知训练（QAT）、动态量化、静态量化等，适应不同部署场景。

## 应用
- **大语言模型推理**：在显存受限的设备上部署 LLM 时，通过将参数和 [[concepts/kv-cache|KV Cache]] 量化为 INT8/INT4，可成倍降低显存占用，结合 [[concepts/pagedattention|PagedAttention]] 等内存管理技术，进一步缓解显存瓶颈。
- **云端与边缘推理**：在 Serverless 推理系统（如 [[entities/deepflow|DeepFlow]]、[[entities/serverlessllm|ServerlessLLM]]）中，量化可压缩模型传输大小和运行时内存，提高资源利用率和启动速度。
- **数据库内模型加速**：在 [[entities/neurdb|NeurDB]] 等 AI‑native 数据库或 [[entities/gaussml|GaussML]] 引擎中，量化有助于在有限的数据库资源内高效执行 ML 推理。

## 相关概念
- [[concepts/kv-cache|KV Cache]]
- [[concepts/pagedattention|PagedAttention]]

## 相关实体
（暂无直接关联实体）

## 来源提及

- "D3[Quantization<br/>Weight / Activation / KV Cache Quantization]" (D3[量化：权重 / 激活值 / KV缓存量化]) — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
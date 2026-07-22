---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/cortex_aisql_sigmod2026_c18b08]]"]
tags: [method]
aliases:
  - "动态批处理"
  - "Continuous Batching"
generation_complete: true
---


# Continuous batching

## 定义
Continuous batching 是一种 LLM 推理服务调度方法，允许在模型处理一个批次的过程中动态地添加新的请求或移除已完成的请求，突破传统静态批处理一旦开始便不可变更的限制。该技术通过最大化 GPU 计算单元的利用率，使每次推理的边际成本随批次内请求数量增加而递减，而非线性增长，是现代高效推理框架（如 vLLM）的核心能力。

## 关键特征
- **动态请求插入与归还**：批次在处理中可随时接纳新请求、释放已完成请求，无需等待整个批次结束
- **打破固定批次约束**：与传统静态批处理不同，Continuous batching 不要求预测或固定批次大小，避免由于批次填充等待造成的算力闲置
- **GPU 利用率显著提升**：持续地保持较饱和的请求负载，有效减少 GPU 空闲时间
- **边际成本递减效应**：随着并发请求增多，单次推理的边际成本近似恒定甚至下降，这与逐行线性成本模型（如 $C_{\text{op}}(n) = n \times c_{\text{model}} + \alpha$）形成对比

## 应用
- **大语言模型推理服务**：vLLM、Sarathi-Serve 等框架通过 `continuous batching` 实现高吞吐、低延迟的在线推理
- **成本模型分析**：在 [[entities/cortex-aisql|Cortex AISQL]] 等数据库内 AI 系统的成本分析中，其默认线性假设忽略了 continuous batching 带来的成本递减，导致与外部推理方案的效率比较出现结构性偏差
- **数据库原生 AI 负载优化**：结合 [[concepts/streaming-batch-model|流式批处理模型]]，可指导数据库内推理任务如何选择批次策略

## 相关概念
- [[concepts/streaming-batch-model|流式批处理模型]] — 刻画推理负载的调度模式，Continuous batching 是其优化核心
- [[concepts/llm-inference-cost-model|LLM inference cost model]] — 量化推理成本，通常需纳入 batching 效应
- [[concepts/internal-model-serving|Internal model serving]] — 数据库内部模型服务时，batching 能力直接影响性能

## 相关实体
- [[entities/vllm|vllm]] — 率先实现极高效率 continuous batching 的现代 LLM 推理服务系统
- [[entities/cortex-aisql|cortex-aisql]] — 其内置成本模型假设逐行线性开销，未反应 continuous batching 的边际递减特征
- [[entities/sarathi-serve|sarathi-serve]] — 同样采用 continuous batching 以优化多模型服务

## Mentions in Source
- “The cost model of Cortex AISQL assumes a per-row linear cost $C_{\text{op}}(n) = n \times c_{\text{model}} + \alpha$, disregarding the diminishing marginal cost effect of continuous batching.” —— [[sources/cortex_aisql_sigmod2026_c18b08|Cortex AISQL 论文]]

## 来源提及

- "vLLM continuous batching 下，batching 的边际成本递减——100 行一起推理的成本远小于 100 × 单行成本。" (vLLM 的 continuous batching 下，批处理边际成本递减——100 行一起推理的成本远小于 100 × 单行成本。) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
- "Cortex AISQL 不做 batching 优化，这是与你的课题的关键差异。" (Cortex AISQL 不做 batching 优化，这是与你的课题的关键差异。) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
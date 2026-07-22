---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources:
  - "[[sources/cortex_aisql_sigmod2026_c18b08]]"
tags:
  - "method"
aliases:
  - "自适应模型级联"
  - "Adaptive Model Cascading"
generation_complete: true
---

# Adaptive model cascading

## 定义
一种降低 AI 推理成本的技术：以轻量级小模型（proxy）处理大多数输入行，仅在 proxy 置信度不足时才调用高精度大模型（oracle）进行判断。通过基于重要性采样的双阈值路由策略动态学习决策边界，将每一行自动划入接受区、不确定区或拒绝区，从而在显著提升推理速度的同时保持接近 oracle 的质量水平。在 NQ 数据集上，该方法实现了 5.85× 加速，F1 接近 oracle，平均节省 65.5% 执行时间；整体可提供 2‑6× 加速，保持 90‑95% 的质量。

## 关键特征
- 双阈值路由：设定接受阈值与拒绝阈值，将输入划分为“接受”（proxy直接输出）、“不确定”（交给oracle）、“拒绝”（直接删除）三个区域
- 基于重要性采样的决策边界学习：利用重要性采样动态调整阈值，使加速‑质量权衡达到最优
- 小模型代理 + 大模型 oracle 的架构：适合批量/流式数据处理，降低大模型调用频率
- 可伸缩的性能提升：不同配置下可提供 2‑6× 推理加速，同时保持 90‑95% 的质量
- 与数据流水线无缝集成：可嵌入到 AI SQL 操作等结构化数据处理场景

## 应用
- 大语言模型在数据仓库中的低成本推理，如 AI‑assisted SQL 回答
- 大规模文本/结构化数据的批量分析与分类
- 对延迟敏感、需高吞吐的 AI 推理服务
- 在成本和质量之间寻求平衡的混合推理架构

## 相关概念
- [[concepts/importance-sampling-routing|Importance sampling routing]]（基于重要性采样的路由策略）
- [[concepts/ai-sql-operators|AI SQL operators]]（将 AI 模型封装为 SQL 算子的方法）
- [[moc/设计方法论|设计方法论]]（系统性地降低推理成本的工程实践）
- [[moc/实验设计|实验设计]]（验证加速比与质量保持的实验框架）

## 相关实体
- [[entities/llama-3-1-8b|Llama 3.1-8B]] —— 作为轻量 proxy 模型
- [[entities/llama-3-3-70b|Llama 3.3-70B]] —— 作为高精度 oracle 模型
- [[entities/nq-dataset|NQ dataset]] —— 用于评估加速与质量保持的数据集
- [[entities/cortex-aisql|Cortex AISQL]] —— 部署该方法的数据仓库 AI 推理平台
- [[entities/sigmod-2026|ACM SIGMOD 2026]] —— 该方法首次披露的学术会议

## 来源提及

- "小模型（如 Llama 3.1-8B）作为 proxy，处理大部分行；大模型（如 Llama 3.3-70B）作为 oracle，仅处理 proxy 不确定的行" (小模型（如 Llama 3.1-8B）作为代理，处理大部分行；大模型（如 Llama 3.3-70B）作为预言机，仅处理代理不确定的行。) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
- "使用重要性采样在运行时学习双阈值路由策略，将行划分到接受区、不确定区和拒绝区" (使用重要性采样在运行时学习双阈值路由策略，将行划分到接受区、不确定区和拒绝区。) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
- "自适应模型级联（2-6× 加速，90-95% 质量保持）" (自适应模型级联（2-6× 加速，90-95% 质量保持）) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
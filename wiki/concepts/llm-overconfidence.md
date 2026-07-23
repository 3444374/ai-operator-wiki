---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: []
tags: [phenomenon]
aliases:
  - "LLM过度自信"
  - "Overconfidence in LLM confidence estimation"
  - "LLM overconfidence"
generation_complete: true
---


# LLM overconfidence

## 定义
LLM overconfidence（大型语言模型过度自信）是指大型语言模型对其生成结果所估计的置信度系统性地高于实际正确率的现象，即置信度估计与真实性能之间出现显著偏差。在[[entities/galois|Galois]]等置信度驱动优化的系统中，这种过度自信可能导致实际低质量的条件（或结果）被错误地赋予高置信度，进而被提前推入LLM扫描阶段，最终降低查询的精度和召回率。Galois 通过引入置信度阈值 τ 并利用独立校准数据集[[entities/geo-test|Geo-Test]]来缓解该问题，但阈值的泛化性受限于具体的模型和领域。

## 关键特征
- **置信度校准偏差**：模型输出的概率或置信度分数普遍高于实际的准确率，形成“过于乐观”的估计。
- **系统级影响**：在基于LLM的查询存储与优化流水线中，过度自信会破坏基于置信度的剪枝与调度策略，导致劣质候选被保留或优先处理。
- **依赖阈值与校准**：典型缓解方案依赖置信度阈值 τ 与外部校准数据（如[[entities/geo-test|Geo-Test]]）进行后验校正，但阈值通常不具备跨模型、跨领域的通用性。
- **模型与领域局限性**：不同LLM（如[[entities/gpt-4o-mini|GPT-4o mini]]、[[entities/llama-3-1-70b|Llama 3.1 70B]]）的过度自信程度不同，且在不同知识领域表现有异，是 LLM 作为查询存储层的一个关键局限。

## 应用
- **置信度驱动查询优化**：在[[entities/galois|Galois]]等系统中，过度自信分析被用于设计校准策略，以防止低质量条件进入LLM扫描阶段，从而提升端到端查询质量。
- **LLM 知识提取管道**：在基于LLM的关系抽取、语义理解等任务中，通过监测并校正过度自信，过滤掉高置信度但低质量的输出，保障知识库的纯度。
- **数据库与 LLM 集成系统**：为[[concepts/confidence-based-optimization-for-llm-queries|Confidence-based optimization for LLM queries]]提供设计警告，要求在 DB4AI 架构中内建置信度校准机制。

## 相关概念
- [[concepts/confidence-based-optimization-for-llm-queries|Confidence-based optimization for LLM queries]]
- [[concepts/confidence-threshold-tau|Confidence threshold τ]]
- [[concepts/popularity-bias-in-llm-knowledge-extraction|Popularity bias in LLM knowledge extraction]]

## 相关实体
- [[entities/galois|Galois]]
- [[entities/geo-test|Geo-Test]]

## 来源提及

- "反例 / 边界：LLM 已知有过度自信问题（overconfidence）。论文用阈值 τ 来缓解，但 τ 的校准需要额外的 golden dataset（GEO-Test），且只对模型固定时才有效。" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
- "假设 2：LLM 自身对查询条件的置信度估计是可靠的 — 反例 / 边界：LLM 已知有过度自信问题（overconfidence）。" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
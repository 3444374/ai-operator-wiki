---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources:
  - "[[sources/galois_sigmod2025_c4af88]]"
tags:
  - "method"
aliases:
  - "LLMScan logical operator"
  - "LLMScan 逻辑算子"
  - "LLMScan"
  - "Filter-LLMScan"
generation_complete: true
---

# LLMScan operator

## 定义
LLMScan 是 [[entities/galois|Galois]] 系统中定义的核心逻辑算子，负责与大语言模型（LLM）交互以获取结构化数据。该算子支持三种条件下推策略：无下推、单条件下推和全条件下推。不同策略下的变体统称为 **Filter-LLMScan**。其他关系代数算子（选择、投影、连接、聚合）均在内存中对 LLMScan 返回的结果执行，不再重复调用 LLM。LLMScan 的设计将 LLM 抽象为一种存储层，是实现“[[concepts/llm-as-storage|LLM as Storage]]”范式的基础。

## 关键特征
- **LLM 抽象层**：屏蔽底层模型调用细节，将 LLM 视为可查询的数据源
- **三种条件下推策略**：
  - 无下推：过滤在内存中执行
  - 单条件下推：将对单一属性的过滤条件下推到 LLM 调用中
  - 全条件下推：将尽可能多的过滤条件下推到 LLM 侧，形成 Filter-LLMScan
- **成本优化**：通过下推减少无效数据的传输，平衡精度与 LLM 调用开销
- **算子隔离**：选择、投影、连接、聚合等传统关系代数算子不再触发 LLM 调用，降低整体延迟
- **物理算子映射**：可与 [[concepts/table-scan|Table-Scan]]、[[concepts/key-scan|Key-Scan]] 等物理算子配合实现物理执行计划

## 应用
在 Galois 查询引擎中，LLMScan 用于从非结构化文本中提取结构化字段（例如从电影简介中提取导演名、从文档中提取实体属性）。提取后的结构化数据可继续由传统 SQL 算子处理，支持融合语义理解与关系运算的复杂查询。通过搭配 [[concepts/confidence-based-optimization-for-llm-queries|Confidence-based optimization for LLM queries]]，系统还能根据置信度动态调整下推策略，进一步提升查询效率与答案质量。

## 相关概念
- [[concepts/table-scan|Table-Scan]]
- [[concepts/key-scan|Key-Scan]]
- [[concepts/confidence-based-optimization-for-llm-queries|Confidence-based optimization for LLM queries]]
- [[concepts/llm-as-storage|LLM as Storage]]

## 相关实体
- [[entities/galois|Galois]]

## 来源提及

- "LLMScan 逻辑算子族：LLMScan（无条件数据获取）和 Filter-LLMScan（带条件下推的数据获取）。LLMScan 是唯一与 LLM 交互的算子，其他算子（Selection/Projection/Join/Agg）在内存中执行，不涉及 LLM。" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
- "LLMScan（无条件数据获取）和 Filter-LLMScan（带条件下推的数据获取）" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
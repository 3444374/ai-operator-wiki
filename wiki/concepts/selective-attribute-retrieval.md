---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/galois_sigmod2025_c4af88]]"]
tags: [method]
aliases:
  - "Selective Attribute Extraction"
  - "选择性属性检索"
generation_complete: true
---


# Selective Attribute Retrieval

## 定义
选择性属性检索（Selective Attribute Retrieval）是 [[entities/galois|Galois]] 语义查询系统中采用的一种 **token 消耗优化技术**。其核心思想是：在执行含有 LLM 语义算子的 SQL 查询时，系统自动解析 `SELECT` 子句，识别出查询实际需要返回的属性（列），并仅将这些必需的属性发送给大语言模型进行处理，而非默认传递整个表或中间结果的全部列。该技术通过精确控制传递给大语言模型的信息量，减少无关数据的传输和处理开销，从而显著降低 API 调用成本和延迟。

## 关键特征
- **查询感知的属性剪枝**：根据 `SELECT` 子句在查询编译阶段推断 LLM 算子必须输出的列集合，提前过滤掉不需要的列
- **与 LLMScan 操作符协同**：该技术直接集成在 [[concepts/llmscan-operator|LLMScan operator]] 的物理执行计划中，在扫描阶段即按需生成所需的属性值
- **零额外语义开销**：属性筛选完全基于查询语法，不依赖数据内容的语义推理，因此不会引入新的 LLM 调用或复杂度
- **透明的成本优化**：对用户和上层应用透明，在生成执行计划时自动应用，无需手动干预
- **可叠加于其他去重技术**：如选择性去重（selective deduplication）等，进一步降低整体 token 消耗

## 应用
- **语义查询中的列级选择性输出**：在 [[entities/galois|Galois]] 处理混合 SQL 和语义算子的查询时，对 `LLMScan` 算子应用选择性属性检索，使 LLM 只输出 `SELECT` 列表中的列。例如查询 `SELECT title, sentiment FROM movies WHERE genre='comedy'`，`LLMScan` 只需让 LLM 生成电影的 `title` 和 `sentiment`，而不返回全表情所需的 `year`、`director` 等无关属性
- **节省 API 计费 token**：通过减少每次 LLM 调用中输出 token 的数量，直接降低使用外部大语言模型 API（如 GPT-4、Llama 系列）时的费用，尤其在大规模数据集上效果显著
- **加速语义分析流水线**：在批量处理语义数据的 ETL 或推理任务中，该技术可减少网络传输和模型处理的数据量，提升整体吞吐量

## 相关概念
- [[concepts/llmscan-operator|LLMScan operator]]
- [[concepts/selective-deduplication|Selective Deduplication]]

## 相关实体
- [[entities/galois|Galois]]

## 来源提及

- "选择性属性检索：分析查询的 SELECT 子句，只让 LLM 输出相关属性而非全表，减少 token 消耗。" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
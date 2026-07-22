---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/cortex_aisql_sigmod2026_c18b08]]"]
tags: [term]
aliases:
  - "UDF 嵌入 AI 函数"
  - "AI as UDF"
generation_complete: true
---


# AI 函数作为 UDF

## 定义
**AI 函数作为 UDF**（AI as a User‑Defined Function）是一种将 AI 模型（如 LLM）包装为普通 SQL 用户定义函数、通过 `SELECT ai_fn(...)` 形式直接嵌入查询的集成方式。虽然写法直观，但 Cortex AISQL 论文指出这种方案会让查询优化器完全看不见 AI 算子的真实代价，导致**查询计划质量灾难性下降**。因此，AI 函数作为 UDF 被视为一种反模式，突显了在数据库内核中把 AI 算子提升为一等公民、并配合专用代价模型的必要性。

## 关键特征
- **透明但危险**：语法与普通标量函数无异，开发者容易上手，但优化器无法区分昂贵 AI 调用和低廉的数值计算。  
- **优化器盲区**：传统成本模型只统计 CPU/IO 耗时，不理解 LLM 推理的金钱成本、延迟与吞吐瓶颈，无法正确排序算子或选择连接顺序。  
- **计划退化**：由于 UDF 被当作“黑盒”，优化器可能将高成本的 AI 算子放在扫描深树上重复执行，导致执行时间膨胀数倍。  
- **缺乏语义信息**：UDF 不暴露 AI 算子的谓词选择性、输入规模敏感性等语义属性，阻断了谓词下推、过滤重排等优化机会。  
- **推动原生 AI 算子设计**：正是该模式的缺陷促使数据库系统（如 Cortex AISQL）将 AI 算子从 UDF 中解放，设计 [[concepts/ai-sql-operators|六大 AI SQL 算子]] 并引入 [[concepts/ai-aware-query-optimization|AI 感知查询优化]]。

## 应用
- **反面教材**：在数据库扩展 AI 能力时，向开发者说明直接使用 UDF 封装 AI 调用的风险，避免生产环境中性能失控。  
- **设计驱动力**：作为对比基线，证明原生的 AI SQL 算子（如 [[concepts/ai_join|ai_join]]、[[concepts/ai_filter|ai_filter]]）必须在查询编译器层获得特殊优待，不能简单复用传统 UDF 框架。  
- **代价模型验证**：通过对比 UDF 方式与原生 AI 算子执行计划的性能差异，量化 [[concepts/llm-inference-cost-model|代价模型]] 的收益，展示优化器知晓 AI 成本后的计划选择优势。

## 相关概念
- [[concepts/查询计划|查询计划]]
- [[concepts/llm-inference-cost-model|代价模型]]
- [[concepts/ai-aware-query-optimization|AI感知查询优化]]
- [[concepts/ai-sql-operators|六大 AI SQL 算子]]
- [[concepts/ai_filter|ai_filter]]
- [[concepts/ai_join|ai_join]]

## 相关实体
（无直接关联实体）

## 来源提及

- "简单地把 AI 函数作为 UDF 嵌入 SQL，会导致查询计划质量灾难性下降。" (简单地把 AI 函数作为 UDF 嵌入 SQL，会导致查询计划质量灾难性下降。) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
- "将六类 AI 算子（EMBED/COMPLETE/FILTER/CLASSIFY/JOIN/AGG）作为 SQL 执行引擎一等公民" (将六类 AI 算子（EMBED/COMPLETE/FILTER/CLASSIFY/JOIN/AGG）作为 SQL 执行引擎一等公民) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
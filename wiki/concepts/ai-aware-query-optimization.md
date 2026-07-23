---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources:
  - "[[sources/cortex_aisql_sigmod2026_c18b08]]"
  - "[[sources/gaussml_icde2024_577060]]"
tags:
  - "method"
aliases:
  - "AI 感知查询优化"
  - "AI-aware optimization"
  - "AI感知查询优化"
  - "ML 感知优化器"
  - "ML感知优化器"
generation_complete: true
---

## 相关概念
- [[concepts/llm-inference-cost-model|LLM 推理代价模型]]
- [[concepts/predicate-pull-up|谓词上拉]]
- [[concepts/ai_filter|AI 语义过滤算子]]
- [[concepts/adaptive-model-cascading|自适应模型级联]]
- [[concepts/semantic-join-rewrite|语义 Join 重写]]
- [[concepts/ai-sql-operators|AI SQL 算子]]
- [[concepts/ml-as-udf|ML 用户定义函数]]
- [[concepts/原生-sql-算子集成|原生 SQL 算子集成]]
- [[concepts/查询计划|查询计划]]
- [[concepts/db4ai|DB4AI]]

## 相关实体
- [[entities/gaussml|GaussML 系统]]
- [[entities/cortex-aisql|Cortex AISQL]]
- [[entities/snowflake|Snowflake]]
- [[entities/opengauss|openGauss]]

## 关键特征
- **AI/ML 算子代价精确建模**：为 LLM 调用或梯度下降等迭代器建立与数据规模、特征维度联动的专用代价函数，突破传统 UDF 处理中只能使用黑盒常数代价的局限。
- **谓词上拉与操作下推**：面向 LLM 的谓词上拉（Cortex AISQL）和面向 ML 的筛选操作下推（GaussML），两者均通过优化算子执行顺序，优先使用轻量的结构化过滤缩减数据量，大幅降低下游 AI/ML 算子的开销。
- **联合代价最优**：在 CPU/IO 开销与 AI/ML 推理成本之间寻求全局最优，避免将 AI 算子视为黑盒或游离于优化器决策之外的孤岛。
- **硬件感知加速**：集成 SIMD 加速决策，为不同算子选取最优的硬件执行路径，进一步提升端到端性能。
- **数倍性能提升**：Cortex AISQL 在 Join 场景中将模型调用次数从约 110,000 次降至 330 次（缩减约 300 倍），查询整体加速 2–8 倍；GaussML 相较 Apache MADlib 实现 2–6 倍的性能优势。

## 应用
- **SQL+ML 联合查询**：在数据库内完成模型训练和推理的场景中，优化器主动判断是先过滤再训练还是先计算再裁剪，避免无效的数据扫描和训练迭代。
- **混合查询与多模态分析**：适用于同时包含传统 SQL 过滤与 LLM 语义操作（如文档检索、检索增强生成即 RAG）的查询，保证 AI 增强分析的可控成本。
- **大规模数据湖分析**：在海量非结构化或半结构化数据上，通过“先结构化过滤、后模型推理”的执行范式，使 AI 驱动的大规模分析在经济上可行。

## 定义
AI 感知查询优化是一种以大型语言模型（Large Language Model, LLM）推理成本为首要优化目标的查询优化技术。它通过显式代价模型 `C_op (n) = n × c_model + α` 量化 AI 算子的开销，并将该成本与传统 CPU/IO 代价统一纳入优化器决策。优化器能够主动将昂贵的 AI 谓词上拉到连接（Join）操作之后执行，优先利用结构化过滤缩减数据集，从而极大降低模型调用次数并整体加速查询。


## 来源提及

- "将 LLM 推理成本作为一阶优化目标。代价模型：C_op(n) = n × c_model + α（每行 GPU 成本 + 固定开销）" (将 LLM 推理成本作为一阶优化目标。代价模型：C_op(n) = n × c_model + α（每行 GPU 成本 + 固定开销）。) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
- "优化器在 w1·C_LLM + w2·C_CPUIO 联合代价下选择最优计划" (优化器在 w1·C_LLM + w2·C_CPUIO 联合代价下选择最优计划。) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
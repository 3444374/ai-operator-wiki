---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/cortex_aisql_sigmod2026_c18b08]]"]
tags: [method]
aliases:
  - "谓词上拉"
  - "Predicate Pull-Up"
  - "Predicate Pull Up"
generation_complete: true
---


# Predicate pull-up

## 定义
谓词上拉（Predicate pull-up）是一种用于**AI感知查询优化**的查询重写技术。它将计算昂贵的 AI 谓词（如 `AI_FILTER`、`AI_CLASSIFY`）从扫描侧的叶节点**向上提升**到连接操作（Join）之上执行。该技术的核心策略是：先用廉价、高选择性的传统过滤条件（例如日期范围、精确匹配）大幅缩小数据集规模，然后再将缩减后的数据送入昂贵的 AI 算子，从而**最小化 LLM 调用次数**，实现查询的显著加速。谓词上拉是 Snowflake Cortex AISQL 取得约 300 倍性能改进的核心手段。

## 关键特征
- **算子位置改变**：将 AI 谓词的执行顺序从叶子节点的扫描侧移向连接之上，重新编排逻辑计划。
- **数据量锐减**：在 AI 推理之前先用传统过滤条件进行“粗筛”，大幅减少后续 AI 算子要处理的行数。
- **成本敏感**：基于[[concepts/llm-inference-cost-model|LLM inference cost model]]提供的代价信息，判断上拉是否收益大于额外数据移动的开销，避免盲目应用。
- **与谓词下推的权衡**：传统查询优化倾向将谓词下推到数据源附近以减少 IO，但对于昂贵的 AI 谓词，上拉可能更有利，因为节省的推理成本远超可能略增的数据传输开销。
- **平台依赖**：该技术通常由 AI‑aware 优化器自动决策，不要求用户手动干预。

## 应用
- **Cortex AISQL 混合查询**：在包含 `AI_FILTER`、`AI_CLASSIFY` 等算子的 SQL 语句中，优化器自动识别机会并执行谓词上拉。例如，在大规模文档扫描中先执行普通的关键词 `WHERE` 子句，再对命中行调用 `AI_FILTER` 进行语义判断。
- **多阶段过滤管道**：与[[concepts/semantic-join-rewrite|semantic-join-rewrite]]、[[concepts/adaptive-model-cascading|adaptive-model-cascading]]等技术组合，形成从轻量级到重量级的级联过滤体系。
- **降低 API 成本**：在调用外部 LLM API 的查询场景中，通过先本地过滤再调用远端服务，大幅降低账单和延迟。

## 相关概念
- [[concepts/ai_filter|ai_filter]]
- [[concepts/ai-aware-query-optimization|AI-aware query optimization]]
- [[concepts/llm-inference-cost-model|LLM inference cost model]]
- [[concepts/semantic-join-rewrite|semantic-join-rewrite]]
- [[concepts/adaptive-model-cascading|adaptive-model-cascading]]

## 相关实体
- [[entities/cortex-aisql|cortex-aisql]]

## 来源提及

- "必要时将昂贵 AI 谓词上拉到 Join 之后，先用传统结构化过滤缩小数据集" (必要时将昂贵的 AI 谓词上拉到连接之后，先用传统结构化过滤缩小数据集。) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
- "AI 感知优化后将 AI 谓词上拉到 Join 后，仅需 330 次调用——~300× 改进" (AI 感知优化后将 AI 谓词上拉到连接后，仅需 330 次调用——约 300 倍改进。) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources:
  - "[[sources/cortex_aisql_sigmod2026_c18b08]]"
tags:
  - "method"
aliases:
  - "语义 Join 重写"
  - "Semantic Join Rewrite"
  - "语义连接重写"
  - "Multi-label classification rewrite"
  - "语义Join重写"
generation_complete: true
---

## 相关概念
- [[concepts/ai_join|ai_join]]
- [[concepts/ai_classify|ai_classify]]
- [[concepts/ai_filter|ai_filter]]
- [[concepts/ai-aware-query-optimization|ai-aware-query-optimization]]
- [[concepts/adaptive-model-cascading|adaptive-model-cascading]]
- [[concepts/ai-sql-operators|ai-sql-operators]]
- [[concepts/ai_embed|ai_embed]]

## 相关实体
- [[entities/cnn-数据集|cnn-数据集]]
- [[entities/cortex-aisql|cortex-aisql]]
- [[entities/sigmod-2026|sigmod-2026]]

## 定义
语义连接重写（Semantic join rewrite）是一种将 O(N×M) 复杂度的语义连接（AI_JOIN）转化为线性复杂度的多标签分类（AI_CLASSIFY）的查询优化技术。其核心思想是将右侧表的每一列视为一个独立的标签，从而将整个 AI_JOIN 操作重写为一组 AI_CLASSIFY 操作，彻底避免代价高昂的全交叉连接计算。

## 关键特征
- 复杂度降阶：将 AI_JOIN 的 O(N×M) 全交叉连接转化为 AI_CLASSIFY 的线性复杂度，消除了连接爆炸开销。
- 实现方式：对右侧表的每一列生成一个分类问题，AI 模型对左侧每一行输出是否匹配该列，不再需要显式生成和比较所有行对。
- 实际效果：在 CNN / Daily Mail 数据集上，重写后查询从 4.4 小时缩短至 3.8 分钟，加速比达 69.5×，F1 平均提升 44.7 个百分点。
- 整体收益：该技术作为 AI 感知查询优化的一部分，整体方法平均加速 30.7×，最高可达 70×。

## 应用
- AI 增强型数据库查询加速：在需要在非精确匹配条件下关联两个表时，自动将 AI_JOIN 改写为 AI_CLASSIFY，大幅降低大语言模型或嵌入模型的调用次数与计算量。
- 大规模语义检索与数据集成：在自然语言记录匹配、文档聚类、知识图谱构建等场景中，避免因全连接导致的不可承受开销。
- 自适应查询优化：与 [[concepts/adaptive-model-cascading|自适应模型级联]] 等技术结合，实现成本与精度的最佳平衡。

## 来源提及

- "将二次复杂度的语义 Join 重写为线性多标签分类——将右侧表的列作为标签，AI_JOIN 转换为 AI_CLASSIFY 操作" (将二次复杂度的语义连接重写为线性多标签分类——将右侧表的列作为标签，AI_JOIN 转换为 AI_CLASSIFY 操作。) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
- "CNN 数据集上从 4.4 小时降至 3.8 分钟（69.5×），F1 平均提升 44.7 个百分点" (在 CNN 数据集上从 4.4 小时降至 3.8 分钟（69.5 倍），F1 平均提升 44.7 个百分点。) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
- "语义 Join 重写（15-70× 加速）" (语义 Join 重写（15-70× 加速）) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
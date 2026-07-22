---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/gaussml_icde2024_577060]]"]
tags: [field]
aliases:
  - "传统机器学习"
  - "Classical ML"
generation_complete: true
---


# 传统 ML

## 定义
传统 ML（传统机器学习）指基于统计理论与数学模型的机器学习方法，覆盖分类、回归、聚类、降维等核心任务。其典型算法包括线性回归、决策树、支持向量机（SVM）、K‑Means、随机森林等，通常运行于 CPU，擅长处理结构化（表格型）数据。在 [[entities/gaussml|GaussML]] 系统中，传统 ML 算法可被原生集成到数据库查询引擎中，消除数据搬移开销；而本课题则以 GPU 加速的大语言模型（LLM）和嵌入模型为主要技术路线，两者面向不同数据模态（结构化 vs. 非结构化）与计算范式，并在库内 AI 应用中形成互补。

## 关键特征
- **统计建模内核**：依赖概率分布、损失函数优化与正则化等数学框架
- **结构化数据友好**：输入特征通常为数值型或类别型表格数据
- **CPU 高效执行**：多数算法无需 GPU 加速，适合大规模数据仓库环境
- **可解释性较强**：模型参数与特征权重相对透明（如线性模型系数、树结构）
- **数据库原生集成**：可通过 [[concepts/ml-as-udf|ML-as-UDF]] 或 [[concepts/原生-sql-算子集成|原生 SQL 算子集成]] 直接在 SQL 内调用，减少数据搬移
- **算法谱系成熟**：涵盖监督学习、无监督学习、半监督学习等多个子领域

## 应用
- **数据库内预测分析**：在 [[entities/gaussml|GaussML]] 中直接对表数据执行评分、分类、回归，无需 ETL 搬运
- **特征工程与模型训练**：利用 [[entities/apache-madlib|Apache MADlib]] 等库在数据库内部训练并部署模型
- **与 LLM 协同**：传统 ML 处理结构化特征，LLM 理解文本/语义，两者在 [[concepts/db4ai|DB4AI]] 场景中互补，如用传统模型进行数值预测，用大模型完成摘要或语义连接
- **低延时决策**：轻量级传统模型可作为 [[concepts/小模型|小模型]] 嵌入查询优化或路由策略，降低高昂的 LLM 调用成本

## 相关概念
- [[concepts/ml-as-udf|ML-as-UDF]] — 将 ML 模型封装为用户自定义函数，在 SQL 中调用
- [[concepts/原生-sql-算子集成|原生 SQL 算子集成]] — 把 ML 算子实现为数据库内核的代数算子
- [[concepts/db4ai|DB4AI]] — 数据库与 AI 深度融合的总体技术理念
- [[concepts/外部执行链路|外部执行链路]] — 数据库触发外部 GPU 推理与写回的流水线，与传统 ML 的库内计算相对照
- [[concepts/小模型|小模型]] — 与传统 ML 模型概念交叠，可作为低成本的代理模型

## 相关实体
- [[entities/gaussml|GaussML]]
- [[entities/apache-madlib|Apache MADlib]]

## 来源提及

- "模型类型：传统 ML（分类、回归等）" (模型类型：传统机器学习（分类、回归等）) — [[raw/papers/gaussml_icde2024|gaussml_icde2024]]
- "支持 20+ 常用 ML 算法" (支持 20+ 常用机器学习算法) — [[raw/papers/gaussml_icde2024|gaussml_icde2024]]
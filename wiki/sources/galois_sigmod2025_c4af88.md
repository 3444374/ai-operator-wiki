---
type: source
created: 2026-07-22
updated: 2026-07-22
source_file: "[[raw/papers/galois_sigmod2025.md]]"
tags: [deep-reading, paper/galois, db4ai, sigmod2025]
aliases: ["Galois (SIGMOD 2025)", "Galois Logical and Physical Optimizations"]
contentHash: 1a8b-bc2ca2d0
generation_complete: true
---

# Galois — Logical and Physical Optimizations for SQL over LLMs (SIGMOD 2025) - 摘要

## 来源
- Original file: [[raw/papers/galois_sigmod2025.md]]
- Ingested: 2026-07-22

## 核心内容
本论文提出了 **Galois**（[[entities/galois|Galois]]）系统，一个运行在 SQL 查询与大型语言模型之间的中间件。其核心思想是将 **LLM 视为存储层**（[[concepts/llm-as-storage|LLM as Storage]]），利用数据库的查询执行与优化框架高效抽取结构化知识。Galois 设计了两类专用算子：逻辑算子 **LLMScan**（[[concepts/llmscan-operator|LLMScan operator]]）及其带条件下推的变体 **Filter-LLMScan**（[[concepts/filter-llmscan|Filter-LLMScan]]），以及物理算子 **Table‑Scan**（[[concepts/table-scan-physical-operator|Table-Scan]]）和 **Key‑Scan**（[[concepts/key-scan-physical-operator|Key-Scan]]）。系统通过 **LLM 自身置信度估计**（[[concepts/confidence-based-optimization-for-llm-queries|Confidence-based optimization]]）动态选择下推策略与物理算子，在质量与成本之间取得平衡。实验覆盖 7 个数据集，在 **内部知识 (IK)**（[[concepts/internal-knowledge-ik|Internal knowledge]]）场景下，相比自然语言直接提问质量提升 144%，比直接 SQL 提示提升 29%，同时 token 消耗仅为无优化多步 baseline 的 1/11。该系统揭示了 **实体流行度偏差**（[[concepts/popularity-bias-in-llm-knowledge-extraction|Popularity bias]]）与 **LLM 过度自信**（[[concepts/llm-overconfidence|LLM overconfidence]]）等局限性。

## 关键实体
- [[entities/galois|Galois]] — 中间件系统，由 University of Basilicata 与 EURECOM 联合开发
- [[entities/university-of-basilicata|University of Basilicata]]、[[entities/eurecom|EURECOM]]
- [[entities/sigmod-2025|SIGMOD 2025]] — 顶级数据库会议
- [[entities/gpt-4o-mini|GPT‑4o mini]]、[[entities/llama-3-1-70b|LLaMA 3.1 70B]]、[[entities/together-ai|Together AI]] — 实验所用模型与平台
- [[entities/palimpzest|Palimpzest]]、[[entities/lotus|LOTUS]]、[[entities/tag|TAG]] — 对比或关联系统
- 实验数据集：[[entities/flight|Flight]]、[[entities/world-dataset|World]]、[[entities/scholar-dataset|Scholar]]、[[entities/movies-dataset|Movies]]、[[entities/presidents-dataset|Presidents]]、[[entities/premier-dataset|Premier]]、[[entities/fortune-dataset|Fortune]]，以及阈值校准集 [[entities/geo-test|Geo‑Test]]

## 关键概念
- [[concepts/llmscan-operator|LLMScan operator]] / [[concepts/filter-llmscan|Filter‑LLMScan]]
- [[concepts/table-scan-physical-operator|Table‑Scan]]、[[concepts/key-scan-physical-operator|Key‑Scan]] 物理算子
- [[concepts/confidence-based-optimization-for-llm-queries|Confidence‑based optimization for LLM queries]]
- [[concepts/llm-as-storage|LLM as Storage]]
- [[concepts/internal-knowledge-ik|Internal knowledge (IK)]]、[[concepts/model-provided-confidence-mc|Model‑provided confidence (MC)]]
- [[concepts/logical-optimization-for-llm-queries|Logical optimization for LLM queries]]、[[concepts/physical-optimization-for-llm-queries|Physical optimization for LLM queries]]
- [[concepts/avg-score|AVG‑Score]] 质量指标
- [[concepts/popularity-bias-in-llm-knowledge-extraction|Popularity bias in LLM knowledge extraction]]
- [[concepts/llm-overconfidence|LLM overconfidence]]
- [[concepts/selective-attribute-retrieval|Selective attribute retrieval]]
- [[concepts/iterative-data-extraction-from-llms|Iterative data extraction from LLMs]]
- [[concepts/db4ai|DB4AI]] — 研究领域定位

## 要点
- Galois 将 LLM 抽象为存储层，引入 LLM‑aware 的逻辑/物理优化，实现结构化提取质量与成本的兼顾
- 置信度驱动的算子选择在 75% 情况下选中最优计划，IK 场景下质量提升 144%，RAG 场景下 token 成本仅为对比系统的 1/11
- Key‑Scan 的分解式推理精度更高但成本更大，Table‑Scan 通过迭代提示在低成本下维持召回
- 实体流行度偏差和 LLM 过度自信是当前方法的主要局限，需通过额外校准和领域适配缓解
---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/galois_sigmod2025_c4af88]]"]
tags: [term]
aliases:
  - "LLM-as-Storage"
  - "LLM 作为存储层"
generation_complete: true
---


# LLM as Storage

## 定义
“LLM as Storage”是 Galois 论文提出的核心设计哲学，它将大语言模型（LLM）视为一种**存储系统**，模型的内部参数化知识被类比为数据库表中的数据。在这一视角下，系统通过 SQL 查询和专用算子（如 `LLMScan`）从 LLM 中检索结构化信息，而查询优化、执行与成本控制则由数据库引擎负责。这一哲学与“LLM 作为推理引擎”（LLM as Reasoner）形成对照，强调的是对外部数据的**存储与提取**而非推理。

## 关键特征
- 将 LLM 的参数化知识视作可查询的**数据层**，类比于关系数据库中的表
- 采用 **SQL** 作为查询接口，封装底层 LLM 的访问
- 使用专用的数据库算子（如 `[[concepts/llmscan-operator|LLMScan]]`）实现 LLM 的查询执行
- 数据库系统负责**查询优化**、资源调度和**成本控制**，而非将 LLM 调用作为黑盒
- 与“LLM 作为推理引擎”的设计范式形成直接对比，后者侧重链式推理而非结构化检索

## 应用
- **结构化信息提取**：在 Galois 等系统中，通过 SQL 查询从非结构化文档中提取实体、关系等结构化数据
- **数据库增强**：为传统数据库扩展 LLM 驱动的存储层，支持模糊匹配、语义检索等能力
- **成本可控的知识检索**：利用数据库优化器将 LLM 调用代价纳入查询计划，减少冗余调用
- **与 DB4AI 生态的整合**：作为数据库原生 AI 能力的一部分，支撑模型训练数据的动态供应

## 相关概念
- [[concepts/llmscan-operator|LLMScan operator]]：实现 LLM 作为存储层访问的数据库算子
- [[concepts/db4ai|DB4AI]]：数据库面向人工智能的整合范式，LLM as Storage 是其具体实践之一
- [[concepts/TAG|TAG]]：Table-Augmented Generation，与 LLM 作为存储的查询方式存在交集

## 相关实体
- [[entities/galois|Galois]]：提出并实现该哲学的系统，发表于 SIGMOD 2025
- [[entities/tag|TAG]]：同样探讨在数据库框架下使用 LLM 的系统

## 来源引用
> "We propose to treat the LLM as a storage system, where its parametrized knowledge is analogous to data in a database table."  
> — Galois: A Database System for Extracting Structured Knowledge from Unstructured Data, SIGMOD 2025

## 来源提及

- "应该用数据库管理系统来处理查询执行，而把 LLM 当作存储层——两者各司其职" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
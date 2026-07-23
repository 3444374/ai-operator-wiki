---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources:
  - "[[sources/gaussml_icde2024_577060]]"
  - "[[sources/galois_sigmod2025_c4af88]]"
tags:
  - "term"
aliases:
  - "Database for AI"
  - "库内AI"
generation_complete: true
---

## 相关概念
- [[concepts/外部执行链路|外部执行链路]]
- [[concepts/原生-sql-算子集成|原生 SQL 算子集成]]
- [[concepts/ai-aware-query-optimization|AI 感知查询优化]]
- [[concepts/llm-as-storage|LLM as Storage]]

## 相关实体
- [[entities/gaussml|GaussML]]
- [[entities/galois|Galois]]
- [[entities/cortex-aisql|Cortex AISQL]]
- [[entities/smart|Smart]]

## 定义
DB4AI（Database for AI，或称“把模型拉进数据库”）是一种数据库系统的设计范式，其核心理念是将机器学习、深度学习等 AI 能力深度融入数据库内核，从而大幅减少数据在数据库与外部 AI 平台之间的移动。该范式旨在降低端到端推理延迟、简化系统架构，并通过原生集成提升数据处理的效率与安全性。

## 关键特征
- AI 能力（ML/DL）作为数据库内核的一等公民，而非通过外部调用实现
- 数据无需离开数据库即可完成模型推理与训练，避免数据搬迁开销
- 依赖原生 SQL 算子集成、ML 感知优化器以及硬件加速（如 SIMD）等手段实现紧耦合
- 相较于“外部执行链路”路线，DB4AI 具备低延迟、强一致性与高安全性优势，但计算资源受限于数据库内部环境
- 典型实现如 [[entities/gaussml|GaussML]]，通过将 ML 算子嵌入查询引擎、利用 AI 感知优化器与 SIMD 加速完成范式落地
- DB4AI 路线也包括将大语言模型（LLM）作为数据源的分支，[[entities/galois|Galois]] 是该分支的最新代表，与 [[entities/gaussml|GaussML]]、[[entities/cortex-aisql|Cortex AISQL]] 等系统形成对照，扩展了数据库原生 AI 算子的设计空间。

## 应用
- 实时或近实时的 AI 推理场景，要求端到端毫秒级响应的应用
- 对数据安全与合规有严格要求的领域，避免数据出库带来的风险
- 需要简化架构、降低运维复杂度的企业级 AI 服务
- 作为与“外部执行链路”相对立的技术路线，指导系统架构选型与实验设计

## 来源提及

- "Galois 属于 DB4AI 路线中“LLM 作为数据源”的分支。" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
- "GaussML 代表“把模型拉进数据库”（DB4AI）——优势是减少数据移动、降低推理延迟，但受限于数据库进程边界内的资源。" — [[raw/papers/gaussml_icde2024|gaussml_icde2024]]
- "两种路线适用于不同场景，不是谁替代谁的问题——开题报告中需明确这个定位。" — [[raw/papers/gaussml_icde2024|gaussml_icde2024]]
- "**关键区分**：GaussML 代表'把模型拉进数据库'（DB4AI）——优势是减少数据移动、降低推理延迟，但受限于数据库进程边界内的资源。" (关键区分：GaussML 代表“把模型拉进数据库”（DB4AI）——优势是减少数据移动、降低推理延迟，但受限于数据库进程边界内的资源。) — [[raw/papers/gaussml_icde2024|gaussml_icde2024]]
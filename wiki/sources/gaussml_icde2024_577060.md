---
type: source
created: 2026-07-22
updated: 2026-07-22
tags:
  - "document"
aliases:
  - "GaussML 论文精读笔记"
  - "GaussML (ICDE 2024) 深度阅读"
  - "GaussML (ICDE 2024)"
generation_complete: true
---


# 精读笔记：GaussML (ICDE 2024) - Summary

## 来源
- Original file: `[[raw/papers/gaussml_icde2024.md]]`
- Ingested: 2026-07-22

## 核心内容
本笔记是对华为与清华大学在 ICDE 2024 发表的系统论文 **GaussML** 的深度解读。[[entities/gaussml|GaussML]] 在 [[entities/opengauss|openGauss]] 数据库内核中实现了 20 余种常用 ML 算法的原生 SQL 算子集成，替代传统的[[concepts/ml-as-udf|ML-as-UDF]]方案，从而消除 UDF 带来的安全漏洞与性能瓶颈。系统引入了[[concepts/ml-感知优化器|ML 感知优化器]]，配合[[concepts/simd-加速|SIMD 加速]]和[[concepts/数据预取|数据预取]]技术，在分类、回归、聚类等任务上比 [[entities/apache-madlib|Apache MADlib]] 快 2–6 倍。然而，该工作仍属于[[concepts/db4ai|DB4AI]]内嵌路线，仅覆盖传统机器学习，无法支持 LLM/embedding 类新型算子。笔记从四层进行剖析，对比了 [[entities/cortex-aisql|Cortex AISQL]]、[[entities/smart|Smart]]、[[entities/galois|Galois]] 和 [[entities/neurdb|NeurDB]] 等后续工作，指出 GaussML 的架构局限恰好反衬出本课题[[concepts/外部执行链路|外部执行链路]]的弹性与拓展优势，成为 DB4AI 方向的重要学术基线参照。

## 关键实体
- [[entities/gaussml|GaussML]] — 数据库内机器学习系统
- [[entities/opengauss|openGauss]] — 华为开源数据库
- [[entities/apache-madlib|Apache MADlib]] — 传统 ML-in-database 基线
- [[entities/华为|华为]]、[[entities/清华大学|清华大学]] — 研发单位
- [[entities/icde-2024|ICDE 2024]] — 发表会议
- [[entities/cortex-aisql|Cortex AISQL]]、[[entities/smart|Smart]]、[[entities/galois|Galois]]、[[entities/neurdb|NeurDB]] — 同期 DB4AI 工作对比
- [[entities/ray|Ray]] — 外部执行框架对比

## 关键概念
- [[concepts/ml-as-udf|ML-as-UDF]] — 传统数据库内 ML 实现方式
- [[concepts/原生-sql-算子集成|原生 SQL 算子集成]] — GaussML 的核心方法论
- [[concepts/ml-感知优化器|ML 感知优化器]] — ML 感知的查询优化
- [[concepts/simd-加速|SIMD 加速]]、[[concepts/数据预取|数据预取]] — 硬件级性能优化
- [[concepts/db4ai|DB4AI]] — 数据库内人工智能研究领域
- [[concepts/查询计划|查询计划]] — 优化器生成 ML 混合查询计划
- [[concepts/外部执行链路|外部执行链路]] — 本课题的差异化路线

## 要点
- GaussML 以原生 SQL 算子替代 UDF，实现端到端数据库内 ML，比 MADlib 快 2–6 倍。
- ML 感知优化器突破 UDF 黑盒限制，使查询计划能够感知 ML 算子的代价与语义。
- 系统绑定于 openGauss，分布式能力无法轻松迁移至 Ray 等外部框架。
- 仅覆盖传统 ML 算法，不及 LLM/embedding 场景，其硬编码架构扩展性有限。
- 该论文为 DB4AI 内嵌路线的典型代表，其代际局限恰恰论证了面向大模型时代的数据库-AI 融合需要新的外部执行架构。
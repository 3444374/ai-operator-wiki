---
type: source
created: 2026-07-22
updated: 2026-07-22
source_file: "[[raw/papers/gaussml_icde2024.md]]"
tags: [document]
aliases: ["GaussML 精读笔记", "GaussML ICDE 2024 路线对照分析"]
contentHash: 533-8f417842
generation_complete: true
---

# 精读笔记：GaussML (ICDE 2024) + 对照路线分析 - 摘要

## 来源
- 原始文件：[[raw/papers/gaussml_icde2024.md]]
- 收录日期：2026-07-22

## 核心内容
本页为 CCF‑A 会议论文《GaussML: An End‑to‑End In‑database Machine Learning System》的精读笔记，同时结合作者自身课题对两条架构路线进行对照分析。[[entities/gaussml|GaussML]] 是华为与清华大学联合提出的数据库内机器学习系统，在 [[entities/opengauss|openGauss]] 中将 20 余种 ML 算法直接实现为 [[concepts/原生sql算子集成|原生 SQL 算子]]，代替传统的 [[concepts/ml-as-udf|ML‑as‑UDF]] 方案，并引入 [[concepts/ml感知优化器|ML 感知优化器]] 与 [[concepts/simd|SIMD]]/[[concepts/数据预取|数据预取]] 加速，使得典型 ML 任务比 [[entities/apache-madlib|Apache MADlib]] 快 2–6 倍。GaussML 代表 [[concepts/db4ai|DB4AI]]（模型进数据库）路线，降低数据移动但资源受限于数据库进程。笔记同时记录了本课题所采取的 [[concepts/外部执行链路|外部执行链路]]（数据库触发 → [[entities/ray|Ray]] [[concepts/gpu-模型服务|GPU 模型服务]] → 写回），该路线能给 embedding 与 LLM 推理弹性提供 GPU 算力，但却引入 [[concepts/写回瓶颈|写回瓶颈]]。两条路线并非相互替代，而是针对不同模型类型与资源场景的互补设计。

## 关键实体
- [[entities/gaussml|gaussml]]
- [[entities/icde-2024|icde-2024]]
- [[entities/opengauss|opengauss]]
- [[entities/apache-madlib|apache-madlib]]
- [[entities/华为|华为]]
- [[entities/清华大学|清华大学]]
- [[entities/ray|ray]]
- [[entities/lance|lance]]
- [[entities/pgvector|pgvector]]
- [[entities/psycopg|psycopg]]

## 关键概念
- [[concepts/ml-as-udf|ml-as-udf]]
- [[concepts/原生sql算子集成|原生sql算子集成]]
- [[concepts/ml感知优化器|ml感知优化器]]
- [[concepts/simd|simd]]
- [[concepts/数据预取|数据预取]]
- [[concepts/db4ai|db4ai]]
- [[concepts/外部执行链路|外部执行链路]]
- [[concepts/写回瓶颈|写回瓶颈]]
- [[concepts/数据库触发|数据库触发]]
- [[concepts/查询计划|查询计划]]
- [[concepts/传统-ml|传统-ml]]
- [[concepts/arrow-recordbatch|arrow-recordbatch]]
- [[concepts/gpu-模型服务|gpu-模型服务]]

## 要点
- GaussML 将 20+ ML 算子作为原生 SQL 算子集成进 openGauss，替代 UDF 方案。
- ML 感知优化器与 SIMD/数据预取技术显著提升性能，比 MADlib 快 2–6 倍。
- DB4AI 架构减少数据移动但受限于数据库进程资源。
- 本课题采用外部执行链路（数据库触发 → Ray GPU 服务 → 写回），可弹性利用 GPU 但引入写回开销。
- 两条路线不是替代关系，适用于传统 ML 与 LLM/embedding 等不同场景。
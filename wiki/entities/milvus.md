---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/diskann_neurips2019_009b0e]]"]
tags: [product]
aliases:
  - "Milvus vector database"
  - "Milvus (SIGMOD 2021)"
generation_complete: true
---


# Milvus

## 描述
Milvus 是一个面向 AI 应用的开源向量数据库，在 SIGMOD 2021 论文中介绍了其 CPU/GPU 混合查询引擎设计。DiskANN 笔记将其列为与纯 CPU 路线对照的后续待读文献。Milvus 采用异构计算架构，与 DiskANN 的纯 CPU + SSD 单机设计形成对比，但两者都试图解决大规模向量检索的成本与效率问题。对于本课题，Milvus 提供了另一种架构参考，特别是在多模态多算子混合负载场景下的资源调度思路。

## 相关实体
- [[entities/diskann|diskann]]

## 相关概念
- [[concepts/two-tier-storage-architecture|Two-tier storage architecture]]

## 来源提及

- "Milvus (SIGMOD 2021) — 向量数据库的 CPU/GPU 混合查询引擎设计，与 DiskANN 的纯 CPU 路线对照" — [[raw/papers/diskann_neurips2019|diskann_neurips2019]]
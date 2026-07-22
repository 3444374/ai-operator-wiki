---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/readme_425fbb]]"]
tags: [product]
aliases:
  - "LEADS 系统"
  - "基于动态模型切片的数据库内分析系统"
generation_complete: true
---


# LEADS

## 描述
LEADS（基于动态模型切片的数据库内分析系统）是一种结构化数据分析系统，其核心设计是在数据库内部直接执行模型推理，避免大量数据在数据库与外部机器学习平台之间移动。LEADS 通过动态决定并切分模型的计算图（[[concepts/dynamic-model-slicing|动态模型切片]]），将能够下推至数据库引擎的计算片段部署为 UDF，从而实现高效的 [[concepts/in-database-inference|库内推理]]。该系统还展示了 UDF 执行的图形化拆解与全链路工作流集成方法，为后续 [[entities/gaussml|GaussML]] 等数据库内推理系统的优化提供了具体的技术路线。LEADS 的设计融合了数据库查询执行与模型服务，并与 [[entities/galois|Galois]] 等研究一同推动了数据库原生 AI 的演进。

## 相关实体
- [[entities/gaussml|GaussML]]
- [[entities/galois|Galois]]

## 相关概念
- [[concepts/in-database-inference|库内推理]]
- [[concepts/dynamic-model-slicing|动态模型切片]]
- [[concepts/ml-as-udf|ml-as-udf]]
- [[concepts/查询计划|查询计划]]

## 来源提及

- "`p4813-zeng.pdf` | Powering In-Database Dynamic Model Slicing for Structured Data Analytics | 14 | LEADS；学习 in-database inference workflow 和 UDF 执行拆解" (`p4813-zeng.pdf` | 为结构化数据分析驱动数据库内动态模型切片 | 14 | LEADS；用于学习数据库内推理工作流和UDF执行拆解) — [[raw/papers/README|README]]
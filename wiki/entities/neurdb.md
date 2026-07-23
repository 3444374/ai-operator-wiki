---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources:
  - "[[sources/gaussml_icde2024_577060]]"
tags:
  - "product"
aliases:
  - "NeurDB"
  - "AI-driven Autonomous Database"
generation_complete: true
---

# NeurDB

## 描述
NeurDB 是一个设计并实现的 AI 驱动的自治数据库，旨在将 AI 技术深度集成到数据库内核中，实现自调优、自诊断和自管理，而不是将 AI 作为外部工具附加。在 README 中，NeurDB 被用于数据库 AI 架构的对照学习，帮助阐明 AI 组件与传统查询引擎的交互方式。它与 [[entities/andb|AnDB]]、[[entities/gaussml|GaussML]] 等项目共同构成了 AI 原生数据库的研究谱系，其系统架构图为设计方法论提供了重要参考。

其架构更具弹性，常作为 [[entities/gaussml|GaussML]] 的对照读本来理解 AI 原生数据库的设计差异。
## 相关实体
- [[entities/andb|AnDB]]
- [[entities/d-bot|D-Bot]]
- [[entities/gaussml|GaussML]]

## 相关概念
暂无

- [[concepts/db4ai|DB4AI]] (引入 DB4AI 概念，该文献将其作为 NeurDB 所属的研究范式。)

## 来源提及

- "`p29-zhao.pdf` | NeurDB: On the Design and Implementation of an AI-powered Autonomous Database | 8 | AI-powered autonomous DB；数据库 AI 架构对照" (`p29-zhao.pdf` | NeurDB：AI驱动的自治数据库设计与实现 | 8 | AI驱动的自治数据库；用于数据库AI架构对照) — [[raw/papers/README|README]]
- "[[entities/neurdb|NeurDB]] (CIDR 2025) — 另一 DB4AI 路线，架构更有弹性" — [[raw/papers/gaussml_icde2024|gaussml_icde2024]]
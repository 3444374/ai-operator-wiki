---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/cortex_aisql_sigmod2026_c18b08]]"]
tags: [term]
aliases:
  - "内部模型服务"
  - "Snowflake GPU service"
generation_complete: true
---


# Internal model serving

## 定义
Internal model serving 是一种数据库内置的 AI 推理架构：数据库平台在其内部集群中直接部署 GPU 推理服务（如 Snowflake 的 GPU 集群），使得所有 SQL 中嵌入的 AI 算子调用均在本地完成，无需跨越网络边界。该架构消除了外部调用带来的网络延迟与排队不确定性，是 [[entities/cortex-aisql]] 能够建立简化成本模型 $C_{op}(n) = n \times c_{model} + \alpha$ 的关键前提。

## 关键特征
- **完全本地执行**：AI 推理发生在数据库所属集群内，数据与模型之间的通信不离开数据库网络
- **低且确定的延迟**：无跨网络通信、无外部 GPU 排队，推理延迟可预测，方差小
- **简化成本模型**：使得每算子成本可近似为 $n \times c_{model}$ 加固定开销，便于查询优化器进行代价估算
- **与外部执行链路对立**：区别于通过 [[entities/ray]] 调用 [[entities/vllm]] 等外部服务的模式，后者引入 cold start、网络抖动等不确定因素

## 应用
- [[entities/snowflake]] 的 Cortex AISQL 框架采用 Internal model serving，实现了 SQL 内嵌 AI 算子的高性能、可预测执行
- 作为 [[concepts/原生-sql-算子集成]] 的一种高级形式，为数据库系统集成大模型推理提供了架构参考
- 对比 [[concepts/外部执行链路]]，凸显内建推理在事务性 SQL 负载中的稳定性优势

## 相关概念
- [[concepts/外部执行链路]]
- [[concepts/原生-sql-算子集成]]

## 相关实体
- [[entities/snowflake]]
- [[entities/cortex-aisql]]
- [[entities/ray]]
- [[entities/vllm]]

## 来源提及

- "所有 AI 推理调用走 Snowflake 内部模型服务（同集群低延迟），且模型调用成本可以建模为 `C_op(n) = n × c_model + α`。" (所有 AI 推理调用走 Snowflake 内部模型服务（同集群低延迟），且模型调用成本可以建模为 C_op(n) = n × c_model + α。) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
- "外部执行链路中，模型服务是跨网络调用，涉及 GPU 排队、cold start、网络延迟" (外部执行链路中，模型服务是跨网络调用，涉及 GPU 排队、cold start、网络延迟。) — [[raw/papers/cortex_aisql_sigmod2026|cortex_aisql_sigmod2026]]
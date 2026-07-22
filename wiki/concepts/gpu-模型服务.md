---
type: concept
created: 2025-04-11
updated: 2026-07-22
sources: ["[[sources/gaussml_icde2024_577060]]"]
tags: [method]
aliases:
  - "GPU Model Serving"
  - "GPU推理服务"
generation_complete: true
---


# GPU 模型服务

## 定义
GPU 模型服务是一种将训练好的深度学习模型（如大语言模型、embedding 模型）部署在配备 GPU 的服务器上，通过 API 对外提供实时或批量推理计算的方法。在本课题的外部执行架构中，数据库触发任务后，相关数据被发送至 GPU 模型服务进行推理，计算结果再通过单独的写回步骤持久化到数据库中，形成“触发‑推理‑写回”的调用闭环。

## 关键特征
- 与数据库内核解耦，可在独立的 GPU 集群上运行，不占用数据库引擎的计算资源
- 支持多 GPU 并行推理，可通过增加 GPU 数量横向扩展推理吞吐
- 通过网络接口（如 REST/gRPC）与数据库或其他调用方通信，引入网络延迟
- 推理结果需显式写回数据库，因此存在额外的写回开销（可参考[[concepts/写回瓶颈|写回瓶颈]]）
- 特别适合计算密集、参数规模大的模型，难以直接内嵌在查询引擎中执行的场景
- 与库内机器学习（如[[entities/gaussml|GaussML]]将 ML 算子直接融入查询引擎）相比，GPU 模型服务更易独立升级和伸缩，但牺牲了一定的数据本地性和实时性

## 应用
- 为数据库查询提供 LLM 推理（如文本生成、摘要、分类），通过外部调用链完成[[concepts/外部执行链路|外部执行链路]]中的重计算环节
- 执行 embedding 计算，将数据库中的非结构化数据转换为向量表示后写回，支撑下游语义查询（如[[concepts/ai_embed|ai_embed]] 算子）
- 在需要超大显存或多卡并行的场景中，承载大模型服务，例如 70B+ 参数的语言模型或多模态模型
- 配合[[entities/ray|Ray]]等分布式框架，构建可弹性伸缩的模型推理微服务

## 相关概念
- [[concepts/外部执行链路|外部执行链路]]
- [[concepts/写回瓶颈|写回瓶颈]]
- [[concepts/数据库触发|数据库触发]]
- [[concepts/大模型|大模型]]

## 相关实体
- [[entities/ray|Ray]]
- [[entities/gaussml|GaussML]]
- [[entities/serverlessllm|serverlessllm]]

## 来源提及

- "ML 算子位置：外部 Ray worker + GPU 模型服务" (ML 算子位置：外部 Ray worker 加上 GPU 模型服务) — [[raw/papers/gaussml_icde2024|gaussml_icde2024]]
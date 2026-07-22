---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/readme_425fbb]]"]
tags: [product]
aliases:
  - "ServerlessLLM"
  - "Serverless LLM"
generation_complete: true
---


# ServerlessLLM

## 描述
ServerlessLLM 是一个面向大语言模型的无服务器推理系统，核心目标是在保证低延迟响应的同时实现极高的资源利用率。它通过**局部性策略**与**模型迁移机制**来智能调度推理负载，其架构图中清晰地分离了数据流与控制流，从而简化了系统扩展与维护。ServerlessLLM 的无服务器设计理念与 [[entities/sarathi-serve|Sarathi-Serve]] 的预调度服务形成对比，为推理系统的弹性伸缩提供了重要参考。在相关工作中，该系统常与 [[entities/vllm|vLLM]] 等高效 LLM 推理系统一同被研究，用于学习系统架构表达和迁移流程图的设计范式。

## 相关实体
- [[entities/sarathi-serve|Sarathi-Serve]]
- [[entities/vllm|vLLM]]

## 相关概念
无

## 来源提及

- "`osdi24-fu.pdf` | ServerlessLLM: Low-Latency Serverless Inference for Large Language Models | 20 | ServerlessLLM；学习系统架构、locality policy、migration 流程图" (`osdi24-fu.pdf` | ServerlessLLM：面向大语言模型的低延迟无服务器推理 | 20 | ServerlessLLM；用于学习系统架构、局部性策略和迁移流程图) — [[raw/papers/README|README]]
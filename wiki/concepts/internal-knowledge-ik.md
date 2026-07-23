---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: []
tags: [term]
aliases:
  - "IK 场景"
  - "内部知识访问"
  - "内部知识场景"
generation_complete: true
---


# Internal knowledge (IK)

## 定义
Internal knowledge (IK) 是 [[entities/galois|Galois]] 实验中定义的一种知识获取场景。该场景下，问题所需的结构化数据完全存在于 LLM 的预训练参数中（如世界常识、学术引用等），模型无需借助外部上下文即可直接作答。这种场景代表了 LLM “闭卷问答”（closed-book QA）能力的测试基线，也是 Galois 系统性能收益最为显著的数据分布类型之一。

## 关键特征
- **参数化存储**：所需知识 100% 内嵌于 LLM 训练权重，无需检索外部知识库或向量数据库
- **数据集对应**：对应 Galois 实验中的 [[entities/flight|Flight]]、[[entities/geo-test|Geo-Test]]、[[entities/world-dataset|World]]、[[entities/scholar-dataset|Scholar]] 四个基准数据集
- **零外部依赖**：推理过程中不消耗上下文窗口用于知识注入，仅依赖模型底层记忆
- **与流行度强相关**：IK 场景的性能受 [[concepts/popularity-bias-in-llm-knowledge-extraction|Popularity bias in LLM knowledge extraction]] 显著影响——高频实体/事实的准确率显著高于长尾知识
- **Galois 最佳适应域**：相较于其他场景（如需要多步链接的关系知识或完全不可访问的知识），Galois 的改写与调度策略在 IK 场景中实现了最大的端到端性能提升

## 应用
- **知识探针基准构建**：用于衡量 LLM 对预训练数据的记忆广度与深度，是评估模型事实性知识容量的标准范式
- **查询调度决策**：Galois 类系统可依据 IK 判定结果，将此类查询路由至高性能的少步提示（few-shot prompting）或直接路由策略，避免不必要的检索开销
- **模型能力边界测试**：通过对比 IK 场景与其他场景（OK、NK、RK）的差距，量化分析 LLM 在需要外部知识融合时的性能衰减

## 相关概念
- [[concepts/popularity-bias-in-llm-knowledge-extraction|Popularity bias in LLM knowledge extraction]]

## 相关实体
- [[entities/galois|Galois]]
- [[entities/flight|Flight]]
- [[entities/geo-test|Geo-Test]]
- [[entities/world-dataset|World]]
- [[entities/scholar-dataset|Scholar]]

## 来源提及

- "Flight/Geo/World/Scholar（IK 内参知识）" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
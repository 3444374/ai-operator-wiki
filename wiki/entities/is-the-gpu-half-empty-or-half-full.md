---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/db_perspective_llm_pvldb2025_300968]]"]
tags: [product]
aliases:
  - "Kossmann et al. 2025 LLM scheduling"
  - "GPU half-empty or half-full"
generation_complete: true
---


# Is the GPU half-empty or half-full?

## 描述
“Is the GPU half-empty or half-full?” 是 Kossmann 等人于 2025 年发表的关于大语言模型（LLM）推理调度的实用技术论文。该工作聚焦于通过更精确的 [[concepts/load-balancing|Load Balancing]] 策略和 completion time 估计来优化 [[concepts/job-prioritization|Job Prioritization]] 决策，其核心动机是在多请求场景下减少 GPU 空闲周期，提升硬件利用率。论文指出，当前调度方法普遍依赖启发式规则，缺乏对缓存复用潜力与精确代价的量化评估。在本 Wiki 的来源文献 §2.2 节中，它被作为 LLM 推理调度领域具有代表性的研究予以引用，用以说明传统的优先级分配机制尚待改进。

## 相关实体
（暂无直接关联实体）

## 相关概念
- [[concepts/job-prioritization|Job Prioritization]]
- [[concepts/load-balancing|Load Balancing]]

## 来源提及

- "请求调度顺序影响延迟和吞吐——当前方法基于 completion time 估计 [11] 或 cache 复用潜力 [20] 做优先级决策。" — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
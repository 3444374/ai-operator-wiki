---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/db_perspective_llm_pvldb2025_300968]]"]
tags: [method]
aliases:
  - "思维图"
  - "GoT"
generation_complete: true
---


# Graph-of-Thoughts

## 定义
Graph-of-Thoughts (GoT) 是一种提升大型语言模型 (LLM) 复杂推理能力的**提示策略**。它将推理过程建模为**有向无环图 (DAG)**，其中每个节点代表一个中间“思维”步骤，边代表节点间的依赖关系。与线性链式的 [[concepts/chain-of-thought|Chain-of-Thought]] 不同，GoT 允许模型沿多条路径展开推理，支持**分支、合流与回溯**，最终通过聚合或择优得到高质量答案。该策略在本源中被定位为序列生成阶段的高级规划方法，类比于对查询计划空间的搜索。

## 关键特征
- **图结构推理**：将思维单元组织成 DAG，而非单纯链式序列，可显式表达更复杂的推理拓扑
- **多路径探索**：在推理过程中天然支持并行生成多条候选推理路径，并对它们进行交叉、合并或剪枝
- **灵活的回溯能力**：允许模型根据后续推理结果抛弃低质量分支，重新选择其他路径，避免陷于局部错误
- **类比查询搜索**：类似于数据库查询优化中的计划搜索（如 [[Beam Search]]），通过结构化的探索-利用策略寻找最优思维组合
- **优于传统方法**：相比 [[Chain-of-Thought]] 和简单的自一致性投票，GoT 在需要多步规划、对比或演绎的复杂任务上表现更优

## 应用
- **复杂数学推理**：解决需要多步计算、分支证明或反证法的数学问题
- **代码生成与调试**：同时生成多种实现思路，按测试结果选择或融合正确版本
- **任务规划**：在给定约束下生成并搜索不同行动序列，如机器人的动作规划
- **多文档问答**：从多个信息源中提取证据，形成交叉验证的推理网络
- **创意写作与头脑风暴**：探索不同叙事分支并根据一致性评估整合

## 相关概念
- [[concepts/beam-search|Beam Search]]：一种启发式搜索算法，用于在序列生成时保留多个候选以扩展最优序列，GoT 将其扩展至图结构
- [[concepts/self-consistency|Self-Consistency]]：通过采样多条推理路径并多数投票来提升答案可靠性，GoT 可在此基础上进行更复杂的路径融合
- [[concepts/chain-of-thought|Chain-of-Thought]]：基础线性推理链，GoT 是其在结构维度上的泛化和增强
- [[concepts/tree-of-thoughts|Tree-of-Thoughts]]：树状推理扩展，GoT 进一步支持节点合并与任意图结构

## 相关实体
- 暂无直接关联的实体。

## 来源提及

- "Sequence Generation<br/>Beam Search / Graph-of-Thoughts / Self-Consistency" (序列生成：束搜索 / 思维图 / 自一致性) — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
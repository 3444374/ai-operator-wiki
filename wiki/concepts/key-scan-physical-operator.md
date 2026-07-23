---
type: concept
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/galois_sigmod2025_c4af88]]"]
tags: [method]
aliases:
  - "KeyScan"
  - "Key Scan Operator"
generation_complete: true
---


# Key-Scan (physical operator)

## 定义
Key-Scan 是 [[entities/galois|Galois]] 查询系统中定义的一种高精度物理算子，用于结构化数据的查询执行。它采用**两步分解**策略：
1. **第一步**：扫描所有数据行，提取每一行的 `Key` 值；
2. **第二步**：对提取到的每一个 `Key`，单独获取该行对应的其他属性值（类似 [[concepts/chain-of-thought|Chain-of-Thought]] 的分解式推理）。

第二步中每个 `Key` 的处理彼此独立，因此可以高度并行化。该算子能显著提升结构化数据的**召回精度**，但相应的 **token 消耗**也远高于单步扫描算子（如 [[concepts/table-scan-physical-operator|Table-Scan (physical operator)]]）。Galois 的查询优化器仅在其内部置信度评估表明当前查询需要更高精度时，才选择 Key-Scan 执行路径。

## 关键特征
- **两步分解执行**：先全局扫描 Keys，再逐 Key 提取属性，确保属性提取的上下文聚焦于单个 Key
- **第二步高度可并行**：每个 Key 的属性提取无依赖关系，可充分利用并行推理加速
- **高召回精度**：适用于结构化关键字段的精确抽取，尤其当单次提示难以覆盖所有属性时
- **高 token 消耗**：由于对每个 Key 都要生成一次额外的推理提示，总 token 开销显著增加
- **置信度驱动选择**：Galois 仅在模型置信度中等（不足以直接用 Table-Scan 获得可靠结果）时才采用 Key-Scan，避免不必要的成本

## 应用
- **结构化数据提取**：从非结构化或半结构化文档（如简历、发票、财务报告）中抽取带 Key 的记录（例如通过 `id` 或 `名称` 字段提取对应的多个属性）
- **高准确率问答**：当用户要求“列出所有订单的订单号、金额和日期”时，Key-Scan 先提取所有订单号，再为每个订单号提取金额和日期，降低遗漏和幻觉风险
- **后续分析型工作流**：对结构化查询结果有严格一致性要求的场景（如数据清洗、报表生成），Key-Scan 提供了可追溯的分解执行过程

## 相关概念
- [[concepts/table-scan-physical-operator|Table-Scan (physical operator)]]
- [[concepts/chain-of-thought|Chain-of-Thought]]

## 相关实体
- [[entities/galois|Galois]]

## 来源
具体实现与实验详见 [[sources/galois_sigmod2025_c4af88|Galois SIGMOD 2025 论文]]。

## 来源提及

- "Key-Scan 先获取所有 Key 值，再对每个 Key 获取其他属性——类似 CoT 的分解推理，质量更高但 token 成本更大。" — [[raw/papers/galois_sigmod2025|galois_sigmod2025]]
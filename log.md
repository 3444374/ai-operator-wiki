---
type: log
---

# 操作日志

记录知识库的所有 ingest、lint、query 操作和结构变更。

---

## 2026-07-22：初始化知识库

- **操作**：从项目 `ai-operator-execution-optimization` 导入核心知识文件
- **来源**：`research/`（7 文件）+ `opening/literature/`（7 文件）+ `experiments/plans/`（9 文件）
- **结构**：重构为 Karpathy 三层架构（raw/ → wiki/ → log.md）
- **插件**：配置 obsidian-llm-wiki（green-dalii）
- **Git**：初始化为独立仓库

## 同步协议

项目 → 知识库同步规则：

| 项目变更 | 知识库操作 |
|---|---|
| 精读完新论文，写了笔记 | 存到 `raw/papers/` → Ingest |
| 完成新实验，有了结论 | 写结论笔记到 `raw/findings/` → Ingest |
| 做了设计决策 | 直接写入 `my-notes/设计决策日志.md` |
| 修改了已有知识文件 | 覆盖 `raw/` 对应文件 → Re-ingest |
| 代码、CSV、规则文件变更 | 不需要同步 |

项目文件（`research/`、`opening/literature/`、`experiments/plans/`）保留在原位（Claude Code 需要读取），知识库是编译后的增强视图。

## 待执行

- [ ] 安装 obsidian-llm-wiki 插件
- [ ] 配置 LLM provider（DeepSeek / Anthropic）
- [ ] 首次 Ingest：`raw/papers/` 三篇精读笔记
- [ ] 首次 Ingest：`raw/references/` 四篇技术参考
- [ ] 运行 Lint 建立健康基线
- [ ] Git push 到 GitHub

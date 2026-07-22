---
type: log
---

# 操作日志

---

## 2026-07-22 19:00：重构为项目镜像架构

**变更**：raw/ 和 experiments/plans/ 改为项目原始文件的纯镜像。所有文件不再在 wiki 中独立维护——唯一来源是项目仓库。新增 `sync-wiki.sh` 一键同步脚本。

**机制**：`rm -rf` 目标目录 + `cp` 重新拷贝 = 新增、修改、删除全部同步。

## 2026-07-22：初始化知识库

- **操作**：从项目 `ai-operator-execution-optimization` 导入核心知识文件
- **来源**：`research/` + `opening/literature/` + `experiments/plans/`
- **结构**：Karpathy 三层架构（raw/ → wiki/ → log.md）
- **Git**：独立仓库，与项目平级

---

## 同步协议

```
项目（知识唯一来源）                    Wiki（编译查询界面）
══════════════════════                 ═════════════════════
research/*.md                          raw/references/*
opening/literature/*.md   ──sync.sh──→ raw/inventory/*, raw/analysis/*, raw/papers/*
experiments/plans/*.md                 experiments/plans/*

                                          ↓ 插件 ingest
                                         wiki/entities/ + wiki/concepts/
```

| 你在项目中的操作 | 如何同步到知识库 |
|---|---|
| 修改了已有知识文件 | 运行 `./sync-wiki.sh` → 插件 re-ingest |
| 新增了一篇论文笔记 | 文件已在 `opening/literature/reading_notes/` → `./sync-wiki.sh` 自动发现新文件 |
| 新建了一个知识目录（如 `research/新方向/`） | 在 `sync-wiki.sh` 中加一行 `cp` 映射 |
| 删除了一个过时的知识点 | `./sync-wiki.sh`（`rm -rf` + 重拷 = 自动删除） |
| 写代码、跑实验、改规则 | 不需要同步 |

**核心原则**：raw/ 永远是项目文件的镜像。每次同步先清空再拷贝，所以新增、修改、删除全部自动处理。

**新目录映射**：如果在项目中新建了知识目录（如 `research/my_new_topic/`），在 `sync-wiki.sh` 对应区块加一行：
```bash
cp "$PROJECT/research/my_new_topic/"*.md raw/references/
```

---

## 待执行

- [ ] 在 GitHub 创建 private repo → `git remote add` → `git push`
- [ ] 安装 obsidian-llm-wiki 插件（Settings → Community Plugins → Karpathy LLM Wiki）
- [ ] 配置 LLM provider（DeepSeek / Anthropic）
- [ ] 首次 Ingest：`raw/papers/` → 测试插件是否正常
- [ ] 其他电脑：`git clone` 两个仓库（确保放在同一父目录下）

# AI Operator LLM Wiki

数据库 AI 负载的上游执行链路优化——个人 LLM 知识库。

基于 [Karpathy LLM Wiki](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) 方法论构建，使用 [obsidian-llm-wiki](https://github.com/green-dalii/obsidian-llm-wiki) 插件驱动知识编译。

## 结构

```
raw/          ← 项目知识文件镜像（通过 sync-wiki.sh 同步）
wiki/         ← LLM 编译的知识（实体 + 概念 + MOC）
experiments/  ← 实验计划
my-notes/     ← 个人笔记
templates/    ← Obsidian 模板
```

## 使用

1. `git clone` 到本地，与项目仓库平级
2. Obsidian → Open folder as vault → 选本目录
3. 安装 "Karpathy LLM Wiki" 社区插件
4. 运行 `./sync-wiki.sh` 同步项目最新知识 → 插件 Ingest

## 关联

- 项目仓库：[ai-operator-execution-optimization](https://github.com/3444374/ai-operator-execution-optimization)

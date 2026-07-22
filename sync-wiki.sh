#!/bin/bash
# sync-wiki.sh — 将项目知识文件镜像到 Obsidian wiki 的 raw/ 目录
#
# 用法：
#   ./sync-wiki.sh                  # 使用默认相对路径
#   PROJECT_PATH=~/projects/ai-op ./sync-wiki.sh  # 指定项目路径
#
# 自动跟踪：
#   - research/*.md          → raw/references/（全部自动发现）
#   - reading_notes/*.md     → raw/papers/（全部自动发现）
#   - reference/*.pdf        → raw/papers/（全部自动发现）
#   - experiments/plans/*.md → experiments/plans/（全部自动发现）
#   - opening/literature/ 顶层文件 → raw/analysis/ + raw/inventory/（手动映射，新文件需加一行 cp）
#
# 同步后：
#   打开 Obsidian → Cmd+P → "Ingest from folder" → 选 raw/ → 插件增量更新 wiki/

set -e

PROJECT="${PROJECT_PATH:-../ai-operator-execution-optimization}"

echo "=== 同步项目知识 → Wiki raw/ ==="
echo "项目路径: $PROJECT"

# ═══════════════════════════════════════════════
# 第一步：清空所有目标目录
# ═══════════════════════════════════════════════
echo "[1/5] 清空目标目录..."
rm -rf raw/references/*
rm -rf raw/analysis/*
rm -rf raw/inventory/*
rm -rf raw/papers/*
rm -rf experiments/plans/*

# ═══════════════════════════════════════════════
# 第二步：自动发现 + 批量拷贝
# ═══════════════════════════════════════════════

# ── research/ → raw/references/（通配符：新增 .md 自动同步）──
echo "[2/5] research/*.md → raw/references/"
cp "$PROJECT/research/"*.md raw/references/ 2>/dev/null || true
# 以下文件属于"综合分析"类，移到 raw/analysis/
for f in literature_and_evidence_review existing_ai_operator_execution_chains; do
    if [ -f "raw/references/${f}.md" ]; then
        mv "raw/references/${f}.md" raw/analysis/
    fi
done

# ── opening/literature/ 顶层 → raw/analysis/ + raw/inventory/（手动映射）──
echo "[3/5] opening/literature/ → raw/analysis/ + raw/inventory/"
cp "$PROJECT/opening/literature/direction_assessment_20260715.md"               raw/analysis/ 2>/dev/null || true
cp "$PROJECT/opening/literature/gpu_scheduler_data_placement_supplement_20260715.md" raw/analysis/ 2>/dev/null || true
cp "$PROJECT/opening/literature/ai_operator_literature_inventory.md" raw/inventory/ 2>/dev/null || true
cp "$PROJECT/opening/literature/reading_list.md"                   raw/inventory/ 2>/dev/null || true
# ⚠️ 如果在 opening/literature/ 下新增 .md 文件，在这里加 cp 行

# ── 论文源文件（通配符：新增笔记和 PDF 自动同步）──
echo "[4/5] 论文 → raw/papers/"
cp "$PROJECT/opening/literature/reading_notes/"*.md raw/papers/ 2>/dev/null || true
cp "$PROJECT/opening/literature/reference/"*.pdf     raw/papers/ 2>/dev/null || true
cp "$PROJECT/opening/literature/reference/README.md" raw/papers/ 2>/dev/null || true

# ── experiments/plans/ → experiments/plans/（通配符：新增 .md 自动同步）──
echo "[5/5] experiments/plans/*.md → experiments/plans/"
cp "$PROJECT/experiments/plans/"*.md experiments/plans/ 2>/dev/null || true
cp "$PROJECT/experiments/plans/archive/research_design_catalog.md" raw/analysis/ 2>/dev/null || true

# ═══════════════════════════════════════════════
echo ""
echo "=== 同步完成 ==="
echo "下一步: 打开 Obsidian → Cmd+P → 'Karpathy LLM Wiki: Ingest from folder' → 选 raw/"
echo ""

# 显示变更
git status --short

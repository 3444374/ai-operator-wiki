#!/bin/bash
# sync-wiki.sh — 将项目知识文件增量同步到 Obsidian wiki
#
# 用法：
#   ./sync-wiki.sh
#   PROJECT_PATH=~/projects/ai-op ./sync-wiki.sh
#
# 行为：
#   - 新增文件 → 拷贝过来
#   - 修改文件 → 项目版本覆盖（raw/ 是项目镜像，不应在 wiki 中编辑）
#   - 删除文件 → 在 wiki 中保留为过期副本（手动删除或下次 git clean）
#   - wiki/moc/ 和 my-notes/ → 永不触碰
#
# 编辑边界：
#   raw/            → 只读镜像，在项目中编辑，不要直接在 wiki 中改
#   wiki/moc/       → 你的导航层，自由编辑，插件不覆盖（reviewed: true）
#   wiki/entities/  → 插件自动生成，不要手动编辑
#   wiki/concepts/  → 插件自动生成，不要手动编辑
#   my-notes/       → 你的个人笔记，自由编辑，永不触碰
#
# 同步后：
#   打开 Obsidian → Cmd+P → "Ingest from folder" → 选 raw/ → 插件增量更新 wiki/

set -e

PROJECT="${PROJECT_PATH:-../ai-operator-execution-optimization}"

echo "=== 增量同步 项目 → Wiki ==="
echo "项目: $PROJECT"
echo ""

# ═══════════════════════════════════════════════
# research/ → raw/references/（通配符：新增 .md 自动发现）
# ═══════════════════════════════════════════════
echo "[1/5] research/*.md → raw/references/"
cp "$PROJECT/research/"*.md raw/references/ 2>/dev/null || true
# 综合分析类文件路由到 raw/analysis/
for f in literature_and_evidence_review existing_ai_operator_execution_chains; do
    if [ -f "raw/references/${f}.md" ]; then
        cp "raw/references/${f}.md" raw/analysis/
    fi
done

# ═══════════════════════════════════════════════
# opening/literature/ 顶层 → raw/analysis/ + raw/inventory/
# ═══════════════════════════════════════════════
echo "[2/5] opening/literature/ → raw/analysis/ + raw/inventory/"
cp "$PROJECT/opening/literature/direction_assessment_20260715.md"               raw/analysis/ 2>/dev/null || true
cp "$PROJECT/opening/literature/gpu_scheduler_data_placement_supplement_20260715.md" raw/analysis/ 2>/dev/null || true
cp "$PROJECT/opening/literature/ai_operator_literature_inventory.md" raw/inventory/ 2>/dev/null || true
cp "$PROJECT/opening/literature/reading_list.md"                   raw/inventory/ 2>/dev/null || true
# ⚠️ opening/literature/ 下新增 .md 文件 → 在这里加 cp 行

# ═══════════════════════════════════════════════
# 论文源文件 → raw/papers/
# ═══════════════════════════════════════════════
echo "[3/5] 论文 → raw/papers/"
cp "$PROJECT/opening/literature/reading_notes/"*.md raw/papers/ 2>/dev/null || true
cp "$PROJECT/opening/literature/reference/"*.pdf     raw/papers/ 2>/dev/null || true
cp "$PROJECT/opening/literature/reference/README.md" raw/papers/ 2>/dev/null || true

# ═══════════════════════════════════════════════
# experiments/plans/ → experiments/plans/
# ═══════════════════════════════════════════════
echo "[4/5] experiments/plans/*.md → experiments/plans/"
cp "$PROJECT/experiments/plans/"*.md experiments/plans/ 2>/dev/null || true
cp "$PROJECT/experiments/plans/archive/research_design_catalog.md" raw/analysis/ 2>/dev/null || true

# ═══════════════════════════════════════════════
echo "[5/5] 完成"
echo ""
echo "=== 同步完成 ==="
echo "下一步: 打开 Obsidian → Cmd+P → 'Ingest from folder' → 选 raw/"
echo ""

# 如有从项目删除的文件，这里会显示为 stale
STALE=$(git ls-files --deleted raw/ experiments/plans/ 2>/dev/null | wc -l)
if [ "$STALE" -gt 0 ]; then
    echo "⚠️  项目中有 $STALE 个文件已删除，wiki 中仍保留旧副本。"
    echo "   如需清理：git status 查看 → 手动 git rm"
fi

git status --short

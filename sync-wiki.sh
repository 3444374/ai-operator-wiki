#!/bin/bash
# sync-wiki.sh — 将项目知识文件增量同步到 Obsidian wiki
#
# 用法：
#   ./sync-wiki.sh
#   PROJECT_PATH=~/projects/ai-op ./sync-wiki.sh
#
# 行为：
#   - 新增文件 → 拷贝过来
#   - 项目有更新 → 覆盖 wiki 中的旧版本
#   - wiki 独有的文件 → 保留不动
#   - 项目已删除的文件 → wiki 中保留（手动清理过期文件）
#   - wiki/moc/ 和 my-notes/ → 永不触碰
#
# 编辑规则：
#   raw/ experiments/ → 在项目中编辑，同步覆盖到 wiki
#   如果在 Obsidian 中发现需要改的内容，回到项目中改源文件
#   wiki/moc/ my-notes/ → 直接在 Obsidian 中改，同步不碰
#
# 同步后：
#   打开 Obsidian → Cmd+P → "Ingest from folder" → 选 raw/

set -e

PROJECT="${PROJECT_PATH:-../ai-operator-execution-optimization}"

echo "=== 增量同步 项目 → Wiki ==="
echo "项目: $PROJECT"
echo ""

# ═══════════════════════════════════════════════
echo "[1/5] research/*.md → raw/references/"
for f in "$PROJECT"/research/*.md; do
    [ -e "$f" ] || continue
    cp "$f" "raw/references/$(basename "$f")" 2>/dev/null || true
done
# 综合分析类文件路由到 raw/analysis/
for f in literature_and_evidence_review existing_ai_operator_execution_chains; do
    if [ -f "raw/references/${f}.md" ]; then
        cp "raw/references/${f}.md" "raw/analysis/${f}.md" 2>/dev/null || true
    fi
done

# ═══════════════════════════════════════════════
echo "[2/5] opening/literature/ → raw/analysis/ + raw/inventory/"
cp "$PROJECT/opening/literature/direction_assessment_20260715.md"                raw/analysis/ 2>/dev/null || true
cp "$PROJECT/opening/literature/gpu_scheduler_data_placement_supplement_20260715.md" raw/analysis/ 2>/dev/null || true
cp "$PROJECT/opening/literature/ai_operator_literature_inventory.md"  raw/inventory/ 2>/dev/null || true
cp "$PROJECT/opening/literature/reading_list.md"                      raw/inventory/ 2>/dev/null || true

# ═══════════════════════════════════════════════
echo "[3/5] 论文 → raw/papers/"
for f in "$PROJECT"/opening/literature/reading_notes/*.md; do
    [ -e "$f" ] || continue
    cp "$f" "raw/papers/$(basename "$f")" 2>/dev/null || true
done
for f in "$PROJECT"/opening/literature/reference/*.pdf; do
    [ -e "$f" ] || continue
    cp "$f" "raw/papers/$(basename "$f")" 2>/dev/null || true
done
cp "$PROJECT/opening/literature/reference/README.md" raw/papers/ 2>/dev/null || true

# ═══════════════════════════════════════════════
echo "[4/5] experiments/plans/*.md → experiments/plans/"
for f in "$PROJECT"/experiments/plans/*.md; do
    [ -e "$f" ] || continue
    cp "$f" "experiments/plans/$(basename "$f")" 2>/dev/null || true
done
cp "$PROJECT/experiments/plans/archive/research_design_catalog.md" raw/analysis/ 2>/dev/null || true

# ═══════════════════════════════════════════════
echo "[5/5] 完成"
echo ""
echo "=== 同步完成 ==="
echo "下一步: 打开 Obsidian → Cmd+P → 'Ingest from folder' → 选 raw/"
echo ""

git status --short

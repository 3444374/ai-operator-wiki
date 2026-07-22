#!/bin/bash
# sync-wiki.sh — 项目 ↔ Obsidian wiki 双向同步
#
# 用法：
#   ./sync-wiki.sh                           # 项目 → wiki（正常同步）
#   ./sync-wiki.sh --back <wiki-file>        # wiki → 项目（把 wiki 中的修改推回项目）
#   ./sync-wiki.sh --back raw/papers/xxx.md  # 示例：推回一篇论文笔记
#
# 行为（正常同步）：
#   - 新增/修改 → 项目覆盖 wiki
#   - wiki 独有文件 → 保留
#   - wiki/moc/ 和 my-notes/ → 永不触碰
#
# 行为（--back）：
#   - 把 wiki 中编辑过的文件拷贝回项目的对应位置
#   - 适用于：在 Obsidian 里改了 raw/ 文件，想把修改保存回项目
#
# 同步后：
#   打开 Obsidian → Cmd+P → "Ingest from folder" → 选 raw/

set -e

PROJECT="${PROJECT_PATH:-../ai-operator-execution-optimization}"

# ═══════════════════════════════════════════════
# 反向同步：wiki → 项目
# ═══════════════════════════════════════════════
if [ "${1:-}" = "--back" ]; then
    WIKI_FILE="${2:-}"
    if [ -z "$WIKI_FILE" ]; then
        echo "用法: ./sync-wiki.sh --back <wiki-file>"
        echo "示例: ./sync-wiki.sh --back raw/papers/cortex_aisql_sigmod2026.md"
        exit 1
    fi
    if [ ! -f "$WIKI_FILE" ]; then
        echo "错误: 文件不存在: $WIKI_FILE"
        exit 1
    fi

    BASENAME=$(basename "$WIKI_FILE")
    DIRNAME=$(dirname "$WIKI_FILE")

    # 根据 wiki 目录反向映射到项目路径
    case "$DIRNAME" in
        raw/references)
            DST="$PROJECT/research/$BASENAME"
            ;;
        raw/papers)
            # 论文笔记 → opening/literature/reading_notes/
            # PDF → opening/literature/reference/
            if [[ "$BASENAME" == *.pdf ]]; then
                DST="$PROJECT/opening/literature/reference/$BASENAME"
            elif [ "$BASENAME" = "README.md" ]; then
                DST="$PROJECT/opening/literature/reference/$BASENAME"
            else
                DST="$PROJECT/opening/literature/reading_notes/$BASENAME"
            fi
            ;;
        raw/inventory)
            DST="$PROJECT/opening/literature/$BASENAME"
            ;;
        raw/analysis)
            # 分析文件来源分散，按文件名映射
            case "$BASENAME" in
                direction_assessment_20260715.md|gpu_scheduler_data_placement_supplement_20260715.md)
                    DST="$PROJECT/opening/literature/$BASENAME" ;;
                literature_and_evidence_review.md|existing_ai_operator_execution_chains.md)
                    DST="$PROJECT/research/$BASENAME" ;;
                research_design_catalog.md)
                    DST="$PROJECT/experiments/plans/archive/$BASENAME" ;;
                *)
                    echo "错误: raw/analysis/ 中的 '$BASENAME' 来源不确定，请手动复制"
                    echo "  项目路径可能是:"
                    echo "    $PROJECT/research/$BASENAME"
                    echo "    $PROJECT/opening/literature/$BASENAME"
                    exit 1
                    ;;
            esac
            ;;
        experiments/plans)
            DST="$PROJECT/experiments/plans/$BASENAME"
            ;;
        *)
            echo "错误: 无法识别目录 '$DIRNAME'"
            echo "支持的目录: raw/references, raw/papers, raw/inventory, raw/analysis, experiments/plans"
            exit 1
            ;;
    esac

    cp "$WIKI_FILE" "$DST"
    echo "已推回: $WIKI_FILE → $DST"
    exit 0
fi

# ═══════════════════════════════════════════════
# 正常同步：项目 → wiki
# ═══════════════════════════════════════════════

echo "=== 增量同步 项目 → Wiki ==="
echo "项目: $PROJECT"
echo ""

# ═══════════════════════════════════════════════
echo "[1/5] research/*.md → raw/references/"
for f in "$PROJECT"/research/*.md; do
    [ -e "$f" ] || continue
    cp "$f" "raw/references/$(basename "$f")" 2>/dev/null || true
done
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
echo "💡 如果在 Obsidian 里改了 raw/ 文件，用 --back 推回项目："
echo "   ./sync-wiki.sh --back raw/papers/文件名.md"
echo ""
echo "下一步: 打开 Obsidian → Cmd+P → 'Ingest from folder' → 选 raw/"
echo ""

git status --short

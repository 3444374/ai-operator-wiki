#!/bin/bash
# sync-wiki.sh — 将项目知识文件镜像到 Obsidian wiki 的 raw/ 目录
#
# 用法：
#   ./sync-wiki.sh                  # 使用默认相对路径
#   PROJECT_PATH=~/projects/ai-op ./sync-wiki.sh  # 指定项目路径
#
# 机制：
#   - 先清空目标目录，再重新拷贝 → 新增、修改、删除全部同步
#   - 用相对路径 (../ai-operator-execution-optimization) → 任何机器上只要两仓库平级即可
#   - 如需新增同步路径，在对应区块加一行 cp 即可
#
# 同步后：
#   打开 Obsidian → Cmd+P → "Ingest from folder" → 选 raw/ → 插件增量更新 wiki/

set -e

PROJECT="${PROJECT_PATH:-../ai-operator-execution-optimization}"

echo "=== 同步项目知识 → Wiki raw/ ==="
echo "项目路径: $PROJECT"
echo ""

# ── 技术参考手册 ──
echo "[1/6] 技术参考 (research/ → raw/references/)"
rm -rf raw/references/*
cp "$PROJECT/research/knowledge_hub.md"           raw/references/
cp "$PROJECT/research/vllm_continuous_batching_reference.md"  raw/references/
cp "$PROJECT/research/ray_actor_dynamic_batching_reference.md" raw/references/
cp "$PROJECT/research/daft_ray_multimodal_reference.md"       raw/references/
cp "$PROJECT/research/inference_pipeline_interaction_literature.md" raw/references/
# 新增技术参考文件在这里加（例）：
# cp "$PROJECT/research/new_reference.md" raw/references/

# ── 综合分析 ──
echo "[2/6] 综合分析 (research/ → raw/analysis/)"
rm -rf raw/analysis/*
cp "$PROJECT/research/literature_and_evidence_review.md"      raw/analysis/
cp "$PROJECT/research/existing_ai_operator_execution_chains.md" raw/analysis/
cp "$PROJECT/experiments/plans/archive/research_design_catalog.md" raw/analysis/ 2>/dev/null || true

# ── 方向评估与补充调研 ──
cp "$PROJECT/opening/literature/direction_assessment_20260715.md"               raw/analysis/
cp "$PROJECT/opening/literature/gpu_scheduler_data_placement_supplement_20260715.md" raw/analysis/
# 新增分析文件在这里加：
# cp "$PROJECT/path/to/new_analysis.md" raw/analysis/

# ── 文献清单 ──
echo "[3/6] 文献清单 (opening/literature/ → raw/inventory/)"
rm -rf raw/inventory/*
cp "$PROJECT/opening/literature/ai_operator_literature_inventory.md" raw/inventory/
cp "$PROJECT/opening/literature/reading_list.md"                   raw/inventory/

# ── 论文源文件 ──
echo "[4/7] 论文源文件 (opening/literature/ → raw/papers/)"
rm -rf raw/papers/*
# 精读笔记
cp "$PROJECT/opening/literature/reading_notes/"*.md raw/papers/ 2>/dev/null || true
# 论文 PDF（gitignored，仅本地使用）
cp "$PROJECT/opening/literature/reference/"*.pdf raw/papers/ 2>/dev/null || true
cp "$PROJECT/opening/literature/reference/README.md" raw/papers/ 2>/dev/null || true
# 新增论文在这里加：
# cp "$PROJECT/opening/literature/new_paper.md" raw/papers/

# ── 实验计划 ──
echo "[5/7] 实验计划 (experiments/plans/ → experiments/plans/)"
rm -rf experiments/plans/*
cp "$PROJECT/experiments/plans/baseline_reference.md"                    experiments/plans/
cp "$PROJECT/experiments/plans/data_organization_batching.md"            experiments/plans/
cp "$PROJECT/experiments/plans/service_scheduling_backpressure.md"       experiments/plans/
cp "$PROJECT/experiments/plans/sink_writeback_coordination.md"           experiments/plans/
cp "$PROJECT/experiments/plans/cross_layer_killer_experiment.md"         experiments/plans/
cp "$PROJECT/experiments/plans/experiment_status_and_gaps.md"            experiments/plans/
cp "$PROJECT/experiments/plans/strategy_design_implementation_reference.md" experiments/plans/
cp "$PROJECT/experiments/plans/strategy_design_literature_basis.md"      experiments/plans/

# ── 新增：自动发现（未来启用）──
echo "[6/7] 完成"
echo ""
echo "=== 同步完成 ==="
echo "下一步: 打开 Obsidian → Cmd+P → 'Karpathy LLM Wiki: Ingest from folder' → 选 raw/"
echo ""

# 显示变更统计
git status --short

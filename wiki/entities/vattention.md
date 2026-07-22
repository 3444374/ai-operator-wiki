---
type: entity
created: 2026-07-22
updated: 2026-07-22
sources: ["[[sources/db_perspective_llm_pvldb2025_300968]]"]
tags: [product]
aliases:
  - "vAttention"
  - "vAttention 内存管理"
generation_complete: true
---


# vAttention

## 描述
vAttention 是一种面向大语言模型推理的 KV cache 内存管理方案，与 [[entities/vllm|vLLM]] 中提出的 [[concepts/pagedattention|PagedAttention]] 形成并行路径。其核心创新在于利用 CUDA 原生内存分配器（CUDA allocator）来管理 [[concepts/kv-cache|KV Cache]] 的物理内存，从而将分页逻辑完全下沉到驱动层，对上层 attention kernel 完全透明。与 PagedAttention 需要专门修改 attention kernel 以感知 page table 不同，vAttention 无需实现任何 page-aware kernel，可以直接复用现有的高性能实现，例如 [[concepts/flashattention|FlashAttention]]，在保持高效内存利用的同时大幅降低工程复杂度。该方案在 PVLDB 2025 综述中被作为 KV cache 管理范式的变体明确提及，展示了在 kernel 透明性与内存虚拟化之间做出不同权衡的可能性。

## 相关实体
- [[entities/vllm|vLLM]]

## 相关概念
- [[concepts/pagedattention|PagedAttention]]
- [[concepts/kv-cache|KV Cache]]
- [[concepts/flashattention|FlashAttention]]

## 来源提及

- "vAttention 利用 CUDA 原生内存管理避免 page-aware kernel。" — [[raw/papers/db_perspective_llm_pvldb2025|db_perspective_llm_pvldb2025]]
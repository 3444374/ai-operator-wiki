# Wiki Index

> 自动生成的知识库目录

> Note: Text in backticks after page names shows aliases — alternative names, abbreviations, or translations.


## 实体

- [[entities/is-the-gpu-half-empty-or-half-full|is-the-gpu-half-empty-or-half-full]] `aliases: Kossmann et al. 2025 LLM scheduling, GPU half-empty or half-full` - “Is the GPU half-empty or half-full?” 是 Kossmann 等人于 2025 年发表的关于大语言模型（LLM）推理调度的实用技术论文。该工作聚焦于通过更精确的 [
- [[entities/bytetransformer|bytetransformer]] `aliases: ByteTransformer 推理框架` - ByteTransformer 是一个面向大语言模型推理的优化框架，其核心技术是针对不规则（ragged）张量的“重打包”（repacking）策略。该技术通过重新排列可变长度的序列来最大化 GPU 
- [[entities/turbotransformers|turbotransformers]] `aliases: TurboTransformers 推理框架, TurboTransformers` - TurboTransformers 是一个面向大语言模型（LLM）的推理框架，在本文中被引用为 batch formation 策略的早期代表性工作。其核心设计思路是通过最小化 tensor spar
- [[entities/vattention|vattention]] `aliases: vAttention, vAttention 内存管理` - vAttention 是一种面向大语言模型推理的 KV cache 内存管理方案，与 [[entities/vllm|vLLM]] 中提出的 [[concepts/pagedattention|Pag
- [[entities/deepflow|deepflow]] `aliases: DeepFlow, DeepFlow 系统, DeepFlow Serverless 推理系统` - DeepFlow 是一种面向共享云端硬件弹性伸缩的 serverless LLM 推理系统。它通过按需分配 GPU 资源实现细粒度的弹性扩展，特别面向 serverless 场景下的高效资源调度。与 
- [[entities/orca|orca]] `aliases: Orca OSDI'22, Orca System` - Orca 是由 Yu 等人提出的启发式调度系统，发表于 OSDI 2022。它首次提出了 **iteration‑level scheduling** 和 [[concepts/continuous-
- [[entities/pvldb-2025|pvldb-2025]] `aliases: PVLDB Vol. 18, PVLDB 2025, PVLDB Volume 18 Issue 12` - PVLDB 2025 指国际数据库顶级会议 VLDB（Very Large Data Bases）的官方附属期刊 **Proceedings of the VLDB Endowment** 于 202
- [[entities/sglang|sglang]] `aliases: SG-Lang, sglang` - SGLang 是一个高效的 LLM 推理框架，由 Lianmin Zheng 等人开发，专注于结构化输出生成与前缀共享优化。它采用 radix tree 进行前缀匹配、cache-aware sche
- [[entities/mooncake|mooncake]] `aliases: Mooncake System, Mooncake 分布式推理系统` - Mooncake 是一个面向高吞吐场景的分布式大语言模型（LLM）推理系统，核心架构采用 [[concepts/prefill-decode-disaggregation|Prefill/Decode
- [[entities/james-pan|james-pan]] `aliases: James Pan, Pan J, J. Pan` - James Pan 是 [[entities/清华大学|清华大学]] 计算机科学与技术系的研究人员，与 [[entities/guoliang-li|Guoliang Li]] 密切合作，共同在 [[
- [[entities/guoliang-li|guoliang-li]] `aliases: 李国良, Li G` - Guoliang Li（李国良）是[[entities/清华大学|清华大学]]计算机系教授，长期深耕数据库系统与数据科学领域。他的研究工作聚焦于多模态数据管理、AI 与数据库的深度融合，相关成果多次发
- [[entities/smart|smart]] `aliases: Smart Rewriting System, VLDB 2025 Smart` - Smart 是发表于 VLDB 2025 的一个推理重写系统，专注于对数据库中的 AI 算子进行显式重写与代价优化。与 [[entities/cortex-aisql|Cortex AISQL]] 相
- [[entities/清华大学|清华大学]] `aliases: Tsinghua University, 清华` - 清华大学是中国顶尖的研究型大学，在数据库与机器学习的交叉领域进行了前沿探索。该校作为 [[entities/gaussml|GaussML]] 系统的合作单位，提供了核心的学术研究力量——论文作者中包
- [[entities/华为|华为]] `aliases: Huawei, 华为技术有限公司` - 华为技术有限公司是中国领先的 ICT 基础设施和智能终端提供商，也是 GaussML 论文的合作单位之一。该论文由 [[entities/清华大学|清华大学]] 与华为共同完成，体现了华为在数据库与 
- [[entities/vllm|vllm]] `aliases: vLLM, Efficient LLM Serving System` - - [[entities/sglang|SGLang]]
- [[entities/snowflake|snowflake]] `aliases: Snowflake Inc., Snowflake Computing` - - [[entities/cortex-aisql|Cortex AISQL]]
- [[entities/sigmod-2026|sigmod-2026]] `aliases: ACM SIGMOD Conference 2026, ACM SIGMOD 2026` - SIGMOD 2026（ACM SIGMOD Conference 2026）是数据库领域最高水平的国际学术会议，被中国计算机学会（CCF）推荐为A类会议。该会议聚焦数据管理、数据库系统与前沿应用，是
- [[entities/sarathi-serve|sarathi-serve]] `aliases: Sarathi-Serve, sarathi-serve` - Sarathi-Serve 是一个在 OSDI 2024 上发表的研究型推理服务框架，专注于优化大语言模型（LLM）推理中的[[concepts/throughput-latency-tradeoff
- [[entities/serverlessllm|serverlessllm]] `aliases: ServerlessLLM, Serverless LLM` - ServerlessLLM 是一个面向大语言模型的无服务器推理系统，核心目标是在保证低延迟响应的同时实现极高的资源利用率。它通过**局部性策略**与**模型迁移机制**来智能调度推理负载，其架构图中清
- [[entities/ray|ray]] `aliases: Ray framework` - - [[entities/daft|Daft]]
- [[entities/ray-data|ray-data]] `aliases: Ray Data 数据处理库` - Ray Data 是 [[entities/ray|Ray]] 分布式计算框架中的核心数据处理库，专为 AI 工作负载设计，提供高性能的数据加载、转换与流式处理能力。它引入了 **异构执行（Heter
- [[entities/psycopg|psycopg]] `aliases: psycopg适配器, psycopg2` - psycopg 是 Python 语言访问 PostgreSQL 数据库的主流适配器，提供高效的数据读写与事务管理能力。在本课题的写回链路中，psycopg 作为关键的数据通道，负责将外部推理结果写回
- [[entities/pgvector|pgvector]] `aliases: pgvector扩展, PGVector` - pgvector 是 PostgreSQL 的开源扩展，支持将向量数据作为原生数据类型存储，并提供高效的向量相似度搜索（如 L2 距离、内积、余弦距离）。在 GaussML 的 [[concepts/
- [[entities/opengauss|opengauss]] `aliases: openGauss, 华为 openGauss 数据库` - openGauss 是华为研发的企业级开源关系型数据库系统，也是 [[entities/gaussml|GaussML]] 内置运行的宿主数据库引擎。GaussML 的原生 ML 算子被直接实现在 o
- [[entities/nq-dataset|nq-dataset]] `aliases: Natural Questions dataset, NQ, NQ 数据集` - NQ dataset（Natural Questions dataset）是 Google 推出的一个大规模问答数据集，广泛用于自然语言处理和信息检索任务，尤其是开放域问答与文档检索。在 [[enti
- [[entities/neurdb|neurdb]] `aliases: NeurDB, AI-driven Autonomous Database` - NeurDB 是一个设计并实现的 AI 驱动的自治数据库，旨在将 AI 技术深度集成到数据库内核中，实现自调优、自诊断和自管理，而不是将 AI 作为外部工具附加。在 README 中，NeurDB 被
- [[entities/llama-3-3-70b|llama-3-3-70b]] `aliases: Llama 3.3 70B, Meta Llama 3.3-70B` - Llama 3.3-70B 是 Meta 发布的开源大语言模型，拥有 700 亿参数。在 [[concepts/adaptive-model-cascading|Adaptive model casc
- [[entities/llama-3-1-8b|llama-3-1-8b]] `aliases: Llama 3.1 8B, Llama-3.1-8B, Meta Llama 3.1-8B` - Llama 3.1-8B 是 Meta 开源的 80 亿参数大语言模型，在 [[entities/cortex-aisql|Cortex AISQL]] 的 [[concepts/adaptive-m
- [[entities/leads|leads]] `aliases: LEADS 系统, 基于动态模型切片的数据库内分析系统` - LEADS（基于动态模型切片的数据库内分析系统）是一种结构化数据分析系统，其核心设计是在数据库内部直接执行模型推理，避免大量数据在数据库与外部机器学习平台之间移动。LEADS 通过动态决定并切分模型的
- [[entities/lance|lance]] `aliases: Lance` - Lance 是一种列式存储格式，专门针对多模态数据（例如图像、视频）进行了优化。在 [[entities/cortex-aisql|Cortex AISQL]] 论文中，Lance 被提及为外部执行技
- [[entities/icde-2024|icde-2024]] `aliases: ICDE '24, International Conference on Data Engineering 2024` - ICDE 2024（International Conference on Data Engineering）是数据库与数据工程领域的国际顶级学术会议，被中国计算机学会（CCF）推荐为 A 类会议。该
- [[entities/gaussml|gaussml]] `aliases: GaussML 系统, openGauss ML engine, GaussML` - GaussML 是内置于 [[entities/opengauss|openGauss]] 数据库的端到端数据库内机器学习系统，也是发表于 [[entities/icde-2024|ICDE 2024
- [[entities/galois|galois]] `aliases: Galois 框架, Galois Framework` - Galois 是一个专门针对大型语言模型（LLM）上 SQL 查询优化的逻辑与物理优化框架。它扩展了传统数据库的[[concepts/查询计划|查询计划]]生成方式，将[[concepts/语义操作|
- [[entities/daft|daft]] `aliases: Daft` - Daft 是一个基于 [[entities/ray|Ray]] 的分布式 DataFrame 库，专为多模态数据处理（图像、文本、视频、三维点云等）而设计。它在 [[entities/cortex-a
- [[entities/d-bot|d-bot]] `aliases: D-Bot 系统` - D-Bot 是一个利用[[concepts/大模型|大模型]]进行数据库诊断的系统，展示了 LLM 在数据库运维（AIOps）中的应用。它将数据库诊断知识、日志分析与 LLM 的推理能力相结合，辅助 
- [[entities/cortex-aisql|cortex-aisql]] `aliases: Cortex AISQL, Snowflake Cortex AISQL` - Cortex AISQL 是 [[entities/snowflake|Snowflake]] 推出的生产级 SQL 引擎，原生集成 AI 算子，可直接在 SQL 查询中对非结构化数据执行语义操作。该
- [[entities/cnn-数据集|cnn-数据集]] `aliases: CNN/Daily Mail 数据集, CNN-DailyMail, CNN` - CNN 数据集（常指 **CNN/Daily Mail** 新闻摘要数据集）是由 CNN 和 Daily Mail 新闻文章及其对应的人工摘要组成的基准数据集，广泛用于文本摘要与文档理解任务。在 [[
- [[entities/cnn-dataset|cnn-dataset]] `aliases: CNN/Daily Mail dataset, CNN-DailyMail` - CNN dataset 是一个用于图像分类或语义匹配任务的数据集，可能指代广泛使用的 CNN/Daily Mail 摘要数据集，或在特定实验中构造的自定义数据集。在 [[entities/cortex
- [[entities/apache-madlib|apache-madlib]] `aliases: MADlib` - Apache MADlib 是一个开源的数据库内机器学习库，通过用户定义函数（UDF）的形式在 PostgreSQL、Pivotal Greenplum 等 MPP 数据库中运行。它代表了传统 [[c
- [[entities/andb|andb]] `aliases: AI-native Database Demo, AnDB 演示系统` - AnDB 是一个 [[concepts/db4ai|AI 原生数据库]] 演示系统，旨在打破传统数据库边界，实现通用语义分析。该系统展示了如何将 AI 能力深度嵌入数据库核心，支持 [[concept

## 概念

- [[concepts/selective-reconstruction|selective-reconstruction]] `aliases: 选择性 KV cache 重建, Selective KV Cache Reconstruction` - Selective Reconstruction 是 [[concepts/cache-persistence|Cache Persistence]] 中与 [[concepts/prefix-sha
- [[concepts/cache-persistence|cache-persistence]] `aliases: 缓存持久化` - Cache Persistence 是 LLM 推理 Memory Management 层中的一类方法，关注如何在**不同的推理请求之间保留、复用 KV cache**，从而减少重复计算，提升整体吞
- [[concepts/eviction-&-offloading|eviction-&-offloading]] `aliases: KV cache 驱逐与卸载, Eviction and Offloading, KV Cache Eviction and Offloading` - Eviction & Offloading 是 LLM 推理系统的 Memory Management 层中，用于管理 KV cache 容量的两类互补策略。Eviction（驱逐）在 GPU 显存不
- [[concepts/cache-aware-scheduling|cache-aware-scheduling]] `aliases: 缓存感知调度, Cache-aware scheduling` - Cache-aware Scheduling 是一种面向大语言模型（LLM）推理的请求调度策略，其核心思想是**利用 KV cache 的数据局部性**，将新到达的请求优先调度到已经缓存了其所需 pr
- [[concepts/radix-tree|radix-tree]] `aliases: 基数树, 前缀树, Radix Tree` - Radix Tree（基数树）是 [[entities/sglang|sglang]] 推理系统中用于高效管理和匹配请求前缀共享的压缩前缀树数据结构。它将请求的 token 序列按前缀组织成一棵树，每
- [[concepts/greedy-least-load|greedy-least-load]] `aliases: 贪心最小负载均衡, Greedy Least Load, Least-Load First` - Greedy Least-Load（贪心最小负载）是分布式 LLM 推理系统中最通用的负载均衡策略，核心思想是将每个新到达的推理请求路由到当前负载最低的计算节点。该策略实现简单，无需维护请求状态或建立
- [[concepts/prefix-sharing|prefix-sharing]] `aliases: 前缀共享, 前缀缓存` - Prefix Sharing（前缀共享/前缀缓存）是一种在大型语言模型（LLM）推理过程中优化键值缓存（KV Cache）持久化的技术。其核心思想是：当多个推理请求具有相同的前缀序列时，系统仅计算一次
- [[concepts/ffn|ffn]] `aliases: Feed-Forward Network, 前馈网络算子` - FFN（Feed-Forward Network）是 Transformer 架构中的核心算子之一，位于 LLM 推理的 Request Processing 层，与 [[concepts/atten
- [[concepts/attention|attention]] `aliases: 注意力算子, Attention Operator, 注意力机制` - Attention 是 Transformer 架构的核心注意力计算算子，负责计算输入序列中各位置之间的相关性权重，从而生成上下文感知的表示。在 LLM 推理中，Attention 与 [[conce
- [[concepts/tbt|tbt]] `aliases: TBT, Time Between Tokens, Token 间延迟` - TBT（Time Between Tokens）是衡量自回归语言模型推理系统中解码阶段效率的核心指标，定义为生成两个连续输出 token 之间的时间间隔。它直接反映了生成每一步的延迟，是影响流式响应流
- [[concepts/token-sampler|token-sampler]] `aliases: Token 采样器` - Token Sampler 是 LLM 推理 Request Processing 层中的算子组件，负责在自回归解码的每一步根据模型输出的 logits 采样生成下一个 token。它的设计直接决定了
- [[concepts/ttft|ttft]] `aliases: Time to First Token, 首 Token 延迟` - TTFT（Time to First Token，首 Token 延迟）是大型语言模型推理系统中的一个核心延迟指标，衡量从客户端提交推理请求到系统生成第一个输出 token 之间的时间间隔。它直接反映
- [[concepts/database-perspective-on-llm-inference|database-perspective-on-llm-inference]] `aliases: 数据库视角下的LLM推理, Database Perspective on LLM Inference, LLM Inference Systems` - - [[concepts/four-layer-inference-stack|四层推理技术栈]]
- [[concepts/request-batching|request-batching]] `aliases: 请求批处理` - Request Batching（请求批处理）是一种将多个独立的推理请求动态或静态地组合成单个批次进行统一计算的技术。其核心目标是最大化 GPU 等加速器的利用率，通过提升计算密度来摊销 Kernel
- [[concepts/job-prioritization|job-prioritization]] `aliases: 任务优先级调度, Job Scheduling Priority, 作业优先级` - Job Prioritization（任务优先级调度）是指在推理系统中决定多个待处理请求调度顺序的技术。其核心目标是在延迟和吞吐之间取得平衡，通过为不同请求赋予优先级来优化系统资源利用率。该技术可类比
- [[concepts/load-balancing|load-balancing]] `aliases: 负载均衡, LB` - Load Balancing（负载均衡）是分布式推理系统中将推理请求动态分配到不同计算节点的调度策略，目标是在系统层面最大化吞吐量、最小化请求延迟。由于大型语言模型（LLM）推理任务的生命周期和资源消
- [[concepts/quantization|quantization]] `aliases: 量化, Model Quantization` - 量化（Quantization）是一种模型压缩方法，通过将神经网络中的浮点参数（weight）和激活值（activation）映射到更低比特的整数表示（如 INT8、INT4），从而大幅减小模型体积、
- [[concepts/kv-cache|kv-cache]] `aliases: 键值缓存, Key-Value Cache, KV cache` - Transformer 解码器在自回归生成过程中，缓存先前时间步计算出的 **Key** 和 **Value** 矩阵，从而避免对历史 token 重复计算的优化技术。它是大语言模型（LLM）推理阶段
- [[concepts/graph-of-thoughts|graph-of-thoughts]] `aliases: 思维图, GoT` - Graph-of-Thoughts (GoT) 是一种提升大型语言模型 (LLM) 复杂推理能力的**提示策略**。它将推理过程建模为**有向无环图 (DAG)**，其中每个节点代表一个中间“思维”步
- [[concepts/self-consistency|self-consistency]] `aliases: 自一致性, Self-Consistency, SC` - Self-Consistency（自一致性）是一种用于提升大型语言模型（LLM）输出可靠性的策略。其核心思想是对同一输入问题进行多次采样，生成多条不同的推理路径或答案，然后通过多数投票（或其他共识机制
- [[concepts/beam-search|beam-search]] `aliases: 束搜索, Beam Search 算法` - Beam Search（束搜索）是一种启发式搜索算法，广泛应用于序列生成任务。它在每一步保持固定数量（beam width）的候选序列，按得分扩展并保留最优的部分，从而在穷举搜索的高计算成本与贪心解码
- [[concepts/flashdecoding|flashdecoding]] `aliases: Flash-Decoding, Flash Decoding` - FlashDecoding 是一种针对 Transformer 模型解码阶段优化的注意力计算 CUDA kernel，旨在通过分段并行处理键值（KV）对长序列进行高效注意力计算，显著降低延迟。它是对 
- [[concepts/flashattention|flashattention]] `aliases: Flash Attention, FA` - FlashAttention 是一种 IO‑aware 的精确注意力（exact attention）计算算法，通过分块（tiling）和重计算（recomputation）技术，最小化高带宽内存（H
- [[concepts/ring-attention|ring-attention]] `aliases: Ring Attention, 环形注意力, 环形注意力机制` - Ring Attention 是一种分布式注意力计算方法，通过将长序列切割成多个块（chunk），并在多个 GPU 或计算节点之间以逻辑环（ring）的方式传递 Key 和 Value 块，从而将注意
- [[concepts/chunked-prefill|chunked-prefill]] `aliases: 分块预填充, Chunked Prefill, Prefill Interleaving` - Chunked Prefill 是一种针对大语言模型（LLM）推理的请求批处理优化技术，由 [[entities/sarathi-serve|Sarathi-Serve]] 提出。它将原本较长的 Pr
- [[concepts/internal-model-serving|internal-model-serving]] `aliases: 内部模型服务, Snowflake GPU service` - Internal model serving 是一种数据库内置的 AI 推理架构：数据库平台在其内部集群中直接部署 GPU 推理服务（如 Snowflake 的 GPU 集群），使得所有 SQL 中嵌
- [[concepts/continuous-batching|continuous-batching]] `aliases: 动态批处理, Continuous Batching` - Continuous batching 是一种 LLM 推理服务调度方法，允许在模型处理一个批次的过程中动态地添加新的请求或移除已完成的请求，突破传统静态批处理一旦开始便不可变更的限制。该技术通过最大
- [[concepts/非结构化数据|非结构化数据]] `aliases: 非结构化数据, unstructured data` - 非结构化数据指缺乏预定义数据模型或结构化模式的信息，典型形式包括自然语言文本、图像、音频等。传统关系型数据库和 SQL 引擎无法对其执行[[concepts/语义操作|语义操作]]，只能处理表中的结构
- [[concepts/语义操作|语义操作]] `aliases: 语义操作 (semantic operations), Semantic operations` - 语义操作（Semantic operations）是指对非结构化数据（文本、图像、音频等）进行语义理解与转换的一类 AI 操作，包括向量嵌入、文本生成、语义分类、过滤和聚合等。它们构成了 Cortex
- [[concepts/查询计划|查询计划]] `aliases: 执行计划, Query Plan` - - [[concepts/ai-aware-query-optimization|AI 感知查询优化]]
- [[concepts/数据预取|数据预取]] `aliases: 数据预取, Data Prefetching` - 数据预取是 [[entities/gaussml|GaussML]] 中配合 [[concepts/simd-加速|SIMD 加速]] 使用的一种底层优化技术，通过在数据被实际使用之前将其预先加载到 
- [[concepts/数据库触发|数据库触发]] `aliases: Database Triggered Execution, 数据库触发执行` - - [[concepts/外部执行链路|外部执行链路]]
- [[concepts/批量构造策略|批量构造策略]] `aliases: Batch 构造策略, Batch construction strategy` - 批量构造策略指在 AI 推理任务中，如何将输入行组织为批次（batch）、定义分区粒度以及调度任务/actor 的一整套设计方法与优化准则。其核心目标是显式控制批处理大小、并行度与执行顺序，从而在外部
- [[concepts/小模型|小模型]] `aliases: proxy model, 轻量级模型` - 小模型（proxy model）是指在 Cortex AISQL 的[[concepts/adaptive-model-cascading|自适应模型级联]]架构中充当代理的轻量级语言模型。它负责处理
- [[concepts/大模型|大模型]] `aliases: oracle model, 重量级模型` - 大模型（oracle model）是[[concepts/adaptive-model-cascading|自适应模型级联]]架构中的重量级推理组件，承担最终质量保证的角色。它仅在轻量级[[conce
- [[concepts/外部执行链路|外部执行链路]] `aliases: External execution chain, 数据库触发+外部执行+写回模式` - - [[concepts/ai-aware-query-optimization|AI-aware query optimization]]
- [[concepts/双阈值路由策略|双阈值路由策略]] `aliases: Dual-Threshold Routing` - 双阈值路由策略是[[concepts/adaptive-model-cascading|自适应模型级联]]的核心决策机制，通过设置两个置信度阈值（高阈值和低阈值）将小模型的输出置信度划分为三个区间：高
- [[concepts/原生-sql-算子集成|原生-sql-算子集成]] `aliases: Native SQL Operator Integration, 原生机器学习算子, 原生SQL算子集成` - 原生 SQL 算子集成是 GaussML 等数据库内机器学习系统采用的核心设计方法。它将分类、回归、聚类等常用的机器学习算法直接实现为数据库查询引擎内部的一等公民算子，而非通过外部用户定义函数（UDF
- [[concepts/分布式并行训练|分布式并行训练]] `aliases: 分布式机器学习, 数据库内并行训练, Distributed Parallel Training` - 分布式并行训练是 GaussML 利用 openGauss 数据库自身并行处理能力，将机器学习模型的训练与推理任务自动拆分到多个数据库节点上协同执行的一种方法。它避免了传统 ML 框架中对数据手动切片
- [[concepts/写回瓶颈|写回瓶颈]] `aliases: 结果持久化瓶颈, Write-back bottleneck` - 写回瓶颈（Write-back bottleneck）是指在机器学习与数据库交互的外部执行场景中，将 GPU 工作器或其他外部计算资源产生的结果高效地写回数据库存储时可能遇到的性能限制。该瓶颈主要出现
- [[concepts/传统-ml|传统-ml]] `aliases: 传统机器学习, Classical ML` - 传统 ML（传统机器学习）指基于统计理论与数学模型的机器学习方法，覆盖分类、回归、聚类、降维等核心任务。其典型算法包括线性回归、决策树、支持向量机（SVM）、K‑Means、随机森林等，通常运行于 C
- [[concepts/streaming-batch-model|streaming-batch-model]] `aliases: 流式批处理模型, Streaming Batch Model, SBM` - Streaming Batch Model（流式批处理模型）是一种面向分布式数据处理系统的执行模型，旨在以统一、高效且容错的方式支持流式与批量处理的异构执行。它通过流水线图（pipeline grap
- [[concepts/simd-加速|simd-加速]] `aliases: 单指令多数据加速, 向量化加速, SIMD` - SIMD（单指令多数据）加速是一种利用现代 CPU 微架构的并行流水线技术，可以在单条指令周期内对多个数据元素同时执行同一操作。在 GaussML 中，ML 算子的核心计算逻辑（如点积、激活函数、梯度
- [[concepts/semantic-join-rewrite|semantic-join-rewrite]] `aliases: 语义 Join 重写, Semantic Join Rewrite, 语义连接重写, Multi-label classification rewrite, 语义Join重写` - - [[concepts/ai_join|ai_join]]
- [[concepts/resource-lane|resource-lane]] `aliases: 资源通道, Resource Lane` - Resource Lane（资源通道）是在分布式数据处理系统中为不同类型计算任务划分的独立资源通道，每条通道拥有专属的 CPU、GPU 或内存配额，以保证执行的可预测性和故障隔离。通过将异构计算任务部
- [[concepts/prefilldecode-stage|prefilldecode-stage]] `aliases: 预填充/解码阶段, Prefill-Decode 拆分, Prefill/Decode Disaggregated` - - [[concepts/Throughput-Latency Tradeoff|Throughput-Latency Tradeoff]]
- [[concepts/predicate-pull-up|predicate-pull-up]] `aliases: 谓词上拉, Predicate Pull-Up, Predicate Pull Up` - 谓词上拉（Predicate pull-up）是一种用于**AI感知查询优化**的查询重写技术。它将计算昂贵的 AI 谓词（如 `AI_FILTER`、`AI_CLASSIFY`）从扫描侧的叶节点**
- [[concepts/pagedattention|pagedattention]] `aliases: PagedAttention` - PagedAttention 是一种面向大语言模型（LLM）推理的高效内存管理技术。它借鉴操作系统的**分页**思想，将注意力机制中的**键值缓存（KV Cache）**切分为固定大小的 **Page
- [[concepts/ml-as-udf|ml-as-udf]] `aliases: ML 用户定义函数, 机器学习UDF, ML-as-UDF` - ML‑as‑UDF 是一种在数据库内部执行机器学习任务的传统方法。它将完整的模型训练或推理逻辑封装为**用户定义函数（UDF）**，允许用户通过 SQL 语句直接调用这些函数，从而在查询中嵌入 ML 
- [[concepts/llm-inference-cost-model|llm-inference-cost-model]] `aliases: AI operator cost model, LLM cost function, 代价模型` - LLM inference cost model 是一个用于量化大语言模型推理成本的数学模型，核心公式为：
- [[concepts/importance-sampling-routing|importance-sampling-routing]] `aliases: Importance Sampling Routing, 基于重要性采样的路由, ISR, 重要性采样` - 重要性采样路由（Importance Sampling Routing）是一种用于自适应模型级联的动态样本调度方法。它利用重要性采样技术在运行时学习两个决策阈值，将每一条输入行实时划分到三个区域：**
- [[concepts/gpu-模型服务|gpu-模型服务]] `aliases: GPU Model Serving, GPU推理服务` - GPU 模型服务是一种将训练好的深度学习模型（如大语言模型、embedding 模型）部署在配备 GPU 的服务器上，通过 API 对外提供实时或批量推理计算的方法。在本课题的外部执行架构中，数据库触
- [[concepts/db4ai|db4ai]] `aliases: Database for AI, 库内AI` - DB4AI（Database for AI，或称“把模型拉进数据库”）是一种数据库系统的设计范式，其核心理念是将机器学习、深度学习等 AI 能力深度融入数据库内核，从而大幅减少数据在数据库与外部 AI
- [[concepts/arrow-recordbatch|arrow-recordbatch]] `aliases: RecordBatch, Arrow 列式数据` - Arrow RecordBatch 是 Apache Arrow 项目定义的一种列式内存数据格式，由一组具有相同长度且满足特定模式（Schema）的数组组成。RecordBatch 能够在系统间实现零
- [[concepts/ai_join|ai_join]] `aliases: AI 语义连接算子, semantic join operator` - AI_JOIN 是 [[entities/cortex-aisql|Cortex AISQL]] 中的一种 AI‑SQL 算子，用于基于语义相似性而不是精确值匹配来连接两个或多个表。它的典型用例是“找
- [[concepts/ai_filter|ai_filter]] `aliases: AI 语义过滤算子, semantic filter, AI predicate, AI 谓词` - - [[concepts/ai-aware-query-optimization|AI 感知查询优化]]
- [[concepts/ai_embed|ai_embed]] `aliases: AI 嵌入算子, embedding operator` - AI_EMBED 是 [[entities/cortex-aisql|Cortex AISQL]] 中六类 AI SQL 算子之一，专门用于生成向量嵌入。该算子能够从非结构化数据（如文本、图像）中提取
- [[concepts/ai_complete|ai_complete]] `aliases: AI 文本生成算子, completion operator, AI_COMPLETE算子` - AI_COMPLETE 是 [[entities/cortex-aisql|Cortex AISQL]] 中定义的六类原生 AI SQL 算子之一，对应**文本生成**类任务。它使 SQL 查询能够直
- [[concepts/ai_classify|ai_classify]] `aliases: AI 分类算子, classification operator, AI classifier` - AI_CLASSIFY 是 [[entities/cortex-aisql|Cortex AISQL]] 中的六类 AI SQL 算子之一，属于 AI 谓词类别。它执行分类任务，接受输入数据并输出一个
- [[concepts/ai_agg|ai_agg]] `aliases: AI 语义聚合算子, AI_SUMMARIZE_AGG, semantic aggregation operator` - AI_AGG 是 [[entities/cortex-aisql|Cortex AISQL]] 中用于语义聚合与摘要的 AI SQL 算子，核心变体为 `AI_SUMMARIZE_AGG`。它利用大语
- [[concepts/ai-函数作为-udf|ai-函数作为-udf]] `aliases: UDF 嵌入 AI 函数, AI as UDF` - **AI 函数作为 UDF**（AI as a User‑Defined Function）是一种将 AI 模型（如 LLM）包装为普通 SQL 用户定义函数、通过 `SELECT ai_fn(...
- [[concepts/ai-sql-operators|ai-sql-operators]] `aliases: Six AI SQL operators, 六大 AI SQL 算子, AI SQL 算子` - **AI SQL operators** 是由 [[entities/cortex-aisql|Cortex AISQL]] 定义的一组六个 AI 原生 SQL 算子，使关系型 SQL 引擎能够直接在
- [[concepts/ai-aware-query-optimization|ai-aware-query-optimization]] `aliases: AI 感知查询优化, AI-aware optimization, AI感知查询优化, ML 感知优化器, ML感知优化器` - - [[concepts/llm-inference-cost-model|LLM 推理代价模型]]
- [[concepts/adaptive-model-cascading|adaptive-model-cascading]] `aliases: 自适应模型级联, Adaptive Model Cascading` - 一种降低 AI 推理成本的技术：以轻量级小模型（proxy）处理大多数输入行，仅在 proxy 置信度不足时才调用高精度大模型（oracle）进行判断。通过基于重要性采样的双阈值路由策略动态学习决策边

## 来源

- [[sources/db_perspective_llm_pvldb2025_300968|db_perspective_llm_pvldb2025_300968]] `aliases: DB视角LLM推理系统 (PVLDB 2025), 数据库视角LLM推理系统教程, DB Perspective LLM Inference (PVLDB 2025)`
- [[sources/readme_425fbb|readme_425fbb]] `aliases: 本地参考PDF子集, Local Reference PDFs`
- [[sources/gaussml_icde2024_577060|gaussml_icde2024_577060]] `aliases: GaussML 精读笔记, GaussML ICDE 2024 路线对照分析`
- [[sources/cortex_aisql_sigmod2026_c18b08|cortex_aisql_sigmod2026_c18b08]] `aliases: Cortex AISQL 精读笔记, Cortex AISQL (SIGMOD 2026) 笔记, Cortex AISQL (SIGMOD 2026)`

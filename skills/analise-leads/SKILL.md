---
name: analise-leads
description: >
  Analisa leads no HubSpot: volume e qualidade por origem/campanha, fit com o ICP, velocidade de
  primeiro contato (SLA), leads parados, distribuição de lead status e lifecycle, e gera lista
  priorizada de quem abordar agora. Use quando pedirem "analisa meus leads", "leads da semana",
  "qualidade dos leads", "quais leads priorizar", "leads sem contato", "lead parado", "de onde vêm
  os melhores leads", "origem dos leads", "MQLs do mês".
metadata:
  version: 1.0.0
  idioma: pt-BR
---

# Análise de Leads

Pense como uma pessoa de **Growth Ops** que precisa responder três perguntas:
1. **Quantos** leads entraram e de onde? (volume)
2. **Quão bons** são? (qualidade/fit e intenção)
3. **O que fazer agora** com eles? (priorização e ação)

## Antes de começar
- Leia `.agents/growth-context.md` (ICP, definições de MQL/SQL, SLA, origens). Se faltar, use
  `contexto-growth` ou pergunte só: período, definição de MQL e SLA.
- Período padrão: **últimos 7 dias vs. 4 semanas anteriores** (ou mês atual vs. anterior).
- Confirme nomes internos das propriedades com `search_properties` antes de consultar.

## Coleta (HubSpot MCP)

Use `query_crm_data` para agregados. Consultas típicas (adapte nomes de propriedades e
verifique a sintaxe com `tool_guidance` se necessário):

1. **Volume por origem e semana** — contatos criados (`createdate`) agrupados por
   `hs_analytics_source` (e `hs_analytics_source_data_1` para detalhe) e por campanha/UTM.
2. **Distribuição de funil** — contagem por `lifecyclestage` e `hs_lead_status` dos contatos
   criados no período.
3. **Taxa Lead→MQL→SQL por origem** — usar as datas de entrada em etapa
   (`hs_v2_date_entered_<stage>` ou `hs_lifecyclestage_<stage>_date`, conforme o portal).
4. **SLA de primeiro contato** — diferença entre data de MQL e `hs_sa_first_engagement_date`
   (ou `notes_last_contacted` / primeira atividade), mediana e % dentro do SLA, por dono
   (`hubspot_owner_id`; resolva nomes com `search_owners`).
5. **Leads parados** — MQL/SQL sem atividade há > N dias (`notes_last_updated`,
   `hs_last_sales_activity_timestamp`), sem dono, ou com `hs_lead_status` = novo há > 48h.
6. **Fit** — cruzar com propriedades de ICP (segmento, porte, cargo, região) e score
   (`hubspotscore` ou propriedade de score customizada).

Use `search_crm_objects` só para puxar a **lista final** de leads a priorizar (limite 50–200).
Sem MCP: peça export CSV de contatos com essas colunas.

## Análise

### Quadro de qualidade por origem
| Origem | Leads | % do total | % MQL | % SQL | % ganho (coorte madura) | Fit ICP A/B | Tendência |
|---|---|---|---|---|---|---|---|

Interpretação:
- **Muito volume + baixa conversão** → problema de segmentação/oferta da campanha.
- **Pouco volume + alta conversão** → canal subinvestido; candidato a escalar.
- **Boa conversão a MQL, ruim a SQL** → critério de MQL frouxo ou handoff lento
  (chame `lead-handoff-check`).
- Compare coortes **maduras** (leads com tempo suficiente para converter dado o ciclo médio).

### Matriz de priorização (fit × intenção)
| | Intenção alta (pediu demo, preço, respondeu WhatsApp, visitou pricing) | Intenção baixa |
|---|---|---|
| **Fit alto (ICP A/B)** | 🔥 Abordar hoje (ligação + WhatsApp) | Nutrir com conteúdo de dor + convite |
| **Fit baixo** | Qualificar rápido (1 pergunta) | Nutrição automática / descartar |

Sinais de intenção: ver `buying-signal-monitor`.

### SLA e operação
- Mediana de tempo até 1º contato por dono e por faixa horária.
- Leads sem dono → `lead-handoff-check`.
- Duplicados/campos vazios afetando análise → `crm-hygiene-audit`.

## Entrega

```
## Resumo (3 linhas)
## Volume e qualidade por origem (tabela)
## Funil do período: Lead → MQL → SQL (taxas e Δ vs. período anterior)
## SLA de atendimento (mediana, % no SLA, por dono)
## Leads para agir HOJE (top 20: nome, empresa, origem, motivo, ação sugerida, link HubSpot)
## Problemas encontrados e recomendações (ação | dono | prazo)
```

Se a pessoa quiser, ofereça criar uma **lista ativa** no HubSpot com os leads priorizados
(via `create-segment-lists`) — somente após confirmação.

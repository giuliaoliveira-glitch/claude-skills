---
name: analise-funil
description: >
  Analisa o funil completo de aquisição no HubSpot — do lead ao cliente — e o funil de vendas
  (pipeline de negócios): conversão por etapa, coortes, velocidade (tempo entre etapas), quebra por
  origem/campanha/dono, gargalos e projeção contra a meta. Use quando pedirem "como está o funil",
  "onde o funil vaza", "taxa de conversão", "funil de vendas", "funil de leads", "por que caiu",
  "tempo de ciclo", "vamos bater a meta?", "relatório de funil", "coorte".
metadata:
  version: 1.0.0
  idioma: pt-BR
---

# Análise de Funil (Leads + Vendas)

Objetivo: dizer **onde** o funil está perdendo volume, **para quem** (segmento/origem/dono),
**desde quando**, e **o que fazer** — com números comparáveis.

## Antes de começar
- Leia `.agents/growth-context.md` (definições oficiais de etapa, pipeline, meta, ciclo médio).
- Confirme: período, pipeline(s) de negócio, meta do período.
- Mapeie as etapas reais via `discover_hubspot_schema` / `get_properties` (lifecyclestage e
  dealstage com IDs internos). Não presuma nomes.

## Dois funis, uma visão

```
FUNIL DE LEADS (contatos)          FUNIL DE VENDAS (negócios)
Visitante → Lead → MQL → SQL  ──►  Oportunidade → Proposta → Negociação → Ganho/Perdido
```
O elo entre eles (SQL → Oportunidade) é onde mais se perde informação: verifique se todo SQL
gera negócio e se o negócio está associado ao contato/empresa de origem.

## Coleta (HubSpot MCP — `query_crm_data`)

1. **Funil de etapa (snapshot de fluxo)**: quantos contatos *entraram* em cada etapa no período,
   usando datas de entrada em etapa (`hs_v2_date_entered_*` / `hs_lifecyclestage_*_date`).
2. **Funil de coorte**: dos leads criados no mês M, quantos chegaram a MQL, SQL, oportunidade e
   cliente até hoje. Use coortes mensais dos últimos 6 meses. *Coorte é a forma correta de medir
   conversão; snapshot mistura períodos.*
3. **Negócios**: por `dealstage` e `pipeline` — quantidade, valor (`amount`), taxa de passagem
   entre etapas, win rate (ganhos / (ganhos+perdidos)), ticket médio, `closed_lost_reason`.
4. **Velocidade**: mediana de dias entre etapas (lead→MQL, MQL→SQL, SQL→opp, opp→ganho) e
   `days_to_close`.
5. **Quebras**: por origem (`hs_analytics_source`), campanha/UTM, segmento ICP, dono, região.

Sem MCP: peça export de contatos (com datas de etapa) e de negócios (com histórico de etapas).

## Cálculos padrão

| Métrica | Fórmula |
|---|---|
| Conversão etapa→etapa | entraram na etapa N+1 / entraram na etapa N (mesma coorte) |
| Conversão ponta a ponta | clientes / leads (coorte madura) |
| Win rate | ganhos / (ganhos + perdidos) no período |
| Velocidade do pipeline | (nº oportunidades × win rate × ticket médio) / ciclo em dias |
| Cobertura de meta | pipeline aberto ponderado / meta restante |
| Projeção | volume atual de cada etapa × taxas históricas → clientes esperados |

Regras de leitura:
- Compare sempre: período anterior, média de 3 meses e meta.
- Destaque variações > 20% **e** com n ≥ 30; abaixo disso, marque como "sinal fraco".
- Uma queda em etapa tardia pode ser efeito de **mix** (mais leads de canal pior no topo).
  Quebre por origem antes de concluir.

## Diagnóstico por etapa (hipóteses típicas)

| Onde vaza | Hipóteses comuns | Skill para aprofundar |
|---|---|---|
| Visita → Lead | LP/oferta fraca, formulário longo, tráfego desalinhado | `cro`, `offers`, `ab-testing` |
| Lead → MQL | público errado, isca atrai curiosos, critério de MQL alto | `analise-leads`, `lead-scoring-designer` |
| MQL → SQL | SLA lento, roteamento, critério frouxo, SDR sobrecarregado | `lead-handoff-check` |
| SQL → Oportunidade | qualificação ruim, negócio não criado no CRM | `crm-hygiene-audit` |
| Oportunidade → Ganho | preço, concorrência, proposta, follow-up fraco | `pipeline-review`, `closed-lost-revival` |
| Ciclo longo | muitos decisores, falta de urgência | `marketing-psychology`, `offers` |

## Entrega

```
## Resumo executivo (3 linhas: estamos/não estamos no ritmo da meta e por quê)
## Funil do período (tabela: etapa | volume | conv. | anterior | média 3m | meta | Δ)
## Funil de coorte (últimos 6 meses)
## Velocidade (mediana de dias por transição)
## Onde vaza e para quem (top 3 gargalos com evidência)
## Projeção vs. meta (cenário atual, otimista, pessimista)
## Plano de ação (ação | etapa | dono | prazo | impacto estimado) — priorizado por ICE
```

Se pedirem visual, gere gráfico de funil e de coortes (use a skill `dataviz` se disponível).
Ofereça salvar o relatório como **relatório salvo no HubSpot** (`manage_saved_reports`) quando
fizer sentido — sempre com confirmação.

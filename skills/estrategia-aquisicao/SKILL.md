---
name: estrategia-aquisicao
description: >
  Desenha a estratégia de aquisição de novos clientes: meta reversa (funil invertido a partir da
  meta de receita), ICP e segmentos prioritários, mix de canais (inbound, outbound, mídia paga,
  WhatsApp, parcerias, indicação), economia unitária (CAC, LTV, payback), orçamento, backlog de
  experimentos priorizado (ICE) e rituais da mesa de growth. Use para "estratégia de aquisição",
  "plano de growth", "como bater a meta", "quantos leads preciso", "qual canal investir",
  "planejamento trimestral", "OKRs de aquisição", "backlog de experimentos".
metadata:
  version: 1.0.0
  idioma: pt-BR
---

# Estratégia de Aquisição de Novos Clientes

Princípio: **estratégia = escolher onde NÃO jogar**. Concentre esforço nos segmentos e canais
com melhor economia unitária comprovada, e use experimentos baratos para descobrir os próximos.

## 1. Diagnóstico de partida (use dados, não opinião)
- Rode `analise-funil` (coortes dos últimos 6 meses) → taxas reais por etapa e por origem.
- Rode `analise-leads` → qualidade por canal.
- Clientes ganhos nos últimos 12 meses: segmento, porte, origem, ciclo, ticket → base do ICP
  (`ideal-customer-finder`, `create-icp-tiers`).

## 2. Meta reversa (funil invertido)

```
Meta de novos clientes no período .......... C
÷ win rate (opp→ganho) ..................... = Oportunidades necessárias
÷ taxa SQL→opp ............................. = SQLs necessários
÷ taxa MQL→SQL ............................. = MQLs necessários
÷ taxa Lead→MQL ............................ = Leads necessários
÷ conversão visita→lead (por canal) ........ = Tráfego/alcance necessário
```
Faça por **canal** (cada canal tem taxas diferentes) e ajuste pelo **ciclo de venda**: leads que
viram cliente neste trimestre precisam entrar X dias antes. Mostre em tabela e com 3 cenários.

## 3. Economia unitária por canal

| Canal | Custo (mídia + time + ferramenta) | Clientes | CAC | Ticket | LTV | LTV/CAC | Payback (meses) |
|---|---|---|---|---|---|---|---|

- LTV/CAC ≥ 3 e payback ≤ 12 meses (B2B) → escalar.
- Canal sem dado de cliente (só lead) → não há como julgar; corrija atribuição (`attribution`).

## 4. Mix de canais (matriz)

| Canal | Quando funciona | Papel no plano |
|---|---|---|
| Inbound / conteúdo / SEO | ciclo longo, ticket médio-alto, demanda existente | base de longo prazo |
| Mídia paga (Google, Meta, LinkedIn) | demanda ativa, LP e oferta afinadas | volume previsível |
| Click-to-WhatsApp ads | B2C e PME no Brasil, resposta rápida | conversa imediata |
| Outbound (e-mail, ligação, LinkedIn) | ICP bem definido, ticket alto | contas-alvo → `prospecting` |
| WhatsApp para base (CRM) | base com opt-in, reativação | conversão de base existente → `whatsapp-hubspot` |
| Indicação / parcerias | clientes satisfeitos, ecossistema | menor CAC → `referrals` |
| Eventos / webinars | educação de mercado, enterprise | aceleração de ciclo |

Use o modelo **70/20/10**: 70% do esforço no que já funciona, 20% em otimizar/escalar
promissores, 10% em apostas novas.

## 5. Backlog de experimentos (ICE)

| # | Hipótese ("Se..., então..., porque...") | Etapa do funil | Métrica | I | C | E | ICE | Dono | Status |
|---|---|---|---|---|---|---|---|---|---|

- Impacto, Confiança, Facilidade de 1 a 10; ICE = média.
- Cada experimento tem tamanho de amostra e prazo (`ab-testing`), e resultado registrado.
- Ideias: `offers`, `lead-magnets`, `marketing-psychology`, `cro`, `referrals`.

## 6. Rituais da mesa de growth
- **Diário (15 min)**: leads quentes do dia, SLA, respostas de WhatsApp pendentes.
- **Semanal (45 min)**: playbook "Diagnóstico semanal" do `maestro-crm-growth`; status dos
  experimentos; decisões.
- **Mensal**: coortes, CAC por canal, realocação de orçamento.
- **Trimestral**: revisão de ICP, metas e estratégia (esta skill).

## Entrega
```
## Tese de aquisição (3–5 frases: para quem, por onde, por que vamos ganhar)
## Meta reversa por canal (3 cenários)
## Economia unitária e decisão por canal (escalar / manter / testar / cortar)
## Orçamento e capacidade do time
## Backlog de experimentos priorizado (top 10)
## Calendário de campanhas do período
## KPIs e rituais de acompanhamento
```
Salve as premissas e metas em `.agents/growth-context.md`.

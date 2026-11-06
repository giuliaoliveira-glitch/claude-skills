---
name: campanha-hubspot
description: >
  Cria e estrutura campanhas de aquisição dentro do HubSpot de ponta a ponta: objetivo e meta,
  público/listas, oferta, objeto de Campanha, padrão de UTMs, assets (e-mail, landing page,
  formulário, WhatsApp, posts, anúncios), workflows de nutrição e handoff, plano de testes e
  relatório de atribuição. Use para "criar campanha no HubSpot", "montar campanha de aquisição",
  "lançar campanha", "briefing de campanha", "estrutura de UTMs", "campanha de evento/webinar",
  "campanha de conteúdo rico", "resultado da campanha".
metadata:
  version: 1.0.0
  idioma: pt-BR
---

# Campanhas de Aquisição no HubSpot

Toda campanha precisa responder: **para quem, com que oferta, por qual canal, para gerar quantos
SQLs/clientes, e como vamos saber se funcionou.**

## 1. Briefing (1 página)

```
Nome da campanha: [AAAA-MM]_[objetivo]_[público]_[oferta]   ex.: 2026-11_aquisicao_varejo-medio_diagnostico
Objetivo: (gerar MQL / SQL / reunião / venda)
Público: ICP tier, cargo, segmento, tamanho estimado da audiência
Oferta/isca: (diagnóstico, demo, e-book, webinar, condição comercial)
Canais: e-mail, WhatsApp, LP, mídia paga, social, outbound
Meta reversa: clientes ← oportunidades ← SQLs ← MQLs ← leads ← alcance
Orçamento e CAC alvo
Datas: início, fim, marcos
Dono e time envolvido
```
Use `estrategia-aquisicao` para a meta reversa e `offers`/`lead-magnets` para a oferta.

## 2. Estrutura no HubSpot (ordem de criação)

1. **Objeto de Campanha** (Marketing › Campanhas) com nome padronizado, datas, orçamento, dono.
   Via MCP: `manage_campaign_objects` (após confirmação).
2. **Padrão de UTM** (minúsculas, sem acento, hífen):
   `utm_source` (google, meta, linkedin, whatsapp, email, parceiro) ·
   `utm_medium` (cpc, paid-social, crm, email, organic, referral) ·
   `utm_campaign` = nome da campanha · `utm_content` = variação/criativo ·
   `utm_term` = palavra-chave/público.
3. **Listas**: público-alvo, supressões (clientes, opt-outs, concorrentes, em negociação),
   e lista de conversão (quem preencheu o formulário). → `create-segment-lists`.
4. **Formulário + Landing page** (LP com 1 objetivo, formulário curto, campo de opt-in de
   WhatsApp não pré-marcado, campo oculto de origem). Via MCP: `manage_landing_page`. → `cro`.
5. **E-mails** (convite, lembrete, entrega da isca, follow-up). Via MCP: `manage_marketing_email`.
   → `emails`, `copywriting`.
6. **WhatsApp** (template + régua). → `whatsapp-hubspot`.
7. **Workflows**:
   - Entrega da isca + marcação de origem/campanha no contato
   - Nutrição (3–5 toques, saída ao virar SQL)
   - Handoff: ao atingir critério de MQL → atribui dono, cria tarefa, notifica (SLA) → `lead-handoff-check`
   - Atualização de lifecycle → `lifecycle-progression-workflow`
8. **Associe todos os assets à campanha** (e-mails, LP, formulários, posts, anúncios, URLs
   rastreadas) para a atribuição funcionar.

## 3. Plano de testes
Uma hipótese por vez, com métrica e tamanho de amostra → `ab-testing`.
Ex.: "Assunto com número aumenta abertura em 10%" / "LP com prova social aumenta conversão".

## 4. Checklist de lançamento
- [ ] Campanha criada e todos os assets associados
- [ ] UTMs testadas (clique → contato com origem correta no HubSpot)
- [ ] Formulário testado (contato criado, lista atualizada, workflow disparado, dono atribuído)
- [ ] Supressões aplicadas; consentimento verificado (e-mail e WhatsApp)
- [ ] Time comercial avisado (oferta, script, SLA)
- [ ] Dashboard/relatório da campanha pronto antes do início

## 5. Medição (D+1, D+7, D+30, fim)
Use `read_campaign_data`, `get_campaign_attribution_reports`, `get_marketing_email_analytics`.

| Etapa | Métrica | Meta | Real |
|---|---|---|---|
| Alcance | impressões / envios | | |
| Engajamento | CTR, abertura, respostas WhatsApp | | |
| Leads | novos contatos, custo por lead | | |
| MQL / SQL | volume e taxa | | |
| Oportunidades | qtd e valor | | |
| Clientes | qtd, receita, CAC | | |

Atribuição: compare primeiro toque × último toque × multitoque → `attribution`,
`channel-attribution`. Leve até venda com `analise-funil`.

## Entrega
Briefing + estrutura de criação (lista de tudo que será criado no HubSpot, com nomes) +
calendário + checklist + plano de medição. Peça confirmação antes de criar qualquer item via MCP.

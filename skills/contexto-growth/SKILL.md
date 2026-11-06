---
name: contexto-growth
description: >
  Cria e mantém o arquivo de contexto da mesa de growth (.agents/growth-context.md): o que a
  empresa vende, ICP, personas, oferta, canais de aquisição, definições de funil e lifecycle no
  HubSpot, metas, SLAs, regras de WhatsApp e LGPD. Use antes de qualquer outra skill de growth
  quando o contexto não existir, ou quando pedirem "configura meu contexto", "atualiza o ICP",
  "mudou a meta", "mudou o funil", "novo produto". As demais skills leem este arquivo.
metadata:
  version: 1.0.0
  idioma: pt-BR
---

# Contexto de Growth

Objetivo: capturar **uma vez** tudo que as outras skills precisam saber, para que nenhuma delas
precise perguntar de novo. Leia antes de perguntar: site da empresa, HubSpot (via MCP) e arquivos
existentes (`.agents/product-marketing.md`, `company-context.md`).

## Como coletar

1. **Leia o que já existe.** Se houver HubSpot MCP:
   - `get_organization_details` → nome, fuso, moeda, Hubs contratados
   - `discover_hubspot_schema` → pipelines de negócio e suas etapas, objetos customizados
   - `get_properties` (contacts) → opções de `lifecyclestage`, `hs_lead_status`, propriedades de
     origem, score, segmento, consentimento WhatsApp
   - `query_crm_data` → distribuição de contatos por lifecycle e origem nos últimos 90 dias
2. **Pergunte só o que faltar**, em um bloco único (máx. 8 perguntas).
3. **Escreva o arquivo** e mostre um resumo para a pessoa validar.

## Template do arquivo `.agents/growth-context.md`

```markdown
# Contexto de Growth — <Empresa>
Atualizado em: DD/MM/AAAA

## Negócio
- O que vendemos / modelo (B2B, B2C, SaaS, serviço, ticket médio, ciclo médio de venda)
- Diferenciais e provas (cases, números)
- Concorrentes principais

## ICP e personas
- ICP (segmento, porte, região, cargo decisor) + tiers (A/B/C)
- Quem NÃO é cliente (desqualificadores)
- Gatilhos de compra (situações que fazem o lead agir)
- Objeções mais comuns

## Funil no HubSpot (definições oficiais)
| Etapa | Definição | Propriedade/valor no HubSpot | Dono |
|---|---|---|---|
| Lead | ... | lifecyclestage = lead | Marketing |
| MQL | critério (score ≥ X ou ação Y) | lifecyclestage = marketingqualifiedlead | Marketing |
| SQL | aceito por vendas | lifecyclestage = salesqualifiedlead | SDR |
| Oportunidade | negócio criado | dealstage = ... | Closer |
| Cliente | ganho | lifecyclestage = customer | — |
- Pipeline(s) de negócio e etapas (com IDs internos)
- SLA de 1º contato (ex.: MQL atendido em até 15 min no horário comercial)

## Canais de aquisição
- Canais ativos, verba mensal por canal, padrão de UTM usado
- Fontes no HubSpot (hs_analytics_source / campo customizado de origem)

## Metas
- Meta do período: clientes, receita, SQLs, MQLs, CAC máximo
- Taxas históricas de conversão (se conhecidas)

## WhatsApp
- Número(s) conectados ao HubSpot, tier de limite atual, quality rating
- Templates aprovados (nome, categoria, objetivo)
- Regra de consentimento (propriedade/assinatura de marketing WhatsApp)
- Janela de horários permitida, frequência máxima por contato

## Regras e restrições
- LGPD / base legal usada; listas de supressão obrigatórias
- Tom de voz, palavras proibidas, aprovações necessárias
```

## Compatibilidade com skills curadas

Depois de salvar, crie também (cópia ou link) para que as skills em inglês encontrem o contexto:
- `.agents/product-marketing.md` (usado pelas skills de marketing)
- `company-context.md` na raiz do projeto (usado pelas skills de RevOps)

Se já existirem, **não sobrescreva**: mescle e mostre o diff.

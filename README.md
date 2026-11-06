# Maestro CRM & Growth — Claude Skills

Kit de skills para a **mesa de growth** focada em **aquisição de novos clientes** no **HubSpot**:
analisar leads, analisar funil de leads e de vendas, criar campanhas, planejar disparos de
**WhatsApp** e desenhar a estratégia de aquisição.

O ponto de entrada é a skill **`maestro-crm-growth`**: ela entende o pedido, escolhe as skills
especialistas, executa na ordem certa e entrega um resultado único (resumo, números, diagnóstico
e próximas ações).

## Como usar

Exemplos de pedidos:
- "Maestro, faz o diagnóstico semanal do funil e dos leads."
- "Analisa os leads que entraram essa semana e me diz quem priorizar."
- "Onde o funil está vazando no último trimestre?"
- "Monta uma campanha de aquisição para clínicas de médio porte com disparo de WhatsApp."
- "Cria o template e o checklist para um disparo de WhatsApp de reativação de perdidos."
- "Monta a estratégia de aquisição do Q1 com meta reversa por canal."

Funciona melhor com o **conector HubSpot** habilitado (o maestro usa `query_crm_data`,
`search_crm_objects`, `discover_hubspot_schema` etc.). Sem conector, trabalhe com exports CSV.
Ações que escrevem no HubSpot sempre pedem confirmação antes.

Primeira vez? Rode **`contexto-growth`** para criar `.agents/growth-context.md` (ICP, funil,
metas, regras de WhatsApp). Todas as skills reaproveitam esse arquivo.

## Instalação

**Claude Code (plugin):**
```bash
/plugin marketplace add giuliaoliveira-glitch/claude-skills
/plugin install maestro-crm-growth@giulia-claude-skills
```

**Claude Code (manual):** copie as pastas de `skills/` para `~/.claude/skills/` (pessoal) ou
`.claude/skills/` (projeto).

**claude.ai / Claude Desktop:** rode `./scripts/empacotar-skills.sh` e faça upload dos `.zip`
de `dist/` em Configurações › Capacidades › Skills (comece pelo `maestro-crm-growth` e pelas
skills autorais).

## Skills

### Autorais (pt-BR)
| Skill | Para quê |
|---|---|
| `maestro-crm-growth` | Orquestrador: roteia pedidos, playbooks encadeados, padrão de entrega |
| `contexto-growth` | Cria o arquivo de contexto (ICP, funil no HubSpot, metas, WhatsApp, LGPD) |
| `analise-leads` | Volume/qualidade por origem, SLA, leads parados, priorização fit × intenção |
| `analise-funil` | Funil de leads + vendas, coortes, velocidade, gargalos, projeção vs. meta |
| `campanha-hubspot` | Briefing, UTMs, listas, LP, e-mails, workflows, checklist e medição |
| `whatsapp-hubspot` | Público com opt-in, templates Meta, limites, réguas, checklist e métricas |
| `estrategia-aquisicao` | Meta reversa, CAC/LTV por canal, mix 70/20/10, backlog ICE, rituais |

### Curadas do mercado (inglês, MIT)
| Origem | Skills |
|---|---|
| [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) | `revops`, `sms` (com referência completa de WhatsApp Business), `emails`, `ab-testing`, `lead-magnets`, `copywriting`, `marketing-psychology`, `attribution`, `product-marketing`, `offers`, `referrals`, `customer-research`, `cro`, `prospecting` |
| [revops-lab/agents](https://github.com/revops-lab/agents) | `company-context`, `lead-handoff-check`, `crm-hygiene-audit`, `lead-scoring-designer`, `ideal-customer-finder`, `closed-lost-revival`, `buying-signal-monitor`, `pipeline-review`, `channel-attribution`, `weekly-marketing-report` |
| [tomgranot/hubspot-admin-skills](https://github.com/tomgranot/hubspot-admin-skills) | `connect-hubspot-mcp`, `build-lead-scoring`, `create-icp-tiers`, `lifecycle-progression-workflow`, `fix-lifecycle-stages`, `build-smart-lists`, `create-segment-lists`, `hubspot-marketing-audit`, `hubspot-sales-audit`, `engagement-suppression-workflow` |

As skills da Tom Granot com pasta `scripts/` usam a API do HubSpot com token de app privado em
`.env` (`HUBSPOT_ACCESS_TOKEN`); rode sempre o `before.py` (dry-run) antes do `execute.py`.

Créditos e licenças: veja [`third_party/NOTICE.md`](third_party/NOTICE.md).

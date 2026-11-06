---
name: whatsapp-hubspot
description: >
  Planeja, escreve, valida e mede disparos e réguas de WhatsApp feitos dentro do HubSpot
  (WhatsApp Business Platform conectado ao Marketing Hub/Inbox): objetivo, público e lista,
  consentimento (assinatura de marketing WhatsApp + LGPD), templates Meta (categoria, variáveis,
  botões), limites de envio e quality rating, horários, workflows, testes A/B e medição até o
  funil de vendas. Use para "disparo de WhatsApp", "campanha de WhatsApp", "template de WhatsApp",
  "régua de WhatsApp", "lista para WhatsApp", "mensagem para leads no WhatsApp", "reativar base
  pelo WhatsApp", "resultado do disparo".
metadata:
  version: 1.0.0
  idioma: pt-BR
---

# WhatsApp no HubSpot — Disparos e Réguas de Aquisição

No Brasil o WhatsApp é o canal de maior resposta, e por isso também o que mais **queima número**
quando mal usado. Seu trabalho: gerar conversa qualificada (e venda) **sem** derrubar o quality
rating nem violar consentimento.

Referência técnica completa da Meta (janela de 24h, categorias, limites, erros): leia
o arquivo `references/whatsapp.md` da skill `sms` (neste repositório: `skills/sms/references/whatsapp.md`). Abaixo está a camada operacional para o HubSpot.

> Políticas da Meta e recursos do HubSpot mudam com frequência. Antes de prometer limites,
> preços ou funcionalidades, confirme na central de ajuda do HubSpot e no WhatsApp Manager.

---

## 1. Briefing (pergunte só o que não estiver no contexto)

- **Objetivo**: gerar reunião/demo, recuperar lead frio, convite para evento, oferta, reativar
  perdidos, nutrir? → define a métrica principal (respostas, reuniões, SQLs, vendas).
- **Público**: quem (lifecycle, origem, score, ICP tier), quantos, última interação.
- **Oferta / CTA**: o que a pessoa ganha ao responder.
- **Quem atende as respostas** e em que horário (sem time para responder = não dispare).
- **Template**: já existe aprovado ou precisa criar?

## 2. Público e lista (no HubSpot)

Monte uma **lista ativa** (ou estática para disparo pontual) com:
- ✅ Assinatura de **marketing WhatsApp** = opt-in (o HubSpot bloqueia envio de template de
  marketing para quem não tem opt-in; consentimento desconhecido ≠ consentimento).
- ✅ Telefone válido em formato internacional (`+55DDDNÚMERO`), sem duplicados.
- ❌ Excluir: clientes atuais (se campanha de aquisição), negócios abertos em etapa avançada,
  quem recebeu WhatsApp de marketing nos últimos X dias, opt-outs, bounces, concorrentes,
  contatos sem dono quando a resposta exige vendedor.
- Prefira os mais **quentes** primeiro (interação recente) — protege o quality rating.

Ferramentas: `create-segment-lists`, `build-smart-lists`, `engagement-suppression-workflow`.
Via MCP: `manage_segment` / `query_segments` (com confirmação antes de criar).

**Coleta de opt-in** (para crescer a base disparável): checkbox não pré-marcado em formulários
("Quero receber conteúdos e ofertas da <Empresa> pelo WhatsApp"), click-to-WhatsApp ads,
palavra-chave na conversa, workflow que marca opt-in após consentimento registrado.
Guarde **data, origem e texto** do consentimento (LGPD).

## 3. Template

Categoria:
- **Marketing**: qualquer coisa promocional, convite, reengajamento, lembrete de carrinho.
- **Utility**: transacional, ligado a algo que a pessoa pediu (confirmação de reunião, lembrete
  de demo agendada). Misturar promoção em utility → vira marketing.
- Fora da janela de 24h só sai template aprovado.

Estrutura recomendada para aquisição:
```
[Header opcional: imagem/vídeo curto]
Oi {{1}}, aqui é a <Nome> da <Empresa>. 👋
<1 frase de contexto: por que estou falando com você — ligada à ação dela>
<1 frase de valor específico para o segmento/dor>
<pergunta fácil de responder>
[Botão resposta rápida: "Quero saber mais"] [Botão: "Agora não"] [Botão: "Parar promoções"]
```
Boas práticas:
- Marca no início, nome da pessoa, 1–3 frases curtas, **uma** pergunta/CTA.
- Botões de resposta rápida > links (geram janela de 24h e conversa).
- Sempre ofereça saída fácil (botão "Parar promoções" ou "Responda SAIR").
- Variáveis com valores de exemplo realistas na submissão (evita reprovação).
- Gere **2 variações** (ex.: pergunta direta vs. prova social) para teste A/B.
- Use `copywriting` e `marketing-psychology` para refinar; nada de urgência falsa.

## 4. Envio

- **Volume x limite**: confira o tier atual (250 / 2.000 / 10.000 / 100.000 contatos únicos em
  24h, compartilhado no portfólio). Se a lista for maior, divida em lotes ao longo de dias.
- **Número novo / pouco uso**: aqueça — comece pelos contatos mais quentes, suba volume em 1–2
  semanas mantendo quality rating verde.
- **Horário**: dias úteis, 9h–12h e 14h–18h no fuso do contato; evite sexta à tarde, fins de
  semana e feriados (salvo B2C com teste). Escalone envios para o time dar conta das respostas.
- **Frequência**: no máx. 1 template de marketing por contato a cada 7 dias (ajuste ao contexto).
- **Formas de enviar no HubSpot**: envio de mensagem de marketing de WhatsApp para lista, ou
  ação "Enviar mensagem de WhatsApp" em **workflow** (para réguas). Respostas caem na Inbox e
  devem ser roteadas para o dono do contato.

## 5. Réguas (workflows) de aquisição — modelos

| Régua | Gatilho | Sequência sugerida |
|---|---|---|
| **Speed-to-lead** | Form de demo/orçamento enviado + opt-in | Imediato: utility/confirmação + pergunta de qualificação → se sem resposta em 2h, tarefa para SDR ligar |
| **MQL sem resposta** | MQL há 48h sem atividade | D0 template marketing com pergunta → D3 e-mail com case → D7 último toque + saída |
| **Evento/webinar** | Inscrição | Confirmação (utility) → D-1 lembrete → D0 1h antes → D+1 gravação + CTA reunião |
| **Reativação de perdidos** | Negócio perdido há 3–12 meses (motivo ≠ fit) | Template com novidade relevante ao motivo da perda → resposta vai para dono |
| **Indicação** | Cliente com NPS alto | Convite para indicar (ver `referrals`) |

Sempre inclua no workflow: critério de saída (respondeu, virou SQL, opt-out), supressões e
criação de tarefa/notificação para o dono quando houver resposta.

## 6. Checklist pré-disparo (mostre preenchido e peça confirmação)

- [ ] Objetivo e métrica principal definidos
- [ ] Lista: N contatos, 100% com opt-in de marketing WhatsApp, deduplicada, supressões aplicadas
- [ ] N ≤ limite de 24h disponível (ou dividido em lotes)
- [ ] Quality rating do número verde
- [ ] Template aprovado, categoria correta, variáveis preenchidas para todos
- [ ] Botão/instrução de opt-out presente
- [ ] Time de atendimento avisado e com capacidade no horário
- [ ] Campanha HubSpot associada + UTM nos links (`utm_source=whatsapp&utm_medium=crm&utm_campaign=...`)
- [ ] Grupo de controle (5–10%) se for medir incremento
- [ ] Data/hora e lotes agendados

## 7. Medição

| Métrica | Leitura |
|---|---|
| Entregues / enviados | < 95% → números inválidos ou limites |
| Lidos / entregues | referência de interesse no template |
| Respostas / entregues | métrica principal de conversa (compare variações) |
| Opt-out + bloqueios / entregues | > 1–2% é alerta; pare e revise público/copy |
| Conversas → SQL → oportunidade → ganho | impacto real; meça em D+7 e D+30 |
| Incremento vs. controle | o disparo gerou venda que não aconteceria? |

Use `analise-funil` para levar os resultados até venda e registre aprendizados no contexto
(templates que funcionam, horários, segmentos).

## Entrega padrão

```
## Briefing da campanha (objetivo, público, oferta, métrica)
## Lista (critérios de inclusão/exclusão + tamanho estimado)
## Templates (variação A e B, categoria, variáveis, botões)
## Plano de envio (lotes, datas, horários) e régua/workflow
## Checklist pré-disparo
## Plano de medição (D+1, D+7, D+30)
```

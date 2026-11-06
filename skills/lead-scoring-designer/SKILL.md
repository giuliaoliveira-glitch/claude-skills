---
name: lead-scoring-designer
description: >
  Designs a lead scoring model with two parts, fit (should we ever sell to them?) and
  engagement (are they interested now?), tests it against past wins and losses, and writes the
  exact rules to build it in HubSpot or another CRM. Use for "build a lead score", "our MQLs are
  bad", "which leads should sales call", "fix our scoring", "define MQL". Do NOT use to rank a
  short list of named accounts (use buying-signal-monitor).
---

# Lead scoring designer

A score is only useful if it predicts something you can check later, such as a meeting or a
won deal. Most scores fail because they reward activity (opens, page views) that anyone can
generate. You design a score from the user's own history and prove it works before anyone
relies on it.

## Context first
Read `company-context.md` for the ideal customer and buying group. Read the output of
ideal-customer-finder if it exists.

## Questions
1. "What should a high score predict: a booked meeting, an opportunity, or a won deal?"
2. "How many leads a month, and how many can sales follow up properly?" (This sets the
   threshold: the score should hand over about as many leads as sales can handle.)
3. "Which tools hold the data?" (CRM, marketing automation, product, website visitor tool).

## Method
1. **Two scores, kept apart.** Fit (profile: industry, size, title, region, tech) and Engagement
   (behaviour: form type, pricing page visits, replies, meetings, product use). A great-fit lead
   with no engagement and an engaged student are both wrong to hand over.
2. **Weights from history.** Pull leads from the last 6 to 12 months with their outcome.
   For each attribute, compare the outcome rate with and without it. Give points in proportion.
   Attributes with fewer than 20 cases are noted, not weighted.
3. **Negative points.** Competitors, students, personal email domains (unless your buyers use
   them), job seekers visiting careers pages, unsubscribes.
4. **Decay.** Engagement fades. Halve engagement points after 30 days without activity unless
   the user's sales cycle says otherwise.
5. **Test.** Score last year's leads with the new model. Show how many converted in each score
   band. A good model shows a clear step up between bands. If it does not, say so and simplify.
6. **Threshold.** Set the hand-over line so the volume matches sales capacity from question 2.

## If you use HubSpot
HubSpot's lead scoring tool has engagement, fit and combined scores; which ones you can build
depends on the plan (contacts need Marketing Hub, deals need Sales Hub). Useful inputs:
Job title (`jobtitle`), Industry (`industry`), Number of employees (`numberofemployees`),
Country (`country`), Original traffic source (`hs_analytics_source`), Recent conversion
(`recent_conversion_event_name`), Number of pageviews (`hs_analytics_num_page_views`), Recent
sales email replied date (`hs_sales_email_last_replied`), Lifecycle stage (`lifecyclestage`).
Do not score marketing email opens. Write the model as a build sheet (criteria, points, decay,
threshold, the workflow that sets Lifecycle stage to MQL) for an admin to build, or build it
yourself only with approval. Confirm internal names with the connector's property search.

## Output
1. The model: fit rules and points, engagement rules and points, negative rules, decay.
2. The test: conversion rate per score band, with counts.
3. The threshold and the expected monthly hand-over volume.
4. The build sheet.
5. A review date (90 days) and the one number to check then.

## Guardrails
- Show counts next to every rate. Small samples are labelled.
- A score is a ranking aid, not a verdict. Sales can override with a reason.
- No em dashes.

Research behind this skill: fit and engagement scoring (HubSpot documentation); unreliable
email opens (Apple Mail Privacy Protection). See RESEARCH.md.

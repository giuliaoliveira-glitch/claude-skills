---
name: weekly-marketing-report
description: >
  Writes a short weekly marketing report from Google Analytics 4, Search Console and your CRM:
  what changed, why, and one decision for this week. Use for "marketing report", "weekly report",
  "SEO report", "what happened to traffic", "marketing dashboard summary", "Monday report".
  Do NOT use for ad spend waste (use google-ads-waste-finder) or channel credit (use
  channel-attribution).
---

# Weekly marketing report

A report is only worth reading if it ends in a decision. This one compares the last 7 days with
the 7 before and the same week four weeks ago, explains the biggest changes, and proposes one
thing to do this week.

## Context first
Read `company-context.md` for goals and the pages that matter (pricing, demo, key guides).

## Questions (first run only)
1. "Which sources can I read? (GA4, Search Console, CRM)"
2. "Which result matters most: leads, demos, sign-ups or pipeline?"

## Data
- **Search Console:** clicks, impressions, click-through rate and average position, by query and
  page. Remember the data lags 2 to 3 days.
- **GA4:** sessions and key events by channel and landing page.
- **CRM:** new contacts and deals by original source, so traffic connects to pipeline.

## Method
1. Compare three periods: last 7 days, previous 7 days, same week four weeks ago.
2. Only report changes that are large and not noise (for small sites, look at absolute numbers,
   not percentages).
3. Explain each change with evidence: a page that gained or lost queries, a campaign, a
   seasonal pattern, a tracking change.
4. End with one decision: a page to update, a query to target, a test to run.

## Output (fits on one screen)
1. Headline: the one thing that matters this week.
2. Five numbers with change: clicks, impressions, sessions, key events, new pipeline.
3. Top three movers (queries or pages) up and down, with the likely reason.
4. One decision for this week, with an owner.
5. Data notes: lags, tracking gaps.

## Guardrails
- Read-only. Never change tracking or settings.
- Never claim cause without evidence; say "likely" when it is.
- No em dashes.

Research behind this skill: Google Search Console and GA4 documentation (metric definitions and
data freshness); RevOps Lab principle "measure what you will act on". See RESEARCH.md.

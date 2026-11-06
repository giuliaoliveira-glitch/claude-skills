---
name: pipeline-review
description: >
  Prepares the weekly pipeline and forecast review for a sales leader or founder: coverage
  against target using your own win rate, what moved since last week, deals at risk, deals
  slipping, data that cannot be trusted, and the five conversations to have this week. Use for
  "pipeline review", "weekly forecast", "are we going to hit the number", "which deals are at
  risk", "prepare my one-to-ones". Do NOT use to review one deal in depth (use deal-review).
---

# Pipeline review

A forecast is a set of bets. The goal of a review is not to report the number; it is to find the
few deals and habits that change the number, while there is still time. You compute everything
from the team's own history, not from rules of thumb.

## Context first
Read `company-context.md` (typical deal size and cycle). Ask once for the target for the period.

## Questions (first run)
1. "Which pipeline, which period, which target?"
2. "How do you count a deal as committed?" (forecast categories or stages)
3. "Who is the review for: you, the team, or the board?"

## Step 1: is the data trustworthy?
Before any number, list what would mislead: open deals with a close date in the past; no next
activity scheduled; no amount; no activity in 30 days; stage skipped. Show counts and the value
at stake. A forecast built on these is a guess.

## Step 2: coverage that means something
- Win rate: from the last 4 to 6 quarters, by segment if possible (won divided by won plus lost,
  by value and by count).
- Needed coverage is about 1 divided by that win rate. The "3x rule" only fits a one-in-three
  win rate. Show both.
- Count only deals that can realistically close in the period: compare each deal's age with the
  typical cycle length of won deals.
- Weighted pipeline: amount times stage probability, next to raw pipeline.

## Step 3: what moved
Since last week: new deals, deals won and lost, close dates pushed (how many times each), amounts
changed, stages moved backwards. Deals pushed twice or more are flagged: slippage repeats.

## Step 4: risk
For committed and best-case deals, apply quick risk checks: no economic buyer met, one contact,
no critical event, proposal out with no reply in 10 days, time in stage longer than usual for won
deals. Run deal-review on the top three at risk if the user wants depth.

## Step 5: the conversations
Five specific conversations for this week: with which rep, about which deal, with which
question. Coaching questions, not interrogations ("What would have to be true for this to close
by the 30th?").

## If you use HubSpot
Read deals in the pipeline with: Deal stage (`dealstage`), Pipeline (`pipeline`), Amount
(`amount`), Close date (`closedate`), Create date (`createdate`), Deal owner (`hubspot_owner_id`),
Forecast category (`hs_forecast_category`), Deal probability (`hs_deal_stage_probability`),
Weighted amount, Forecast amount (`hs_forecast_amount`), Next step (`hs_next_step`), Last activity
date (`notes_last_updated`), Next activity date (`notes_next_activity_date`), Number of associated
contacts (`num_associated_contacts`), Closed lost reason (`closed_lost_reason`), Time in current
stage and Date entered each stage (available on Professional and Enterprise). HubSpot recommends
Weighted amount over Forecast amount for expected revenue. Confirm internal names with the
connector's property search. Read-only unless the user approves specific fixes.

## Output
One page: the number (target, committed, best case, coverage needed and actual), data issues,
what moved, top risks, five conversations. Then the detail table. Same format every week so
changes are easy to see.

## Guardrails
- Show the deal count next to every rate.
- Never change a rep's forecast or deal. Propose; the owner decides.
- No em dashes.

Research behind this skill: coverage from win rate (common forecasting practice); Forrester on
stalled purchases (2024). See RESEARCH.md.

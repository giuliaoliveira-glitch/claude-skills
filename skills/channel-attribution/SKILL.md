---
name: channel-attribution
description: >
  Shows which marketing channels actually bring revenue, not just leads: pipeline and won revenue
  by first source, latest source and self-reported source, with the gaps in tracking that make
  the numbers wrong. Use for "which channels drive revenue", "marketing attribution", "where do our
  customers come from", "is LinkedIn worth it", "should we cut this channel". Works best with
  HubSpot or another CRM. Do NOT use for ad-account optimisation (use google-ads-waste-finder).
---

# Channel attribution

Every attribution model is wrong in a known way. First touch flatters awareness channels, last
touch flatters search and direct, and both miss what buyers do where you cannot track them
(peers, podcasts, communities). You show several views side by side, say what each hides, and
help the user decide with honest uncertainty.

## Context first
Read `company-context.md` for the buying cycle length and channels used.

## Questions
1. "Which period?" Use at least one full sales cycle, usually 6 to 12 months.
2. "What is the decision you want to make?" (cut a channel, move budget, justify spend)
3. "Do you ask buyers how they heard about you?" (a form field or a question on the first call)

## Step 1: check the tracking
List what will distort the result: contacts with no source, "offline" or "direct" as the
largest source, deals without associated contacts, missing UTM parameters on paid links, a
changed form or tracking code in the period. Show the share of revenue affected.

## Step 2: three views
1. **First touch:** won revenue and pipeline by how the first contact first found you.
2. **Last touch before the deal:** by the latest source before deal creation.
3. **Self-reported:** what buyers say when asked "how did you hear about us?". This catches
   word of mouth, podcasts and communities that tracking cannot see.
Where views disagree, that is the finding: a channel strong in self-reported but weak in tracked
data is probably undervalued.

## Step 3: quality, not volume
For each channel: leads, share that became opportunities, win rate, average deal size, cycle
length, cost (if known) and cost per won deal. A channel with expensive leads and high win rate
can beat a cheap one.

## Step 4: decide
Recommendations tied to the user's decision, each with the confidence level and what would make
it more certain (for example: "run a 6-week holdout in one region before cutting").

## If you use HubSpot
Contacts: Original traffic source (`hs_analytics_source`), drill-down 1 and 2
(`hs_analytics_source_data_1`, `hs_analytics_source_data_2`), Latest traffic source
(`hs_latest_source`), Became a customer date (lifecycle stage dates), Recent conversion
(`recent_conversion_event_name`). Companies: Original traffic source (`hs_analytics_source`).
Deals: Original traffic source and Latest traffic source on the deal, Amount (`amount`), Deal
stage (`dealstage`), Create date (`createdate`), Close date (`closedate`). For LinkedIn ads, the
source is Paid Social with drill-down 1 LinkedIn. Note: drill-downs are set automatically and
cannot be edited on the contact. Confirm internal names with the connector's property search.

## Output
Tracking gaps with the revenue affected; the three views in one table; channel quality table;
recommendations with confidence. Charts if the user wants a deck.

## Guardrails
- Never present one model as the truth. Show the disagreement.
- Show counts next to rates; tiny channels are labelled "too few to judge".
- No em dashes.

Research behind this skill: Ehrenberg-Bass and the LinkedIn B2B Institute (most buyers are out of
market; brand effects are delayed); McKinsey B2B Pulse 2024 (about ten channels per buyer
journey). See RESEARCH.md.

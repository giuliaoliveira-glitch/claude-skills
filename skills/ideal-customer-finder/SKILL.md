---
name: ideal-customer-finder
description: >
  Finds who your best customers really are by analysing closed-won and closed-lost deals in the
  CRM, then turns the pattern into a scored ideal customer profile and a "not a fit" list. Use
  when someone says "who should we target", "analyse our best customers", "build our ICP from
  data", "which segment wins most", "why do we lose". Works with HubSpot or any CRM export.
  Do NOT use to research one company (use account-brief).
---

# Ideal customer finder

Most ideal customer profiles are written from memory and hope. You write it from evidence:
which customers bought fastest, paid most, stayed longest and cost least to win. Then you check
the pattern makes sense to the people who sell.

## Context first
Read `company-context.md` if it exists (made by company-context). It tells you what is sold and
the suspected ideal customer. You will test that suspicion against data.

## Questions (ask only what you cannot see)
1. "Which deals count: all closed deals in the last 12 or 24 months, or one product only?"
2. "What does a great customer mean for you: biggest deal, fastest close, renews, or expands?"
   (Pick at most two. This decides how you rank segments.)
3. "Any segments you already know are wrong for you?" (e.g. "agencies under 10 people").

## Data to pull
Closed deals in the period, each with the company's traits. In HubSpot:
- Deals: Deal stage (`dealstage`, closed won or lost), Amount (`amount`), Create date
  (`createdate`), Close date (`closedate`), Deal type (`dealtype`), Closed lost reason
  (`closed_lost_reason`), Original traffic source (`hs_analytics_source`).
- Companies: Industry (`industry`), Number of employees (`numberofemployees`), Annual revenue
  (`annualrevenue`), Country (`country`), Total revenue (`total_revenue`), Lifecycle stage
  (`lifecyclestage`).
- Contacts on won deals: Job title (`jobtitle`), Buying role (`hs_buying_role`).
Confirm internal names with the connector's property search first. With no CRM connected, ask
for a CSV export with these columns.

## Method
1. **Clean first.** Drop test deals, duplicates and deals under a minimum amount the user sets.
   Report how many you dropped and why.
2. **Segment** by industry, size band, region, source and buyer title. Use bands with enough
   deals: a segment with fewer than 5 closed deals is "too few to judge", never a finding.
3. **Score each segment** on win rate, average deal size, days to close and (if available)
   retention or expansion. Rank by the one or two outcomes the user chose.
4. **Look at losses.** Group lost reasons. "No decision" and "timing" are usually the largest;
   they point to weak triggers, not bad segments.
5. **Find the trigger.** For the top segment, read notes or first emails of 5 to 10 won deals
   and name what happened just before they bought.
6. **Sense-check with people.** Show the top three segments and ask the user which match what
   sellers feel. Disagreement is a finding: either the data or the belief is wrong. Say which
   evidence each side has.

## Output
1. **Ideal customer, scored:** a table of segments with deals, win rate, average deal, days to
   close, and a tier (Tier 1 to 3).
2. **Not a fit:** segments with low win rate or high cost, with numbers.
3. **The trigger:** what happened before the best customers bought, with examples.
4. **Fit rules** in plain words that another agent or a CRM property can use
   (e.g. "Tier 1: software, 50 to 500 employees, Europe or US, has a sales team").
5. **What we could not judge** and which data would fix it.

Offer to save the tier as the company property Ideal Customer Profile Tier
(`hs_ideal_customer_profile`) in HubSpot. Never write it without approval, and never overwrite
an existing value without showing old and new side by side.

## Guardrails
- Small numbers lie. Show the deal count next to every percentage.
- Correlation is not cause: a segment can win because one great seller worked it. Say so when a
  segment's wins come mostly from one owner (`hubspot_owner_id`).
- No em dashes. Plain language.

Research behind this skill: positioning order from April Dunford (best customers first);
coverage and win-rate maths from common forecasting practice. See RESEARCH.md.

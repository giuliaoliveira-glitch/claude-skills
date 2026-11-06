---
name: crm-hygiene-audit
description: >
  Audits a CRM (built for HubSpot, works for others) read-only: duplicates, empty key fields,
  wrong lifecycle stages, records without owners, stale deals, unused properties, and broken
  associations. Ranks problems by the revenue and decisions they put at risk and writes a fix
  plan. Use for "CRM audit", "clean up HubSpot", "data quality", "our reports are wrong",
  "duplicates", "who owns what". Changes nothing without approval.
---

# CRM hygiene audit

Bad CRM data is expensive in a quiet way: reports lie, leads go to nobody, sellers stop trusting
the system and keep notes elsewhere. A clean-up is only worth doing for the data that drives a
decision, so you rank problems by what they break, then propose fixes and rules that stop them
coming back.

## Context first
Read `company-context.md` for what matters (ideal customer fields, buying roles, pipelines).

## Questions
1. "Which decisions do you make from the CRM?" (forecast, lead routing, marketing attribution,
   commission). This decides what to check first.
2. "Which objects and pipelines are in use?"
3. "Who can approve fixes, and may I merge records or only list them?"

## The checks (read-only)
**Companies**
- Duplicates by domain (HubSpot also offers a duplicates tool in Data quality on paid tiers).
- Missing domain, owner (`hubspot_owner_id`), industry (`industry`), size (`numberofemployees`),
  country, lifecycle stage (`lifecyclestage`).
- Companies with no associated contacts (`num_associated_contacts` = 0).
- Ideal Customer Profile Tier (`hs_ideal_customer_profile`) empty on target accounts
  (`hs_is_target_account`).

**Contacts**
- No associated company; personal email domains where you sell B2B.
- Lifecycle stage inconsistencies: customer contacts at companies that are not customers;
  contacts stuck in Lead or MQL for months with no Lead status (`hs_lead_status`).
- No owner on contacts with recent conversions (`recent_conversion_date`): leads that went to
  nobody.
- Job title (`jobtitle`) missing on contacts associated with open deals.
- Bounced or unsubscribed contacts still in active sequences.

**Deals**
- Close date (`closedate`) in the past on open deals.
- No amount (`amount`), no associated contact, or no next activity
  (`notes_next_activity_date`).
- No activity in 30 or more days (`notes_last_updated`).
- Closed lost with no reason (`closed_lost_reason`).
- Stages skipped or moved backwards.

**Properties and process**
- Properties never filled or duplicated (two fields for the same thing).
- Required fields that are not enforced at the stage where they matter.
- Lead source values that are unclear (Offline, Direct traffic dominating).

## Rank and plan
For each problem: how many records, the revenue or decision at risk, the fix (bulk update,
merge, workflow, required property, training), effort, and a prevention rule so it does not
return. Fix the data behind the most important decision first.

## Output
A one-page summary (health score per object, top five problems by impact), then the detail with
record counts and example record links, then the fix plan as a checklist.

## Guardrails
- Read-only by default. Merges and bulk edits only after approval, in small batches, with a log
  and an export taken first.
- Never delete records. Propose archiving with a reason.
- Confirm internal names with the connector's property search; portals differ.
- No em dashes.

Research behind this skill: HubSpot data quality documentation (duplicates, property insights);
"measure what you will act on" (see RESEARCH.md).

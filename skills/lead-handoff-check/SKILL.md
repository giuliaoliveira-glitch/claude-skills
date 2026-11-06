---
name: lead-handoff-check
description: >
  Checks what happens to an inbound lead after the form: how fast someone responds, whether it
  reaches the right owner, how many fall through the gaps between marketing and sales, and where
  routing rules break. Proposes fixes and alert rules. Use for "speed to lead", "lead routing",
  "are we following up fast enough", "leads falling through the cracks", "MQL to SQL handoff",
  "SLA between marketing and sales". Read-only unless approved.
---

# Lead hand-off check

The hand-off from marketing to sales is where many companies lose their best leads without
noticing. An audit of 2,241 US companies published in Harvard Business Review found that firms
that tried to contact a web lead within an hour were nearly seven times more likely to qualify
it than those that waited longer, yet many took more than a day. You measure the real response
time and fix the rules.

## Context first
Read `company-context.md` (ideal customer, regions, team). Ask how leads should be routed if it
is not written down.

## Questions
1. "Which lead sources count as hand raisers?" (demo request, contact form, pricing enquiry,
   trial). These need the fastest response.
2. "What is the agreed response time, if any, and in which hours?"
3. "How are leads routed?" (round robin, territory, account owner, manual)

## Step 1: measure
For hand-raiser leads in the last 90 days: time from form submission to first real touch (a call,
a one-to-one email, a meeting), by source, owner, region and hour of day. Show the median and the
share answered within 1 hour, within 24 hours, and never.

## Step 2: find the leaks
- Leads with no owner, or owned by someone who left.
- Leads from existing customers or open deals routed to a new rep instead of the account owner.
- Leads outside working hours or time zones with nobody covering.
- Leads marked MQL that sales never accepted or rejected (no Lead status).
- Good-fit leads auto-disqualified by a score or a rule.

## Step 3: fix
- Routing rules in plain words (who gets what, fallback owner, account match first).
- A response target per lead type and an alert when it is missed (for example a Slack alert at 30
  minutes, escalation at 2 hours).
- An agreement between marketing and sales: what counts as accepted, rejected (with reason) and
  recycled.

## If you use HubSpot
Contacts: Recent conversion (`recent_conversion_event_name`, `recent_conversion_date`), Owner
(`hubspot_owner_id`), Lead status (`hs_lead_status`), Lifecycle stage (`lifecyclestage`) and its
date-entered properties, Last contacted (`notes_last_contacted`), Original traffic source
(`hs_analytics_source`), associated company owner. First touch time is the first call, meeting or
one-to-one email after the conversion. Confirm internal names with the connector's property
search. Propose workflows as a build sheet; build only after approval.

## Output
Response time by source and owner, the leaks with counts, the fixed routing rules, the alert
design and the SLA draft.

## Guardrails
- Read-only by default.
- Measure real touches, not automated emails.
- No em dashes.

Research behind this skill: Oldroyd, McElheran and Elkington, "The Short Life of Online Sales
Leads", Harvard Business Review (2011). See RESEARCH.md.

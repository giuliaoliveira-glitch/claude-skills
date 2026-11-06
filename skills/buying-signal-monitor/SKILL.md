---
name: buying-signal-monitor
description: >
  Watches a list of target accounts for buying signals (leadership changes, funding, hiring for
  the problem, expansion, website intent, champions changing jobs) and returns a ranked "act now"
  list with the reason and the right person for each. Use for "what changed at my accounts",
  "which accounts should I call this week", "monitor these companies", "signal check", or on a
  weekly schedule. Do NOT use to write the outreach itself (use cold-email-writer).
---

# Buying-signal monitor

Most companies are not in market most of the time. A signal is evidence that one of them just
moved closer. Your job is to separate "act now" from "keep warm", explain why, and name who
should hear from us. Fewer, better accounts beat a long list.

## Context first
Read `company-context.md`, especially the buying situations. Those are the signals that matter
for this business. If missing, ask: "What usually happens at a company just before it buys
from you?"

## Questions (first run only)
1. "Which accounts: a CRM list, target accounts, or a pasted list?"
2. "How far back: 30 days (default) or 90?"
3. "Which sources can I use?" (web search always; CRM; website visitor tool; job data;
   funding data). Use what is connected and say what was not.

## The signals, grouped
- **Act now (timing):** new leader in the buyer role, merger or acquisition, funding, new
  regulation, a past champion joining the account, a competitor shutting down. Usually useful
  for weeks, not months.
- **Warming up (interest):** pricing, comparison or security pages visited, several people from
  one account engaging, webinar attendance, replies.
- **Good fit (structure):** tech stack, size, growth, hiring for the problem. These rank
  accounts; they are not a reason to reach out on their own.

## Method
1. For each account, collect signals with date and source.
2. **Check before counting:** is it real, recent (inside its window), and about the right part of
   the company? Drop anything older than its window.
3. **Stack, do not add up blindly:** an account is "act now" when it has a timing signal plus
   good fit, or several interest signals from different people. One page view is not a signal.
4. Rank: act now, then warming up, then keep warm.
5. For each "act now" account, name the person to contact first (role from the context file)
   and the angle, tied to the signal. Never mention a sensitive trigger (layoffs, bad press)
   to the buyer.

## If you use HubSpot
Read: Target account (`hs_is_target_account`), Ideal Customer Profile Tier
(`hs_ideal_customer_profile`), Owner (`hubspot_owner_id`), Number of open deals
(`hs_num_open_deals`), Last contacted (`notes_last_contacted`), and on contacts Recent
conversion (`recent_conversion_event_name`, `recent_conversion_date`), Recent sales email
replied date (`hs_sales_email_last_replied`), Number of pageviews (`hs_analytics_num_page_views`).
Skip accounts with an open deal or contact in the last 14 days unless the user wants them.
Confirm internal names with the connector's property search. Do not treat email opens as a
signal: Apple Mail Privacy Protection and security scanners open emails automatically.

## Output
A ranked table: account, verdict, signals (dated, linked), person to contact, angle. Then
"dropped and why" in one line each. On a schedule, show only what changed since the last run.

## Guardrails
- Never scrape LinkedIn. Use public pages, your own tools and the user's exports.
- Read-only. Propose tasks; create them only after approval.
- No em dashes.

Research behind this skill: the 95-5 rule (Ehrenberg-Bass and the LinkedIn B2B Institute);
signal windows and stacking from RevOps Lab's 112 buying signals at revopslab.org/signals.
See RESEARCH.md.

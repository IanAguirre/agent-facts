# Agent-Facts Quarterly Improvement Kit

Last updated: 2026-03-03
Cadence: every 3 months
Owners: Human maintainer + AI review panel (ChatGPT, Claude, Gemini, others)

## 1) Quarterly cycle

1. Freeze window starts on day 1 of the quarter.
2. Open one RFC issue per proposed change.
3. Run multi-agent review prompt (same prompt to each model).
4. Merge only changes that pass acceptance tests.
5. Publish new version (`vX.Y`) with changelog and updated `last-modified`.

Suggested quarter dates:
- Q1: Mar 1-7
- Q2: Jun 1-7
- Q3: Sep 1-7
- Q4: Dec 1-7

## 2) Standard versioning

- Patch (`v2.1.1`): wording clarifications, typo fixes, examples only.
- Minor (`v2.2`): additive sections, new optional fields, stronger tests.
- Major (`v3.0`): breaking schema/format changes.

## 3) Multi-agent review workflow

For each RFC:
1. Ask each agent to score:
- Clarity (0-5)
- Implementability (0-5)
- Backward compatibility (0-5)
- Hallucination resistance impact (0-5)
2. Ask each agent for:
- one breaking risk
- one abuse/spam risk
- one measurable test
3. Aggregate all feedback into a decision table.
4. Accept only if no unmitigated high-risk item remains.

## 4) Release checklist

- [ ] `agent-facts.html` updated with exact version/date.
- [ ] `index.html` spec updated.
- [ ] PDF link returns `200`.
- [ ] `llms.txt` version/date matches spec.
- [ ] `robots.txt` still allows targeted AI crawlers.
- [ ] At least 5 test fixtures validated (small business, enterprise, local service, ecommerce, nonprofit).
- [ ] Changelog includes: what changed, why, migration notes.
- [ ] Archive previous version URL remains live.

## 5) Minimum acceptance tests

- Determinism: Required fields are present and unambiguous.
- Recency: `last-modified` is machine-readable ISO date.
- Provenance: claims point to a verifiable source or are marked self-asserted.
- Abuse resistance: disallow unverifiable superlatives and fake affiliations.
- Parsing stability: same extraction result across at least 3 parser strategies.

## 6) Governance rules

- Keep mandatory fields small and stable.
- Additive extensions must not break prior parsers.
- Any new rule must include at least one measurable test.
- If agents disagree, prefer the change with highest compatibility and testability.

## 7) RFC template

Use this for each proposed change:

```
RFC ID:
Title:
Type: patch | minor | major
Problem:
Proposal:
Backward compatibility impact:
Abuse/failure modes:
Acceptance tests:
Rollout plan:
Decision:
```


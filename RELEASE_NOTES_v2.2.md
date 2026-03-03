# Release v2.2

**Date:** 2026-03-02

### Summary
Agent-Facts Protocol version 2.2 introduces several high-confidence, backward-compatible improvements focused on field consistency, timestamp precision, provenance labeling, cross-file alignment, and anti-spam rules. Heavy infrastructure features (cryptographic signatures, JSON-first canonicalization, multi-authority trust) are deferred to v3.0.

### Key Changes
- **Core required fields** defined (`protocol_version`, `entity_legal_name`, `primary_url`, `last_modified_iso8601`, `jurisdiction`, `primary_contact`).
- **Strict timestamp format** mandated (RFC3339 UTC with `Z` suffix); HTTP `Last-Modified` header parity required.
- **Claim provenance labels** added (e.g., `source_type`, `claim_id`), with visibility requirements for `self_asserted` claims.
- **Cross-file consistency rule** for version and timestamp between `agent-facts.html`, `llms.txt`, and spec metadata.
- **Anti-spam policy** preventing unverifiable superlatives and marketing claims in machine-readable facts.
- Added optional discovery directive in `robots.txt`.
- Guidance for payload size (<64 KB recommended) and SSRF mitigation for subresources.
- New normative spec document at `agent-facts-protocol-v2.2.html` and updated example pages.
- Added provenance data to example facts and updated tests to verify compliance.
- Added README, patch files, and helper script (`scripts/build_pdf.ps1`).

### Migration Notes
- v2.1 sites remain valid but are non-compliant with v2.2. Publishers should update their pages with required fields and timestamp format as soon as practical.
- No breaking changes; all additions are optional or recommended.

### Acceptance Tests
1. Core fields present and machine-readable.
2. Timestamp format and parity verified.
3. Provenance fields included where available.
4. Versions consistent across artifacts.
5. No promotional language in machine-readable fields.

### Changelog
See `v2.2-candidate-changelog.md` in repository for full review notes.

### Acknowledgements
Thanks to all AI systems and reviewers who participated in the March 2026 spec review.

---

To publish this release, create a GitHub release (draft) titled `Agent-Facts Protocol v2.2` and paste this document into the release notes field. Attach `agent-facts-protocol-v2.2.html`, `v2.2-candidate-changelog.md`, and patch files if desired.
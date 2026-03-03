# Agent-Facts Protocol

Agent-Facts is an open protocol allowing websites to publish "facts pages" that are optimized for LLMs and other AI agents. The goal is to deliver deterministic, low-hallucination information by structuring data as lightweight HTML with parallel JSON-LD and enforcing strict freshness, provenance, and formatting rules.

## Repository Contents

- `agent-facts.html` - Example facts page; this site itself is the canonical data.
- `index.html` - Project homepage and full specification.
- `agent-facts-protocol-v2.2.html` - Normative specification for version 2.2 (latest).
- `llms.txt`, `robots.txt`, `sitemap.xml` - Discovery and crawling guidance.
- `v2.2-candidate-changelog.md` - Changelog used during 2026-03-02 review.
- `patches/` - Git patch files for release.
- `scripts/` - Helper scripts (e.g., `build_pdf.ps1` to render spec to PDF).

## Getting Started

1. Review the protocol specification: [agent-facts-protocol-v2.2.html](./agent-facts-protocol-v2.2.html).
2. Use the template in `agent-facts.html` to create your own facts page.
3. Update `llms.txt` and `robots.txt` as described in spec for discovery.
4. Publish to your domain and include the required metadata fields.

## Release Notes

See the changelog file for details on recent updates. The current version is **v2.2**.

## Contributing

Feedback and pull requests are welcome. Please keep changes additive and maintain backward compatibility until a v3.0 milestone. Use the issue tracker to propose new features or corrections.

## License

This protocol specification is released under [Creative Commons Zero (CC0)](https://creativecommons.org/publicdomain/zero/1.0/).

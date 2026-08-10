# Agent Skills

> A collection of agent skills for AI coding assistants — meta-learning, requirement clarification, and more.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-1.1.0-blue.svg)](CHANGELOG.md)

## Skills

| Skill | Description | Triggers |
|-------|-------------|----------|
| [systematic-learning](skills/systematic-learning/) | Systematically learn ANY knowledge domain through an 8-stage cycle: positioning, assessment, decomposition, understanding, practice, integration, review, extension | "系统学习", "我想学", "教我", "teach me", "learning path" |
| [pre-flight](skills/pre-flight/) | Socratic requirement clarification — interview the user one question at a time, each with a recommendation, until intent is fully understood | "追问", "先问我问题", "clarify", "ask me first" |

### systematic-learning

The main learning skill. When you say "我想学 NumPy" or "teach me machine learning", it doesn't dump a generic tutorial — it interviews you first, positions the knowledge in its ecosystem, researches the best resources, and produces a complete learning guide with modules, diagrams, exercises, and a capstone project.

**8-Stage Learning Cycle:**

| Stage | Name | What Happens |
|-------|------|-------------|
| ⓪ | Knowledge Positioning | Map the subject in the broader ecosystem |
| ① | Self-Assessment | Diagnose current level, set Bloom's targets |
| ② | Decomposition & Planning | Break into modules, build dependency graph |
| ③ | Deep Understanding | Explain principles, design rationale, mental models |
| ④ | Deliberate Practice | 3-tier exercises (basic → comprehensive → challenge) |
| ⑤ | Integration & Creation | Capstone project combining multiple modules |
| ⑥ | Review & Iteration | Spaced repetition schedule (1/3/7/14/30 days) |
| ⑦ | Extension | Three paths: horizontal, vertical, application |

### pre-flight

A Socratic requirement clarification skill that prevents premature convergence on vague requests.

- One question at a time — never batch
- Every question includes a recommended answer
- Dynamic questioning capped at 10 questions
- User can skip at any time ("直接开始" → uses best-practice defaults)
- Outputs a Decision Snapshot before execution begins
- Can be used standalone or invoked by other skills

## Installation

### Trae

```bash
# Settings > Skills & Commands > Import
# Point to the skills/ directory or upload the .zip file
```

### Claude Code

```bash
# Copy skill directories into Claude's commands folder
cp -r skills/systematic-learning/ ~/.claude/commands/
cp -r skills/pre-flight/ ~/.claude/commands/
```

### Cursor

```bash
# Adapt SKILL.md files as .mdc rules
cp skills/systematic-learning/SKILL.md .cursor/rules/systematic-learning.mdc
cp skills/pre-flight/SKILL.md .cursor/rules/pre-flight.mdc
```

### Manual (any agent)

Copy the directories from `skills/` into your agent's skill/command directory.

## Project Structure

```
agent-skills/
├── package.json
├── CHANGELOG.md
├── LICENSE
├── README.md
├── publish.sh
└── skills/
    ├── systematic-learning/
    │   ├── SKILL.md
    │   └── references/
    │       ├── learning-intake.md
    │       ├── knowledge-positioning.md
    │       ├── learning-methodology.md
    │       ├── resource-curation.md
    │       ├── output-formats.md
    │       └── extension-paths.md
    └── pre-flight/
        └── SKILL.md
```

## Adding a New Skill

1. Create `skills/your-skill-name/SKILL.md` with frontmatter (name, version, description, license, metadata)
2. Add any supporting documents in `skills/your-skill-name/references/`
3. Add the skill path to `package.json` → `skills` array
4. Add a row to the Skills table in this README
5. Document the addition in `CHANGELOG.md`
6. Commit and tag: `git tag vX.Y.Z && git push --tags`

## Key Design Decisions

### Why pre-flight exists as a separate skill

Users requesting to learn something often haven't fully articulated their own needs. "我想学编程" hides critical decisions: which language? what depth? what timeframe? pre-flight interviews the user before any work begins, producing a Decision Snapshot that becomes the execution contract.

### Why 8 stages (not 6)

The original 6-stage cycle (assess → plan → understand → practice → integrate → review) was expanded with:
- **Stage ⓪ (before)**: Knowledge Positioning — where does this knowledge sit in the ecosystem?
- **Stage ⑦ (after)**: Extension — where to go next after mastery?

### Why multi-format output

Different knowledge types need different presentation. Memory models need interactive SVG diagrams. Procedural knowledge needs runnable code. Broad overviews need navigable HTML reports. The skill selects the format based on knowledge type, not a one-size-fits-all default.

## Quality Standards

This project follows the quality standards from [Anthropic's official skill guide](https://resources.anthropic.com/hubfs/The-Complete-Guide-to-Building-Skill-for-Claude.pdf) and [Trae's skill best practices](https://docs.trae.cn/ide_best-practice-for-how-to-write-a-good-skill):

- Clear positive AND negative trigger conditions in description
- Structured Input/Output/On-Failure interface specification
- Progressive disclosure (frontmatter → SKILL.md body → references/)
- Single responsibility (each skill does one thing)
- Quality gates checklist in SKILL.md

## Compatibility

| Platform | Status | Notes |
|----------|--------|-------|
| Trae | Native | Designed for Trae's `.trae/skills/` directory |
| Claude Code | Compatible | Uses standard SKILL.md format |
| Cursor | Compatible | Adapt as .mdc rules |
| Codex | Compatible | Standard markdown format |

## License

MIT — see [LICENSE](LICENSE)

## Changelog

See [CHANGELOG.md](CHANGELOG.md)

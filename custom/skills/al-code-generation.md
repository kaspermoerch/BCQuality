---
kind: action-skill
id: al-code-generation
version: 1
title: AL code generation and modification
description: Guides generation and modification of AL source objects — tables, tableextensions, codeunits, pages, pageextensions, queries, and reports — by applying organization-specific and platform-endorsed style, performance, security, and UI conventions.
inputs: [file-path, object-list]
outputs: [findings-report]
bc-version: [all]
technologies: [al]
countries: [w1]
application-area: [all]
---

# AL code generation and modification

This skill applies when generating new AL source objects or modifying existing ones — adding fields, procedures, triggers, page controls, keys, or structural elements. It sources from organization-specific and platform-endorsed knowledge to ensure generated code follows quality conventions before it is written.

## Source

Source from the following knowledge folders across all enabled layers (`custom`, `community`, `microsoft`), with `custom` taking precedence over `community` and `microsoft` per READ layer precedence rules:

- `*/knowledge/style/`
- `*/knowledge/performance/`
- `*/knowledge/security/`
- `*/knowledge/ui/`
- `*/knowledge/upgrade/`

## Relevance

Retain knowledge files where:

1. `technologies` includes `al`.
2. `bc-version` is compatible with the target BC version.
3. `domain` is relevant to the kind of change being made:
   - Structural changes (fields, keys, triggers, codeunit procedures): `style`, `performance`, `security`
   - Page or FactBox changes: `ui`, `style`
   - All changes: `security` (always include)
   - Upgrade-targeted changes: `upgrade`

Discard files that do not match the technology or version constraints per READ matching semantics. Discard `testing` domain files — they apply to `al-test-generation` only.

## Worklist

Narrow the relevant candidates to those that apply to the AL constructs present in the task:

1. Match knowledge file `keywords` against the AL constructs in scope: field declarations, trigger names, key declarations, codeunit patterns, procedure signatures, page control types, event subscriber attributes.
2. Remove candidates whose concern is entirely outside the task scope — for example, UI knowledge files when no page is being modified, upgrade files when no platform version migration is involved.
3. When a `custom` layer file and a `microsoft` or `community` layer file address the same concern (same `keywords` overlap), keep only the `custom` file per layer precedence.

## Action

For each knowledge file in the worklist:

1. Read the `## Description`, `## Best Practice`, and `## Anti Pattern` sections.
2. Check whether the code being generated would violate the anti-pattern or deviate from the best practice.
3. If a violation is detected, correct the generated code to follow the best practice before emitting it.
4. If the generated code already follows the guidance, proceed without comment.

The goal is correct-by-construction output. Apply guidance proactively — not as a post-generation review pass.

Key conventions to apply on every generation task (regardless of worklist narrowing):
- Always use `Rec.FieldName` (never implicit with) — see `avoid-implicit-with`.
- Always use `this.` for same-codeunit member access — see `microsoft/knowledge/style/use-this-keyword-in-codeunits.md`.
- Always specify the field in `TableRelation` — see `define-tablerelation-with-field`.
- Name keys `PK`, `Key1`, `Key2` — see `key-naming-pk-key1`.
- Call `SetLoadFields` before filters — see `community/knowledge/performance/call-setloadfields-before-filters.md`.

## Output

Output conforms to the DO output contract. For code generation tasks, findings document proactive corrections made to the generated code. Use severity `info` when a convention was applied as expected; `minor` or higher when a deviation was corrected that the caller should review.

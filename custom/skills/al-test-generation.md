---
kind: action-skill
id: al-test-generation
version: 1
title: AL test code generation
description: Guides generation and modification of AL test codeunits by applying organization-specific testing conventions: Initialize guard pattern, Given-When-Then structure, helper procedure delegation, assertion isolation, and handler verification.
inputs: [file-path, object-list]
outputs: [findings-report]
bc-version: [all]
technologies: [al]
countries: [w1]
application-area: [all]
---

# AL test code generation

This skill applies when generating new AL test codeunits or modifying existing test procedures, handler functions, helper procedures, or verification procedures. It sources from organization-specific testing conventions and platform-endorsed testing guidance.

## Source

Source from the following knowledge folders across all enabled layers (`custom`, `community`, `microsoft`), with `custom` taking precedence per READ layer precedence rules:

- `*/knowledge/testing/`
- `*/knowledge/style/` (naming and structural conventions that apply to test code)

## Relevance

Retain knowledge files where:

1. `technologies` includes `al`.
2. `bc-version` is compatible with the target BC version.
3. `domain` is `testing` or `style`.

Discard files where `domain` is `performance`, `security`, `privacy`, `ui`, or `upgrade` — these are not primarily relevant to test code structure. Exception: style files whose `keywords` overlap with test-code constructs (variable naming, label placement, object naming, event subscriber naming) remain relevant.

## Worklist

Narrow the relevant candidates to those that apply to the test constructs in scope:

1. Always include all `testing` domain files — test conventions apply to every test procedure and codeunit.
2. From `style` domain files, retain only those whose `keywords` overlap with test-code constructs: variable naming, procedure naming, label placement, codeunit structure, event subscriber naming.
3. When a `custom` layer file and a `microsoft` or `community` layer file address the same concern, keep only the `custom` file per layer precedence.

## Action

For each knowledge file in the worklist, read the `## Description`, `## Best Practice`, and `## Anti Pattern` sections and apply the convention proactively when generating test code.

Key conventions to apply on every test generation task:

- `test-initialize-guard-pattern`: Every test codeunit must have a `Initialize()` with `if Initialized then exit`, shared data creation, `Commit()`, and `Initialized := true` as the last statement.
- `test-given-when-then-structure`: Every test procedure must have exactly one `// [WHEN]` and at least one `// [GIVEN]` and `// [THEN]` comment.
- `test-delegate-to-helper-procedures`: Test procedure bodies contain only `Initialize()`, helper calls, verification calls, `Commit()`, and `asserterror`. No inline record manipulation or assertions.
- `test-assertions-in-verify-procedures`: All `LibraryAssert` calls belong in `local procedure Verify*` procedures, never directly in test procedures.
- `test-no-nested-calls-in-assertions`: Assertions receive named variables, never inline expressions or nested calls.
- `test-confirmhandler-verify-question`: Handlers enqueue the expected question text and verify it against the actual question before supplying the reply.
- `test-commit-before-asserterror`: `Commit()` precedes every `asserterror` when the verification phase needs test data.
- `test-reread-record-when-action-uses-own-copy`: `Verify*` procedures call `Get(...)` to refresh records when the action under test modifies its own internal copy.
- `test-shared-vs-scenario-data-in-initialize`: Scenario data (orders, lines, posted documents) is created per test; supporting data (vendors, items, setup records) is shared via `Initialize()`.

If generated test code would violate any convention, correct it before emitting.

## Output

Output conforms to the DO output contract. For test generation tasks, findings at severity `info` document conventions applied; `minor` or higher indicates a structural correction the caller should review.

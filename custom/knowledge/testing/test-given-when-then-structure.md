---
bc-version: [all]
domain: testing
keywords: [given, when, then, comment, structure, test-procedure, scenario]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Every test procedure must use Given-When-Then comments

## Description

Test procedures must use `// [GIVEN]`, `// [WHEN]`, and `// [THEN]` comments to separate the three phases. These comments are structural markers, not decoration: a reader must be able to identify the setup, the action under test, and the verification without reading helper implementations. A test may have multiple `[GIVEN]` and `[THEN]` comments but must have exactly one `[WHEN]` — each test verifies exactly one action.

## Best Practice

Place `// [GIVEN]` before each precondition step, exactly one `// [WHEN]` before the action under test, and `// [THEN]` before each verification call. The comments appear inside the procedure body, not in the procedure name.

See sample: `test-given-when-then-structure.good.al`.

## Anti Pattern

Omitting the comments and writing test procedures that are a flat list of calls with no visible structure. A reader cannot identify which call is the action under test and which calls are setup or verification, making the test scenario opaque.

See sample: `test-given-when-then-structure.bad.al`.

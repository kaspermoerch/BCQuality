---
bc-version: [all]
domain: testing
keywords: [assertion, nested-call, libraryassert, variable, debugging, extracting]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Never nest procedure calls inside assertions

## Description

Procedure calls must never be nested inside `LibraryAssert` parameters. Evaluate the expression into a named variable first, then pass the variable to the assertion. Nested calls prevent a debugger from showing the intermediate result, produce misleading assertion error messages, and violate the same no-nesting rule that applies to production AL code.

This rule applies everywhere assertions appear — including inside `Verify*` procedures.

## Best Practice

Extract the result to a named variable before asserting. Choose a variable name that makes the assertion readable: `Exists`, `ActualCount`, `ActualMessage`. The named variable makes the failure observable in a debugger.

See sample: `test-no-nested-calls-in-assertions.good.al`.

## Anti Pattern

`LibraryAssert.IsTrue(Record.Get(Id), 'Message')` or `LibraryAssert.AreEqual(Expected, ComputeValue(Record), 'Message')`. When the assertion fails, the error message reveals the expected and actual values but not the intermediate state that produced the actual value.

See sample: `test-no-nested-calls-in-assertions.bad.al`.

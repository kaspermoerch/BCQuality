---
bc-version: [all]
domain: testing
keywords: [assertion, verify, libraryassert, test-procedure, inline, verify-procedure]
technologies: [al]
countries: [w1]
application-area: [all]
---

# All assertions must be in dedicated Verify* procedures

## Description

`LibraryAssert` calls must never appear directly in a test procedure. Every assertion belongs in a dedicated `Verify*` procedure with a descriptive name that declares what is being verified. This is the verification-specific extension of `test-delegate-to-helper-procedures`: the test procedure declares *what* should be true; the `Verify*` procedure checks *how* to confirm it.

Name verification procedures descriptively based on the outcome: `VerifyDispatchLocationRemoved`, `VerifyWarehouseShipmentReopened`, `VerifySerialNoAssignedToPurchaseLine`. Do not name them after the assertion mechanism: `VerifyFieldValue` or `VerifyRecord`.

## Best Practice

Extract every assertion into a named `local procedure Verify...` procedure. The `Verify*` procedure uses `LibraryAssert` internally and is called from the `// [THEN]` phase of the test procedure.

See sample: `test-assertions-in-verify-procedures.good.al`.

## Anti Pattern

Placing `LibraryAssert.AreEqual`, `LibraryAssert.IsTrue`, or `LibraryAssert.ExpectedError` calls directly in the test procedure body. The test procedure mixes scenario structure with verification mechanics, and the assertion cannot be reused by other tests.

See sample: `test-assertions-in-verify-procedures.bad.al`.

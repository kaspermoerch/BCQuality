---
bc-version: [all]
domain: testing
keywords: [helper, test-procedure, inline-logic, record-manipulation, delegation, create, verify]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Test procedures must delegate everything to named helper procedures

## Description

A test procedure body must contain only: a call to `Initialize()`, calls to helper procedures (`Create*`, `Run*`, `Assign*`, `Post*`, `Delete*`), calls to verification procedures (`Verify*`), `Commit()` when needed before `asserterror`, and `asserterror` itself. Direct record manipulation, `Validate` calls, `LibraryAssert` calls, and business logic do not belong in the test procedure body. The test procedure reads like a specification; helpers contain the implementation details.

## Best Practice

Every step of the test — creating data, triggering the action, verifying the result — is wrapped in a descriptively-named procedure. Helper procedures use verb-prefixed names: `Create*`, `Release*`, `Run*`, `Assign*`, `Post*`. Verification procedures use `Verify*`.

See sample: `test-delegate-to-helper-procedures.good.al`.

## Anti Pattern

Inserting records, calling `Validate`, running assertions, or computing values directly in the test procedure body. The test mixes scenario intent with implementation, making the scenario opaque and the implementation unreusable.

See sample: `test-delegate-to-helper-procedures.bad.al`.

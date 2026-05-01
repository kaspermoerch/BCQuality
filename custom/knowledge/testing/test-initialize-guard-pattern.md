---
bc-version: [all]
domain: testing
keywords: [initialize, guard, commit, initialized, shared-data, test-codeunit, once]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Test Initialize must use a guard, Commit, and set Initialized last

## Description

The `Initialize` procedure in a test codeunit creates shared reference data used by all tests in the codeunit. It must be guarded so it runs only once per test codeunit execution. `Commit()` must be called before setting the guard flag so shared data survives any subsequent `asserterror` rollbacks. `Initialized := true` must be the very last statement so a partial failure does not silently leave the guard set while shared data was not fully committed.

Every test procedure must call `Initialize()` as its first statement.

## Best Practice

Check `if Initialized then exit` as the first statement. Create shared supporting data (items, vendors, customers, setup records). Call `Commit()`. Set `Initialized := true` as the final statement. Use `this.` to qualify member access throughout the procedure.

See sample: `test-initialize-guard-pattern.good.al`.

## Anti Pattern

Omitting the guard (Initialize runs for every test), omitting `Commit()` (shared data is rolled back by `asserterror`), or setting `Initialized := true` before `Commit()` (a partial failure leaves the guard set while shared data was not committed).

See sample: `test-initialize-guard-pattern.bad.al`.

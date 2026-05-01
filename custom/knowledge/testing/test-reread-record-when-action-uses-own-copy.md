---
bc-version: [all]
domain: testing
keywords: [reread, get, stale, record, verify, action, copy, var]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Re-read records in Verify procedures when the action modifies its own copy

## Description

When the action under test retrieves and updates its own internal copy of a record, the local variable in the test procedure becomes stale — it holds values from before the action ran. The `Verify*` procedure must call `Get(...)` with the record's primary key to obtain a fresh copy before asserting.

When the test passes the record by `var` directly through the action and the action modifies it in place, the caller's copy is already current and no re-read is needed.

## Best Practice

In `Verify*` procedures, declare a fresh record variable, call `Get(EntryNo)` or the appropriate primary key lookup, and then assert against the fresh copy. Name the fresh variable to distinguish it: `RefreshedEntry`, `UpdatedLine`.

See sample: `test-reread-record-when-action-uses-own-copy.good.al`.

## Anti Pattern

Asserting field values on the stale local variable after an action that loaded and modified its own copy. The assertion evaluates the pre-action values, producing a false pass or a misleading failure message.

See sample: `test-reread-record-when-action-uses-own-copy.bad.al`.

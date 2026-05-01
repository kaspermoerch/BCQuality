---
bc-version: [all]
domain: testing
keywords: [commit, asserterror, rollback, test-data, error, transaction]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Call Commit before asserterror when verification needs test data

## Description

`asserterror` catches the expected error but also rolls back the current transaction. Any test data created in that transaction — records inserted or modified before the `asserterror` — is discarded by the rollback. When the verification phase needs that data (for example, to confirm a record still exists or has not changed), `Commit()` must be called before `asserterror` to persist the data outside the transaction boundary.

## Best Practice

Create test data, call `Commit()`, call `asserterror`, then verify. The `Commit()` call belongs between the last data-modifying step and the `asserterror` call.

See sample: `test-commit-before-asserterror.good.al`.

## Anti Pattern

Creating test data and calling `asserterror` without an intervening `Commit()`. The verification that follows will not find the data because it was rolled back with the failed transaction.

See sample: `test-commit-before-asserterror.bad.al`.

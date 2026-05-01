---
bc-version: [all]
domain: style
keywords: [variable, naming, abbreviation, parameter, procedure, readability]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Variable and procedure names use full words, not abbreviations

## Description

AL variable names, parameter names, and procedure names must use full words. Abbreviations such as `GLAccNo`, `EmpTypeDimCode`, `JLE`, and `Mgt` degrade readability and lose meaning for readers unfamiliar with the specific domain. Codeunit variable names must not include the type name when the declaration already makes the type explicit — `CompanyVehicleSynchronization` not `SyncCodeunit`.

The only exceptions are platform-mandated signatures — event subscriber names that must match a specific event, or BC table names that are themselves abbreviated (such as `GenJnlLine` when matching a platform signature exactly).

## Best Practice

Use full words: `GeneralLedgerAccountNo`, `EmployeeTypeDimensionCode`, `JobLedgerEntry`, `CompanyVehicleGroupSynchronization`. When a variable name is long but unambiguous, keep it. Prefer full verbs in procedure names: `SynchronizeCompanyVehicleGroup` over `SyncVehicleGroup`.

See sample: `variable-naming-no-abbreviations.good.al`.

## Anti Pattern

`GLAccNo`, `EmpDimCode`, `JLE`, `SyncCodeunit`, `MgtCU`. These force every reader to maintain a mental decode table, which is especially costly during code review and onboarding.

See sample: `variable-naming-no-abbreviations.bad.al`.

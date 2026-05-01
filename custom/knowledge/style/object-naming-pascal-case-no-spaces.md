---
bc-version: [all]
domain: style
keywords: [naming, object-name, pascal-case, spaces, suffix, abbreviation, verb, length]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Object names use PascalCase without spaces, full verbs, and fit within 30 characters

## Description

AL object names are limited to 30 characters including the mandatory partner suffix. Spaces in object names are legal but produce names that are harder to reference in code. Abbreviated verbs save characters but produce names whose meaning degrades over time. When approaching the 30-character limit, shorten the noun phrase before shortening the verb — `SynchronizeVehicleGroup_PTE` is preferable to `SyncVehicleGrp_PTE`. Do not embed the type name in the object name (`Codeunit`, `Mgt`, `Meth`).

## Best Practice

PascalCase, no spaces, full verbs (`Synchronize` not `Sync`, `Initialize` not `Init`), noun phrase trimmed last. Examples: `SynchronizeCompanyVehicle_PTE`, `UpdateSOPackageTrack_PTE`, `CreatePurchWhseDocument_PTE`.

See sample: `object-naming-pascal-case-no-spaces.good.al`.

## Anti Pattern

`"Synchronize Company Vehicle_PTE"` (spaces), `"Sync Veh Grp_PTE"` (abbreviated verb and noun), `"SyncVehicleGroupCodeunit_PTE"` (type name in object name). Each of these violates one or more naming rules and produces an inconsistent object catalog.

See sample: `object-naming-pascal-case-no-spaces.bad.al`.

---
bc-version: [all]
domain: style
keywords: [key, primary-key, naming, pk, index, secondary-key]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Name table keys PK, Key1, Key2 — not descriptively

## Description

Table keys in AL must be named systematically: `PK` for the primary (clustered) key and `Key1`, `Key2`, and so on for secondary keys. Descriptive key names — `CustomerKey`, `DocumentDateIndex` — appear meaningful but create inconsistency across the codebase and carry no functional advantage. The key field list already documents what the key covers; the name does not need to repeat it.

## Best Practice

Use `PK` for the clustered primary key and sequential `Key1`, `Key2` for all secondary keys, regardless of what fields they contain. This naming is uniform, predictable, and matches what AL practitioners expect.

See sample: `key-naming-pk-key1.good.al`.

## Anti Pattern

Naming keys descriptively: `CustomerKey`, `DocumentDateIndex`, `StatusSortKey`. These names create non-uniform naming that reviewers must interpret, and they do not match the systematic convention used throughout the base application.

See sample: `key-naming-pk-key1.bad.al`.

---
bc-version: [all]
domain: style
keywords: [tablerelation, field, foreign-key, lookup, primary-key, relation]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Specify the related field in TableRelation, not just the table

## Description

`TableRelation` requires both the related table and the specific field that the relation targets. Omitting the field name causes the platform to infer the primary key field implicitly. This is ambiguous for reviewers who do not know the related table's schema, fragile if the primary key changes, and inconsistent with how all native BC fields are written. Always write `TableRelation = "RelatedTable".FieldName;`.

## Best Practice

Always specify the field explicitly: `TableRelation = "CompanyVehicleGroup_PTE".Code;`, `TableRelation = Employee."No.";`. This makes the relation unambiguous, aids static analysis, and matches native BC patterns.

See sample: `define-tablerelation-with-field.good.al`.

## Anti Pattern

Writing `TableRelation = "CompanyVehicleGroup_PTE";` without naming the field. The platform infers the primary key, which silently changes behavior if the table's clustered key ever changes and hides the intent from code reviewers.

See sample: `define-tablerelation-with-field.bad.al`.

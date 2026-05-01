---
bc-version: [all]
domain: style
keywords: [with, implicit-with, rec, aa0022, readability, scope, field-access]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Never use implicit with — always prefix record fields with the record variable

## Description

AL's implicit `with` statement allows unqualified access to fields of a record variable inside a trigger or procedure. CodeCop rule AA0022 prohibits it. The reason is scope ambiguity: a reader cannot determine whether `"Customer No."` refers to a field on the current record, a local variable, a global variable, or a parameter. When a procedure receives multiple record parameters with overlapping field names, implicit with becomes a correctness hazard, not just a readability problem.

Always qualify record field access with the record variable: `Rec."Customer No."`, `SalesHeader."Document Type"`, `PurchaseLine."Line No."`.

## Best Practice

Use the explicit record variable prefix on every field access. In table and page triggers, use `Rec.FieldName`. In procedures that receive records by value or by reference, use the parameter name as the qualifier.

See sample: `avoid-implicit-with.good.al`.

## Anti Pattern

Relying on AL's implicit with in triggers or procedures: writing `"Customer No."` when `Rec."Customer No."` is intended. The implicit with is especially dangerous when the procedure also receives other record parameters with overlapping field names — the compiler resolves the reference silently.

See sample: `avoid-implicit-with.bad.al`.

---
bc-version: [all]
domain: style
keywords: [trigger, event-subscriber, tableextension, oninsert, onmodify, ondelete, onvalidate]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Prefer table triggers over codeunit event subscribers

## Description

When business logic belongs to insert, modify, delete, rename, or field-validation behavior on a table, the correct entry point is the table or tableextension trigger — not a codeunit event subscriber. Codeunit event subscribers for table trigger events introduce unnecessary indirection, split the table's behavior across multiple objects, and can execute after or out of sequence relative to other trigger logic. The trigger surface that the platform provides on the table is the natural owner of persistence-level behavior.

Valid reasons to use a codeunit subscriber instead: the table trigger is known not to run in the target flow; the logic must stay decoupled due to an established cross-object architecture; or the implementation must react from another app boundary.

## Best Practice

Use `OnInsert`, `OnModify`, `OnDelete`, `OnRename`, and field `OnValidate` triggers in the table or tableextension as the entry point. Keep triggers thin — delegate complex business logic to a focused helper codeunit — but keep the *entry point* in the trigger.

See sample: `prefer-table-trigger-over-event-subscriber.good.al`.

## Anti Pattern

Subscribing to a table trigger event from a codeunit to perform work that belongs in the table or tableextension trigger. A subscriber that only exists to finish work the trigger could have done is a design smell — especially when it calls `Modify(false)` immediately after an insert or modify event to patch the just-written record.

See sample: `prefer-table-trigger-over-event-subscriber.bad.al`.

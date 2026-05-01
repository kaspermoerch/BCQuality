---
bc-version: [all]
domain: style
keywords: [codeunit, pattern, integration-event, onbefore, onafter, management, mgt, ishandled]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Use the generic method pattern for business action codeunits

## Description

Business action codeunits should follow the generic method pattern: one action per codeunit, with a public or internal entry procedure, an `OnBefore` integration event with an `IsHandled` parameter, a `Do` procedure that checks `IsHandled`, and an `OnAfter` integration event. Management or Mgt codeunits that accumulate multiple unrelated operations become hard to extend and test; subscribers cannot selectively intercept individual actions, and the codeunit grows without a clear boundary.

The entry procedure is always the public or internal surface. `OnBefore` fires after the record is initialized and before the action executes. `OnAfter` fires after the action completes. The table or page entry point calls the codeunit via a thin local procedure.

## Best Practice

Name the codeunit after the verb-noun action using PascalCase: `ProcessWidget_PTE`, `SynchronizeVehicle_PTE`. One action per codeunit. The calling object creates the codeunit variable locally and delegates to the entry procedure.

See sample: `generic-method-codeunit-pattern.good.al`.

## Anti Pattern

Creating a `WidgetManagement_PTE` codeunit that accumulates `ProcessWidget`, `SynchronizeWidget`, `ReleaseWidget`, and `ArchiveWidget`. Each action lacks its own `OnBefore`/`OnAfter` events, and the codeunit becomes a grab-bag with no clear ownership model.

See sample: `generic-method-codeunit-pattern.bad.al`.

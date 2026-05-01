---
bc-version: [all]
domain: style
keywords: [integration-event, subscriber, breaking-change, public-api, unused]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Never remove an existing IntegrationEvent

## Description

`[IntegrationEvent]` procedures form part of the public subscriber surface of a codeunit. Subscribers in other apps or modules may be bound to the event even when no local subscriber is visible. AL's dead-code detection does not cross app boundaries. Removing an integration event is a breaking change regardless of whether the compiler reports it as unused.

When refactoring a codeunit that fires an event, keep the event at the same logical point in the revised structure. An `OnBefore...` event must fire after the record is fully initialized and before the action executes, so subscribers can still modify the record before it is written.

## Best Practice

Treat every `[IntegrationEvent]` procedure as a permanently published API. When moving logic into sub-procedures during a refactor, move the event call with the operation it guards — do not drop it. Keep the `IsHandled` pattern on `OnBefore...` events so subscribers can replace the default behavior.

See sample: `never-remove-integration-events.good.al`.

## Anti Pattern

Removing a `[IntegrationEvent]` procedure because no subscriber appears to exist in the current repository, or because a static analysis tool reports it as unused. Any partner app that subscribes will fail at runtime when the consuming app is deployed.

See sample: `never-remove-integration-events.bad.al`.

---
bc-version: [all]
domain: testing
keywords: [confirmhandler, question, enqueue, libraryvariablestorage, handler, verify-question]
technologies: [al]
countries: [w1]
application-area: [all]
---

# ConfirmHandler must verify the expected question, not just supply a reply

## Description

When a test uses a `[ConfirmHandler]`, the handler must verify that the correct confirmation question was shown — not just return a reply. Without this check, a test passes even when a completely different confirmation dialog appears. The test procedure enqueues both the expected question text and the desired reply before triggering the action. The handler dequeues the expected question first, asserts it matches the actual question, then dequeues and returns the reply.

## Best Practice

Enqueue the expected question text and the desired reply in the test procedure (in that order). In the handler, dequeue the expected question, use `LibraryAssert.ExpectedMessage` to verify it matches the actual question, then dequeue and return the reply. Use `LibraryVariableStorage` for both directions.

See sample: `test-confirmhandler-verify-question.good.al`.

## Anti Pattern

A `[ConfirmHandler]` that dequeues only the reply and ignores the actual question text. Any confirmation dialog — expected or not — satisfies the handler, and the test provides no evidence that the correct business dialog was shown.

See sample: `test-confirmhandler-verify-question.bad.al`.

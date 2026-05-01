---
bc-version: [all]
domain: style
keywords: [label, local, global, text, var, scope, single-use]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Prefer local labels for single-use text constants

## Description

AL `Label` declarations can be placed in the object-level `var` section (global) or in a procedure-level `var` section (local). When a label is referenced by only one procedure, declare it locally inside that procedure. Global labels imply reuse across multiple procedures; when that is not the case, they mislead maintainers and clutter the global scope.

Test constants that are fixed values reused across multiple test procedures — dimension codes, document numbers, fixed identifiers — should be declared as global labels. But message text used by a single procedure belongs locally.

## Best Practice

Declare a label in the procedure's `var` section when only that procedure references it. Promote to global only when two or more procedures use the same label text.

See sample: `prefer-local-labels.good.al`.

## Anti Pattern

Declaring all labels at the object level as globals regardless of whether they are referenced once or many times. A reader scanning the global `var` section for shared state must wade through single-use text constants that happen to be declared globally.

See sample: `prefer-local-labels.bad.al`.

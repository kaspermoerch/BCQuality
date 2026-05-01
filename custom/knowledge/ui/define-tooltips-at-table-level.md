---
bc-version: [all]
domain: ui
keywords: [tooltip, table, page, field, definition, inheritance, duplication]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Define ToolTips at the table field level, not on page fields

## Description

`ToolTip` declarations belong on the field definition in the table or tableextension — not on page fields. A ToolTip defined at the table level is automatically inherited by every page that displays the field: list pages, card pages, FactBoxes, and API pages. A ToolTip on a page field overrides the table-level value only for that specific page, which is appropriate only when the page context justifies a different description. Duplicating the same ToolTip across every page is maintenance debt — when the text changes, every page must be updated individually.

## Best Practice

Declare `ToolTip` on the field in the table definition and include the required multilingual comment. Leave page field declarations without a `ToolTip` property unless the specific page needs a context-specific override.

See sample: `define-tooltips-at-table-level.good.al`.

## Anti Pattern

Defining `ToolTip` on page fields and omitting it from the table definition. The same text is duplicated across every page that shows the field, and pages that display the field without a tooltip override inherit nothing — they may show no tooltip at all.

See sample: `define-tooltips-at-table-level.bad.al`.

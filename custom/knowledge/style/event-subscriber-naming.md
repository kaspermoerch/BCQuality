---
bc-version: [all]
domain: style
keywords: [event-subscriber, naming, convention, procedure-name, objecttype]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Name event subscriber procedures ObjectType_ObjectName_EventName

## Description

Event subscriber procedures must follow the naming convention `ObjectType_ObjectName_EventName` — and optionally `_FieldName` when the event is field-specific. This convention makes the event source immediately visible in the procedure declaration without reading the `[EventSubscriber]` attribute. The `ObjectName` component excludes app-specific suffixes and prefixes (such as `_PTE` or `S4C`); use the base name only.

## Best Practice

Use the full convention: `Table_SalesHeader_OnAfterValidate_Status`, `Codeunit_ArticleFilterDataMgt_OnBeforeCollectData`, `Page_CustomerCard_OnAfterGetRecord`. Strip the object name suffix when constructing the procedure name. When a codeunit has many subscribers across multiple objects, consistent naming makes navigation and code review straightforward.

See sample: `event-subscriber-naming.good.al`.

## Anti Pattern

Using a procedure name that only describes what the subscriber does — `OnBeforeCollectArticleFilterData` or `HandleSalesHeaderStatusChange` — omitting the object context. When a codeunit has ten subscribers across five objects, ambiguous names force the reader to scan every `[EventSubscriber]` attribute to understand scope.

See sample: `event-subscriber-naming.bad.al`.

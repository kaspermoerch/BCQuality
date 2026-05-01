---
bc-version: [all]
domain: style
keywords: [id, object-id, field-id, app-json, object-range, object-id-ninja, draft]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Assign the lowest available object and field IDs first, then ignore AL Object ID Ninja warnings

## Description

When drafting AL code, do not spend time searching for the perfect ID that satisfies AL Object ID Ninja. Assign the lowest available object ID from the range declared in `app.json`, and assign the lowest available field IDs you can use for the new fields. If AL Object ID Ninja warns about a preferred allocation, ignore that warning during initial code generation.

The goal at this stage is to produce concrete, buildable code quickly. ID cleanup and final reservation choices can be made manually afterwards.

## Best Practice

Pick the first free object ID in the `app.json` range and continue with the next free IDs for related draft objects and fields. Keep numbering dense and obvious so generated code is easy to review and adjust later. Ignore AL Object ID Ninja warnings until the user is ready to normalize the assignments manually.

See sample: `assign-lowest-available-ids-ignore-object-id-ninja.good.al`.

## Anti Pattern

Pausing code generation to hunt for a tool-approved ID, skipping lower free IDs without a functional reason, or leaving placeholder IDs unresolved because AL Object ID Ninja raised a warning. That wastes time and delays implementation without improving the draft itself.

See sample: `assign-lowest-available-ids-ignore-object-id-ninja.bad.al`.
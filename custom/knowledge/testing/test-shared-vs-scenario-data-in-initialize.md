---
bc-version: [all]
domain: testing
keywords: [initialize, shared-data, scenario-data, global, test-isolation, mutable]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Initialize creates shared supporting data; scenario data belongs in the test

## Description

`Initialize()` creates data that all tests in the codeunit share: vendors, customers, items, setup records, journal templates. Scenario-specific data — purchase orders, transfer orders, journal lines, posted documents — belongs in individual test procedures via helper calls. Placing scenario data in `Initialize()` causes every test to depend on that data, makes failures cascade, and makes individual tests impossible to run in isolation.

The rule: data that a test modifies, posts, deletes, or creates as the subject of its scenario must be created per test. Data that tests only read and never modify may be shared.

## Best Practice

Keep `Initialize()` to immutable or read-only supporting entities. Create scenario data in the test procedure via `Create*` helper calls. Global variables store only shared supporting records and library codeunits.

See sample: `test-shared-vs-scenario-data-in-initialize.good.al`.

## Anti Pattern

Moving purchase orders, sales orders, journal lines, or other mutable scenario records into `Initialize()` to avoid repeating creation calls. Any test that modifies or posts the shared record pollutes state for all subsequent tests.

See sample: `test-shared-vs-scenario-data-in-initialize.bad.al`.

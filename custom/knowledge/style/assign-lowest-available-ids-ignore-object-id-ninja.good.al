// app.json object range: { "from": 50100, "to": 51099 }
// IDs are per object type — a tableextension and a codeunit can both use 50100.
// Use the lowest free ID for each type independently.
tableextension 50100 "CustomerVehicleSetup_PTE" extends Customer
{
    fields
    {
        field(50100; "Vehicle Group Code_PTE"; Code[20])
        {
        }

        field(50101; "Vehicle Sync Enabled_PTE"; Boolean)
        {
        }
    }
}

// First free codeunit ID is also 50100 — independent of the tableextension above.
codeunit 50100 "SynchronizeCustomerVehicle_PTE"
{
}
// app.json object range: { "from": 50100, "to": 51099 }
// IDs are per object type — tableextension and codeunit IDs are independent.
// AL Object ID Ninja suggested 50137 for the tableextension and 50182 for the codeunit
// because it avoids IDs reserved by other branches — but the user will normalize assignments manually.
// The result: IDs are scattered across the range for no functional reason.
tableextension 50137 "CustomerVehicleSetup_PTE" extends Customer
{
    fields
    {
        field(50990; "Vehicle Group Code_PTE"; Code[20])
        {
        }

        field(50999; "Vehicle Sync Enabled_PTE"; Boolean)
        {
        }
    }
}

// Ninja-preferred gap ID — first free codeunit ID (50100) would have been correct.
codeunit 50182 "SynchronizeCustomerVehicle_PTE"
{
}
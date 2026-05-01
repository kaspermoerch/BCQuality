// Abbreviations obscure meaning — reader needs a mental decode table.
local procedure AssignDimToEntry(JLE: Record "Job Ledger Entry"; GLAccNo: Code[20])
var
    DimSetEntry: Record "Dimension Set Entry";
    ArchiveCodeunit: Codeunit "ArchiveJobLedgerEntry_PTE"; // Type name in variable name
begin
    DimSetEntry.SetRange("Dimension Set ID", JLE."Dimension Set ID");

    if not DimSetEntry.FindFirst() then
        exit;

    ArchiveCodeunit.Archive(JLE);
end;

local procedure SyncVehicleGrp(VehGrp: Record "CompanyVehicleGroup_PTE")
var
    SyncCU: Codeunit "SynchronizeCompanyVehicle_PTE"; // Abbreviated variable for a codeunit
begin
    SyncCU.SynchronizeCompanyVehicle(VehGrp);
end;

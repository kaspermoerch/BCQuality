local procedure AssignDimensionToJobLedgerEntry(JobLedgerEntry: Record "Job Ledger Entry"; GeneralLedgerAccountNo: Code[20])
var
    DimensionSetEntry: Record "Dimension Set Entry";
    JobLedgerEntryArchive: Codeunit "ArchiveJobLedgerEntry_PTE";
begin
    DimensionSetEntry.SetRange("Dimension Set ID", JobLedgerEntry."Dimension Set ID");

    if not DimensionSetEntry.FindFirst() then
        exit;

    JobLedgerEntryArchive.Archive(JobLedgerEntry);
end;

local procedure SynchronizeCompanyVehicleGroup(CompanyVehicleGroup: Record "CompanyVehicleGroup_PTE")
var
    CompanyVehicleGroupSynchronization: Codeunit "SynchronizeCompanyVehicle_PTE";
begin
    CompanyVehicleGroupSynchronization.SynchronizeCompanyVehicle(CompanyVehicleGroup);
end;

// Stale — the action used its own internal copy; JobLedgerEntry still holds pre-action values.
local procedure VerifyJobLedgerEntryMarkedAsReallocated(JobLedgerEntry: Record "Job Ledger Entry")
begin
    // JobLedgerEntry."Reallocated_PTE" is still false here —
    // the action changed a different copy of the record.
    LibraryAssert.IsTrue(JobLedgerEntry."Reallocated_PTE", 'Job Ledger Entry should be marked as reallocated.');
end;

// The action (AddReallocationEntry) internally calls JobLedgerEntry.Get() and modifies its own copy.
// The test procedure's local variable is stale — re-read is required.
local procedure VerifyJobLedgerEntryMarkedAsReallocated(JobLedgerEntry: Record "Job Ledger Entry")
var
    RefreshedEntry: Record "Job Ledger Entry";
begin
    RefreshedEntry.Get(JobLedgerEntry."Entry No.");

    this.LibraryAssert.IsTrue(RefreshedEntry."Reallocated_PTE", 'Job Ledger Entry should be marked as reallocated.');
end;

// The action updates the record via a var parameter — no re-read needed,
// the caller's copy is already current.
local procedure VerifyDirectUnitCostBasedOnBuyFromVendor(PurchaseLine: Record "Purchase Line"; ExpectedUnitCost: Decimal)
begin
    this.LibraryAssert.AreEqual(ExpectedUnitCost, PurchaseLine."Direct Unit Cost", 'Direct Unit Cost should be based on Buy-from Vendor.');
end;

// Bad 1: No guard — Initialize runs for every test, creating duplicate shared data.
local procedure Initialize()
begin
    LibraryInventory.CreateItem(GlobalItem);
    LibraryPurchase.CreateVendor(GlobalVendor);
    Commit();
end;

// Bad 2: Initialized set before Commit — a partial failure leaves the guard set
// while shared data was not committed.
local procedure Initialize()
begin
    if Initialized then
        exit;

    LibraryInventory.CreateItem(GlobalItem);
    Initialized := true; // Guard set too early
    Commit();
end;

// Bad 3: No Commit — shared data is rolled back by any subsequent asserterror.
local procedure Initialize()
begin
    if Initialized then
        exit;

    LibraryInventory.CreateItem(GlobalItem);
    LibraryPurchase.CreateVendor(GlobalVendor);
    Initialized := true;
end;

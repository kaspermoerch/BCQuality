// Initialize — shared supporting data only. Read-only across all tests.
local procedure Initialize()
begin
    if this.Initialized then
        exit;

    this.LibraryInventory.CreateItem(this.GlobalItem);       // Read-only across tests.
    this.LibraryPurchase.CreateVendor(this.GlobalVendor);   // Read-only across tests.

    Commit();

    this.Initialized := true;
end;

// Each test creates its own scenario data via a helper procedure.
[Test]
procedure "Purchase Order is posted successfully"()
var
    PurchaseHeader: Record "Purchase Header";
begin
    this.Initialize();

    // [GIVEN] A purchase order — scenario data created per test.
    this.CreatePurchaseOrder(PurchaseHeader, this.GlobalVendor, this.GlobalItem);

    // [WHEN] The order is posted
    this.PostPurchaseOrder(PurchaseHeader);

    // [THEN] A posted purchase receipt exists
    this.VerifyPostedPurchaseReceiptExists(PurchaseHeader);
end;

// Scenario data placed in Initialize — every test is coupled to this shared purchase order.
local procedure Initialize()
begin
    if Initialized then
        exit;

    LibraryInventory.CreateItem(GlobalItem);
    LibraryPurchase.CreateVendor(GlobalVendor);

    // Scenario data — belongs in individual tests, not here.
    LibraryPurchase.CreatePurchHeader(GlobalPurchaseHeader, GlobalPurchaseHeader."Document Type"::Order, GlobalVendor."No.");
    LibraryPurchase.CreatePurchaseLine(GlobalPurchaseLine, GlobalPurchaseHeader, GlobalPurchaseLine.Type::Item, GlobalItem."No.", 1);

    Commit();

    Initialized := true;
end;

// Test posts the shared order — pollutes state for every test that runs after it.
[Test]
procedure "Purchase Order is posted successfully"()
begin
    Initialize();

    PostPurchaseOrder(GlobalPurchaseHeader); // Modifies shared state.

    VerifyPostedPurchaseReceiptExists(GlobalPurchaseHeader);
end;

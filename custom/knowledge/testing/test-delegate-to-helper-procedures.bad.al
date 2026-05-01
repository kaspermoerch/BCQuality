codeunit 90001 "Widget Tests_PTE"
{
    Subtype = Test;

    [Test]
    procedure "Direct Unit Cost is based on Buy-from Vendor"()
    var
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        BuyFromVendor: Record Vendor;
        PayToVendor: Record Vendor;
    begin
        Initialize();

        // [GIVEN] — inline record creation directly in the test procedure
        LibraryPurchase.CreateVendor(BuyFromVendor);
        LibraryPurchase.CreateVendor(PayToVendor);
        LibraryPurchase.CreatePurchHeader(PurchaseHeader, PurchaseHeader."Document Type"::Order, BuyFromVendor."No.");
        PurchaseHeader.Validate("Pay-to Vendor No.", PayToVendor."No.");
        PurchaseHeader.Modify(true);

        // [WHEN] — inline
        LibraryPurchase.CreatePurchaseLine(PurchaseLine, PurchaseHeader, PurchaseLine.Type::Item, GlobalItem."No.", 1);

        // [THEN] — assertion directly in the test procedure
        LibraryAssert.AreEqual(BuyFromVendor."Unit Price", PurchaseLine."Direct Unit Cost", 'Wrong Direct Unit Cost');
    end;
}

codeunit 90001 "Widget Tests_PTE"
{
    Subtype = Test;

    [Test]
    procedure "Direct Unit Cost is based on Buy-from Vendor"()
    var
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
    begin
        this.Initialize();

        // [GIVEN] Purchase Order with different Buy-from and Pay-to Vendor
        this.CreatePurchaseOrderWithDifferentPayToVendor(PurchaseHeader);

        // [WHEN] Item is added to the Purchase Order
        this.CreatePurchaseOrderLine(PurchaseHeader, PurchaseLine);

        // [THEN] Direct Unit Cost is based on the Buy-from Vendor
        this.VerifyDirectUnitCostBasedOnBuyFromVendor(PurchaseLine);

        // [THEN] Vendors are not changed
        this.VerifyVendorsNotChanged(PurchaseHeader);
    end;
}

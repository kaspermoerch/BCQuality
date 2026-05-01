codeunit 90001 "Widget Tests_PTE"
{
    Subtype = Test;

    [Test]
    procedure "Serial No. is assigned to Purchase Line from Inbound Import Line"()
    var
        InboundImportLine: Record "InboundImportLine_PTE";
        WarehouseReceiptLine: Record "Warehouse Receipt Line";
    begin
        this.Initialize();

        // [GIVEN] A Warehouse Receipt Line linked to a Purchase Line
        this.CreateWarehouseReceipt(WarehouseReceiptLine);

        // [GIVEN] An Inbound Import Line with a Serial No.
        this.InitInboundImportLineWithSerialNo(InboundImportLine, WarehouseReceiptLine);

        // [WHEN] Serial No. is updated for the Warehouse Receipt Line
        this.RunUpdateWarehouseReceiptLineSerialNo(WarehouseReceiptLine, InboundImportLine);

        // [THEN] Serial No. is assigned to the Purchase Line
        this.VerifySerialNoAssignedToPurchaseLine(WarehouseReceiptLine, InboundImportLine);
    end;
}

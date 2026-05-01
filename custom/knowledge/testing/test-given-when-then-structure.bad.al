codeunit 90001 "Widget Tests_PTE"
{
    Subtype = Test;

    // No Given-When-Then comments — reader cannot identify which call is the action under test.
    [Test]
    procedure TestSerialNo()
    var
        InboundImportLine: Record "InboundImportLine_PTE";
        WarehouseReceiptLine: Record "Warehouse Receipt Line";
    begin
        Initialize();
        CreateWarehouseReceipt(WarehouseReceiptLine);
        InitInboundImportLineWithSerialNo(InboundImportLine, WarehouseReceiptLine);
        RunUpdateWarehouseReceiptLineSerialNo(WarehouseReceiptLine, InboundImportLine);
        VerifySerialNoAssignedToPurchaseLine(WarehouseReceiptLine, InboundImportLine);
    end;
}

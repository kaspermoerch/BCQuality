codeunit 90001 "Widget Tests_PTE"
{
    Subtype = Test;

    [Test]
    procedure "Dispatch Location is cleared on Transfer Line deletion"()
    var
        TransferHeader: Record "Transfer Header";
        TransferLine: Record "Transfer Line";
    begin
        this.Initialize();

        // [GIVEN] Transfer Order with a Dispatch Location
        this.CreateTransferOrderWithDispatchLocation(TransferHeader, TransferLine);

        // [WHEN] Transfer Line is deleted
        this.DeleteTransferLine(TransferLine);

        // [THEN] Dispatch Location is removed from the Transfer Order
        this.VerifyDispatchLocationRemoved(TransferHeader);
    end;

    local procedure VerifyDispatchLocationRemoved(TransferHeader: Record "Transfer Header")
    begin
        TransferHeader.Get(TransferHeader."No.");
        this.LibraryAssert.AreEqual('', TransferHeader."Dispatch Location Code_PTE", 'Dispatch Location should be cleared.');
    end;
}

codeunit 90001 "Widget Tests_PTE"
{
    Subtype = Test;

    [Test]
    procedure "Dispatch Location is cleared on Transfer Line deletion"()
    var
        TransferHeader: Record "Transfer Header";
        TransferLine: Record "Transfer Line";
    begin
        Initialize();

        CreateTransferOrderWithDispatchLocation(TransferHeader, TransferLine);
        DeleteTransferLine(TransferLine);

        // Assertion placed directly in the test procedure — violates the rule.
        TransferHeader.Get(TransferHeader."No.");
        LibraryAssert.AreEqual('', TransferHeader."Dispatch Location Code_PTE", 'Dispatch Location should be cleared.');
    end;
}

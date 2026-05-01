codeunit 90001 "Widget Tests_PTE"
{
    Subtype = Test;

    [Test]
    procedure "Deleting Transfer Order with lines is cancelled when user declines"()
    var
        TransferHeader: Record "Transfer Header";
    begin
        Initialize();

        // [GIVEN] Transfer Order with lines
        CreateTransferOrderWithLines(TransferHeader);

        // No Commit — data will be rolled back by asserterror.
        asserterror TransferHeader.Delete(true);

        // [THEN] This verification will fail — the record was rolled back with the transaction.
        VerifyOrderStillExists(TransferHeader);
    end;
}

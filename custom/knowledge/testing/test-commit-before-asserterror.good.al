codeunit 90001 "Widget Tests_PTE"
{
    Subtype = Test;

    [Test]
    procedure "Deleting Transfer Order with lines is cancelled when user declines"()
    var
        TransferHeader: Record "Transfer Header";
    begin
        this.Initialize();

        // [GIVEN] Transfer Order with lines
        this.CreateTransferOrderWithLines(TransferHeader);

        Commit(); // Persist data before asserterror rolls back the transaction.

        // [WHEN] User declines deletion
        asserterror TransferHeader.Delete(true);

        // [THEN] Transfer Order still exists
        this.VerifyOrderStillExists(TransferHeader);
    end;
}

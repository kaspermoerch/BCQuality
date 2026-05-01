codeunit 90001 "Widget Tests_PTE"
{
    Subtype = Test;

    [Test]
    [HandlerFunctions('ConfirmHandler')]
    procedure "Deleting Transfer Line with Sales Order reference prompts for confirmation"()
    var
        TransferLine: Record "Transfer Line";
        SalesHeader: Record "Sales Header";
    begin
        Initialize();

        CreateTransferLineWithSalesOrderLink(TransferLine, SalesHeader);

        // Only the reply is enqueued — the question is never verified.
        LibraryVariableStorage.Enqueue(true);

        DeleteTransferLine(TransferLine);
    end;

    [ConfirmHandler]
    procedure ConfirmHandler(Question: Text[1024]; var Reply: Boolean)
    begin
        // Question ignored — any confirmation dialog satisfies this handler.
        Reply := LibraryVariableStorage.DequeueBoolean();
    end;
}

codeunit 90001 "Widget Tests_PTE"
{
    Subtype = Test;

    [Test]
    [HandlerFunctions('ConfirmHandler')]
    procedure "Deleting Transfer Line with Sales Order reference prompts for confirmation"()
    var
        TransferLine: Record "Transfer Line";
        SalesHeader: Record "Sales Header";
        ExpectedConfirmationQst: Label 'The Transfer Line is linked to Sales Order %1. Do you want to delete it?', Locked = true;
        ExpectedQuestion: Text;
    begin
        this.Initialize();

        // [GIVEN] Transfer Line linked to a Sales Order
        this.CreateTransferLineWithSalesOrderLink(TransferLine, SalesHeader);

        // Enqueue expected question and reply before triggering the action.
        ExpectedQuestion := StrSubstNo(ExpectedConfirmationQst, SalesHeader."No.");
        this.LibraryVariableStorage.Enqueue(ExpectedQuestion);
        this.LibraryVariableStorage.Enqueue(true);

        // [WHEN] Transfer Line is deleted
        this.DeleteTransferLine(TransferLine);

        // [THEN] Correct confirmation dialog was shown — verified inside ConfirmHandler.
    end;

    [ConfirmHandler]
    procedure ConfirmHandler(Question: Text[1024]; var Reply: Boolean)
    var
        ExpectedQuestion: Text;
        ActualQuestion: Text;
    begin
        ExpectedQuestion := this.LibraryVariableStorage.DequeueText();
        ActualQuestion := Question;

        this.LibraryAssert.ExpectedMessage(ExpectedQuestion, ActualQuestion);

        Reply := this.LibraryVariableStorage.DequeueBoolean();
    end;
}

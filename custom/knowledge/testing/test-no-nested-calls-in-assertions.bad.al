local procedure VerifyOrderStillExists(TransferHeader: Record "Transfer Header")
begin
    // Get nested inside IsTrue — failure message reveals nothing useful about why Get returned false.
    LibraryAssert.IsTrue(TransferHeader.Get(TransferHeader."No."), 'Transfer Order should still exist.');
end;

local procedure VerifyLineCount(TransferHeader: Record "Transfer Header"; ExpectedCount: Integer)
var
    TransferLine: Record "Transfer Line";
begin
    TransferLine.SetRange("Document No.", TransferHeader."No.");

    // Count nested inside AreEqual — intermediate value is invisible to the debugger.
    LibraryAssert.AreEqual(ExpectedCount, TransferLine.Count(), 'Unexpected number of Transfer Lines.');
end;

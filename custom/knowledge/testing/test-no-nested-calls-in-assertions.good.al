local procedure VerifyOrderStillExists(TransferHeader: Record "Transfer Header")
var
    Exists: Boolean;
begin
    Exists := TransferHeader.Get(TransferHeader."No.");

    this.LibraryAssert.IsTrue(Exists, 'Transfer Order should still exist after declined deletion.');
end;

local procedure VerifyLineCount(TransferHeader: Record "Transfer Header"; ExpectedCount: Integer)
var
    TransferLine: Record "Transfer Line";
    ActualCount: Integer;
begin
    TransferLine.SetRange("Document No.", TransferHeader."No.");
    ActualCount := TransferLine.Count();

    this.LibraryAssert.AreEqual(ExpectedCount, ActualCount, 'Unexpected number of Transfer Lines.');
end;

tableextension 50100 "Widget Ext_PTE" extends Widget
{
    trigger OnInsert()
    begin
        this.SetDefaultValues();
    end;

    trigger OnModify()
    begin
        this.ValidateStatusTransition();
    end;

    local procedure SetDefaultValues()
    begin
        if Rec."Created Date" = 0D then
            Rec."Created Date" := Today();
    end;

    local procedure ValidateStatusTransition()
    begin
        if (xRec.Status = xRec.Status::Released) and (Rec.Status = Rec.Status::Open) then
            Error(CannotReopenReleasedWidgetErr);
    end;

    var
        CannotReopenReleasedWidgetErr: Label 'A released widget cannot be reopened.', Locked = true;
}

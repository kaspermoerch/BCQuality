codeunit 50100 "Widget Event Handlers_PTE"
{
    // Logic that belongs in the tableextension OnInsert trigger is placed in an event subscriber instead.
    [EventSubscriber(ObjectType::Table, Database::Widget, OnAfterInsertEvent, '', false, false)]
    local procedure Table_Widget_OnAfterInsertEvent(var Rec: Record Widget)
    begin
        if Rec."Created Date" = 0D then begin
            Rec."Created Date" := Today();
            Rec.Modify(false); // Extra write that the trigger would have avoided
        end;
    end;

    // Logic that belongs in the tableextension OnModify trigger is placed in an event subscriber instead.
    [EventSubscriber(ObjectType::Table, Database::Widget, OnAfterModifyEvent, '', false, false)]
    local procedure Table_Widget_OnAfterModifyEvent(var Rec: Record Widget; var xRec: Record Widget)
    begin
        if (xRec.Status = xRec.Status::Released) and (Rec.Status = Rec.Status::Open) then
            Error(CannotReopenReleasedWidgetErr);
    end;

    var
        CannotReopenReleasedWidgetErr: Label 'A released widget cannot be reopened.', Locked = true;
}

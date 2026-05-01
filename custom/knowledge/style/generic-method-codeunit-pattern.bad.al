// All actions in one management codeunit — no OnBefore/OnAfter, no IsHandled.
codeunit 50102 "WidgetManagement_PTE"
{
    internal procedure ProcessWidget(var Widget: Record Widget)
    begin
        Widget.Validate(Status, Widget.Status::Processed);
        Widget.Modify(true);
    end;

    internal procedure SynchronizeWidget(var Widget: Record Widget)
    begin
        Widget.Validate(Status, Widget.Status::Synchronized);
        Widget.Modify(true);
    end;

    internal procedure ArchiveWidget(var Widget: Record Widget)
    begin
        Widget.Validate(Status, Widget.Status::Archived);
        Widget.Modify(true);
    end;
}

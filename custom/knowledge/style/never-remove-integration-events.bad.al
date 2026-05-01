codeunit 50101 "ProcessWidget_PTE"
{
    internal procedure ProcessWidget(var Widget: Record Widget)
    begin
        // OnBeforeProcessWidget removed — "no subscriber found in this repo"
        Widget.Validate(Status, Widget.Status::Processed);
        Widget.Modify(true);
        // OnAfterProcessWidget removed — "no subscriber found in this repo"
        // Any partner app subscribed to these events will break at runtime.
    end;
}

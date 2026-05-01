codeunit 50140 "Widget Processor_PTE"
{
    // Each label declared locally in the procedure that uses it.
    internal procedure ProcessWidget(var Widget: Record Widget)
    var
        ProcessingCompleteMsg: Label 'Widget %1 has been processed.', Comment = '%1 = Widget No.';
    begin
        Widget.Validate(Status, Widget.Status::Processed);
        Widget.Modify(true);

        Message(ProcessingCompleteMsg, Widget."No.");
    end;

    internal procedure ArchiveWidget(var Widget: Record Widget)
    var
        ArchiveCompleteMsg: Label 'Widget %1 has been archived.', Comment = '%1 = Widget No.';
    begin
        Widget.Validate(Status, Widget.Status::Archived);
        Widget.Modify(true);

        Message(ArchiveCompleteMsg, Widget."No.");
    end;

    // Global label — reused by multiple procedures, so global placement is correct.
    var
        WidgetNotFoundErr: Label 'Widget %1 was not found.', Comment = '%1 = Widget No.', Locked = true;
}

codeunit 50140 "Widget Processor_PTE"
{
    internal procedure ProcessWidget(var Widget: Record Widget)
    begin
        Widget.Validate(Status, Widget.Status::Processed);
        Widget.Modify(true);

        Message(ProcessingCompleteMsg, Widget."No.");
    end;

    internal procedure ArchiveWidget(var Widget: Record Widget)
    begin
        Widget.Validate(Status, Widget.Status::Archived);
        Widget.Modify(true);

        Message(ArchiveCompleteMsg, Widget."No.");
    end;

    // All labels declared globally even though each is used by only one procedure.
    // A reader scanning the global var section cannot distinguish shared state from single-use text.
    var
        ProcessingCompleteMsg: Label 'Widget %1 has been processed.', Comment = '%1 = Widget No.';
        ArchiveCompleteMsg: Label 'Widget %1 has been archived.', Comment = '%1 = Widget No.';
        WidgetNotFoundErr: Label 'Widget %1 was not found.', Comment = '%1 = Widget No.', Locked = true;
}

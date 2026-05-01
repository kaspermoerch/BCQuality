// One action per codeunit with OnBefore / Do / OnAfter structure.
codeunit 50102 "ProcessWidget_PTE"
{
    internal procedure ProcessWidget(var Widget: Record Widget)
    var
        IsHandled: Boolean;
    begin
        OnBeforeProcessWidget(Widget, IsHandled);
        DoProcessWidget(Widget, IsHandled);
        OnAfterProcessWidget(Widget);
    end;

    local procedure DoProcessWidget(var Widget: Record Widget; IsHandled: Boolean)
    begin
        if IsHandled then
            exit;

        Widget.Validate(Status, Widget.Status::Processed);
        Widget.Modify(true);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeProcessWidget(var Widget: Record Widget; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterProcessWidget(var Widget: Record Widget)
    begin
    end;
}

// Thin entry point on the calling object — creates the codeunit and delegates.
tableextension 50103 "Widget Actions_PTE" extends Widget
{
    local procedure ProcessWidget()
    var
        ProcessWidget: Codeunit "ProcessWidget_PTE";
    begin
        ProcessWidget.ProcessWidget(Rec);
    end;
}

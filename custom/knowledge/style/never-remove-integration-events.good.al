codeunit 50101 "ProcessWidget_PTE"
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

    // Kept even though no local subscriber exists — external apps may subscribe.
    [IntegrationEvent(false, false)]
    local procedure OnBeforeProcessWidget(var Widget: Record Widget; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterProcessWidget(var Widget: Record Widget)
    begin
    end;
}

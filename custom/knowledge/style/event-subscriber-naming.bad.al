codeunit 50110 "Widget Subscribers_PTE"
{
    // Name describes what the subscriber does, but not which object raised the event.
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterValidateEvent, 'Status', false, false)]
    local procedure OnSalesHeaderStatusValidated(var Rec: Record "Sales Header")
    begin
    end;

    // Same event name as the event itself — no object context.
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"ArticleFilterDataMgt_PTE", OnBeforeCollectArticleFilterData, '', false, false)]
    local procedure OnBeforeCollectArticleFilterData(var IsHandled: Boolean)
    begin
    end;

    // Generic name — which Widget event? insert, modify, delete?
    [EventSubscriber(ObjectType::Table, Database::Widget, OnAfterInsertEvent, '', false, false)]
    local procedure HandleWidgetInsert(var Rec: Record Widget)
    begin
    end;
}

codeunit 50110 "Widget Subscribers_PTE"
{
    // ObjectType_ObjectName_EventName_FieldName — source of event is explicit.
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterValidateEvent, 'Status', false, false)]
    local procedure Table_SalesHeader_OnAfterValidate_Status(var Rec: Record "Sales Header")
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"ArticleFilterDataMgt_PTE", OnBeforeCollectArticleFilterData, '', false, false)]
    local procedure Codeunit_ArticleFilterDataMgt_OnBeforeCollectArticleFilterData(var IsHandled: Boolean)
    begin
    end;

    [EventSubscriber(ObjectType::Table, Database::Widget, OnAfterInsertEvent, '', false, false)]
    local procedure Table_Widget_OnAfterInsertEvent(var Rec: Record Widget)
    begin
    end;
}

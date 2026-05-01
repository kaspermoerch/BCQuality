// ToolTip declared once at the table level — inherited by all pages.
table 50160 "Widget_PTE"
{
    fields
    {
        field(1; "No."; Code[20])
        {
            ToolTip = 'Specifies the unique identifier of the widget.', Comment = 'DAN="Angiver widgetens entydige identifikator."';
        }

        field(2; Description; Text[100])
        {
            ToolTip = 'Specifies a description of the widget.', Comment = 'DAN="Angiver en beskrivelse af widgetten."';
        }
    }
}

// Page field declarations have no ToolTip — they inherit from the table.
page 50160 "Widget Card_PTE"
{
    layout
    {
        area(Content)
        {
            field("No."; Rec."No.") { }
            field(Description; Rec.Description) { }
        }
    }
}

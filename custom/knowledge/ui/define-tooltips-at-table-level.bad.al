// No ToolTip on the table — nothing to inherit.
table 50160 "Widget_PTE"
{
    fields
    {
        field(1; "No."; Code[20]) { }
        field(2; Description; Text[100]) { }
    }
}

// ToolTip duplicated on every page that shows the field.
// When the text changes, every page must be updated individually.
page 50160 "Widget Card_PTE"
{
    layout
    {
        area(Content)
        {
            field("No."; Rec."No.")
            {
                ToolTip = 'Specifies the unique identifier of the widget.';
            }

            field(Description; Rec.Description)
            {
                ToolTip = 'Specifies a description of the widget.';
            }
        }
    }
}

table 50121 "Widget Line_PTE"
{
    fields
    {
        field(1; "Widget No."; Code[20]) { }
        field(2; "Line No."; Integer) { }
        field(3; "Customer No."; Code[20]) { }
        field(4; "Posting Date"; Date) { }
    }

    keys
    {
        // Descriptive names — inconsistent, no functional benefit.
        key(DocumentLineKey; "Widget No.", "Line No.") { Clustered = true; }
        key(CustomerKey; "Customer No.") { }
        key(PostingDateKey; "Posting Date") { }
    }
}

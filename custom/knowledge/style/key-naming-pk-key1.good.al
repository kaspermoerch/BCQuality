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
        key(PK; "Widget No.", "Line No.") { Clustered = true; }
        key(Key1; "Customer No.") { }
        key(Key2; "Posting Date") { }
    }
}

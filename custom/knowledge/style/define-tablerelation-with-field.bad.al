table 50120 "Widget_PTE"
{
    fields
    {
        field(1; "No."; Code[20]) { }

        field(2; "Vehicle Group Code"; Code[20])
        {
            TableRelation = "CompanyVehicleGroup_PTE"; // Field omitted — primary key inferred implicitly.
        }

        field(3; "Responsible Employee No."; Code[20])
        {
            TableRelation = Employee; // Field omitted — which Employee field is this relation to?
        }

        field(4; "Salesperson Code"; Code[20])
        {
            TableRelation = "Salesperson/Purchaser"; // Field omitted.
        }
    }
}

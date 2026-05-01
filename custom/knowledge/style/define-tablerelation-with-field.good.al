table 50120 "Widget_PTE"
{
    fields
    {
        field(1; "No."; Code[20]) { }

        field(2; "Vehicle Group Code"; Code[20])
        {
            TableRelation = "CompanyVehicleGroup_PTE".Code;
        }

        field(3; "Responsible Employee No."; Code[20])
        {
            TableRelation = Employee."No.";
        }

        field(4; "Salesperson Code"; Code[20])
        {
            TableRelation = "Salesperson/Purchaser".Code;
        }
    }
}

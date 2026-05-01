tableextension 50150 "Sales Header Extension_PTE" extends "Sales Header"
{
    trigger OnInsert()
    begin
        if Rec."Customer No." = '' then
            Error(CustomerNoRequiredErr);

        Rec.Validate("Salesperson Code", this.GetDefaultSalesperson(Rec."Customer No."));
    end;

    local procedure GetDefaultSalesperson(CustomerNo: Code[20]): Code[20]
    var
        Customer: Record Customer;
    begin
        if not Customer.Get(CustomerNo) then
            exit('');

        exit(Customer."Salesperson Code");
    end;

    var
        CustomerNoRequiredErr: Label 'Customer No. must be filled in.', Locked = true;
}

tableextension 50150 "Sales Header Extension_PTE" extends "Sales Header"
{
    trigger OnInsert()
    begin
        // Implicit with — "Customer No." could be a local, a global, or a Rec field.
        if "Customer No." = '' then
            Error(CustomerNoRequiredErr);

        // Implicit with — which record does "Salesperson Code" belong to?
        Validate("Salesperson Code", GetDefaultSalesperson("Customer No."));
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

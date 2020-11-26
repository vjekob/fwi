codeunit 50100 "Demo New Account"
{
    trigger OnRun()
    var
        Question: Label 'What would you like to create?';
        Options: Label 'Customer,Vendor,Employee';
        NewCustomer: Codeunit "Demo New Customer";
        NewVendor: Codeunit "Demo New Vendor";
        NewEmployee: Codeunit "Demo New Employee";

    begin
        case StrMenu(Options, 0, Question) of
            1:
                NewCustomer.Run();
            2:
                NewVendor.Run();
            3:
                NewEmployee.Run();
        end;
    end;
}
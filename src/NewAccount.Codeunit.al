codeunit 50100 "Demo New Account"
{
    trigger OnRun()
    var
        NewAccount: Interface "Demo INewAccount";
    begin
        if not TryCreateNew(NewAccount) then
            exit;

        NewAccount.CreateNew();
    end;

    [TryFunction]
    local procedure TryCreateNew(var NewAccount: Interface "Demo INewAccount")
    var
        Question: Label 'What would you like to create?';
        Options: Label 'Customer,Vendor,Employee';
    begin
        NewAccount := Enum::"Demo Account Type".FromInteger(StrMenu(Options, 0, Question));
    end;
}

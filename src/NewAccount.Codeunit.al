codeunit 50100 "Demo New Account"
{
    trigger OnRun()
    var
        NewAccount: Interface "Demo INewAccount";
        CheckPrecond: Page "Demo Check Preconditions";
    begin
        if not TryCreateNew(NewAccount) then
            exit;

        CheckPrecond.Check(NewAccount);
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

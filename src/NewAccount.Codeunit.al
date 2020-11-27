codeunit 50100 "Demo New Account"
{
    trigger OnRun()
    var
        ChooseAccountType: Page "Demo Choose Account Type";
        Guid: Guid;
        Handled: Boolean;
        NewAccount: Interface "Demo INewAccount";
        CheckPrecond: Page "Demo Check Preconditions";
    begin
        if ChooseAccountType.Check(Guid) then begin
            OnAccountTypeFactoryMethod(Guid, NewAccount, Handled);
            if Handled then
                CheckPrecond.Check(NewAccount);
        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAccountTypeFactoryMethod(Guid: Guid; var NewAccount: Interface "Demo INewAccount"; var Handled: Boolean)
    begin
    end;
}

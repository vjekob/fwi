codeunit 50109 "Demo New G/L Account" implements "Demo INewAccount"
{
    EventSubscriberInstance = StaticAutomatic;

    var
        LabelAccountType: Label 'Account type selected?';
        AccountTypeQuestion: Label 'What is the account type?';
        AccountTypeOptions: Label 'Posting,Header,Totaling';
        AccountTypePrecondition: Interface "Demo IPrecondition";
        ThisGuid: Label '196105dc-a78d-4b58-bcaf-376e1109780d', Locked = true;
        StrMenuPrecond: Codeunit "Demo StrMenu Precondition";

    internal procedure ConfigurePreconditions();
    begin
        StrMenuPrecond.Initialize(LabelAccountType);
        StrMenuPrecond.SetQuestion(AccountTypeQuestion, AccountTypeOptions);
        BindSubscription(StrMenuPrecond);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Demo New Account Type", 'OnDiscoverAccountTypes', '', false, false)]
    local procedure DiscoverAccountType(var sender: Record "Demo New Account Type")
    var
        GLAcc: Record "G/L Account";
    begin
        sender.Discover(ThisGuid, GLAcc.TableCaption);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Demo New Account", 'OnAccountTypeFactoryMethod', '', false, false)]
    local procedure AccountTypeFactoryMethod(Guid: Guid; var NewAccount: Interface "Demo INewAccount"; var Handled: Boolean)
    var
        ThisCodeunit: Codeunit "Demo New G/L Account";
    begin
        if ThisGuid <> Guid then
            exit;

        Handled := true;
        NewAccount := ThisCodeunit;
    end;
}

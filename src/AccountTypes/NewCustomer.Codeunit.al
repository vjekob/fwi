codeunit 50101 "Demo New Customer" implements "Demo INewAccount"
{
    EventSubscriberInstance = StaticAutomatic;

    var
        LabelSolvency: Label 'Solvency OK?';
        LabelKeyAcc: Label 'Key-Account manager selected?';
        LabelContract: Label 'Contract signed';
        ContractQuestion: Label 'Has contract been signed, countersigned, scanned, and archived?';
        KeyAccountQuestion: Label 'Who is the key account manager?';
        SolvencyPrecondition: Interface "Demo IPrecondition";
        KeyAccPrecondition: Interface "Demo IPrecondition";
        ContractPrecondition: Interface "Demo IPrecondition";
        ThisGuid: Label 'eef33a42-9e35-4f5a-92b3-efdd5dbf35c1', Locked = true;

    internal procedure ConfigurePreconditions();
    var
        Factory: Codeunit "Demo Precondition Factory";
    begin
        Factory.ClickPrecondition(LabelSolvency, SolvencyPrecondition);
        Factory.QuestionPrecondition(LabelKeyAcc, KeyAccountQuestion, KeyAccPrecondition);
        Factory.ConfirmPrecondition(LabelContract, ContractQuestion, ContractPrecondition);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Demo New Account Type", 'OnDiscoverAccountTypes', '', false, false)]
    local procedure DiscoverAccountType(var sender: Record "Demo New Account Type")
    var
        Cust: Record Customer;
    begin
        sender.Discover(ThisGuid, Cust.TableCaption);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Demo New Account", 'OnAccountTypeFactoryMethod', '', false, false)]
    local procedure AccountTypeFactoryMethod(Guid: Guid; var NewAccount: Interface "Demo INewAccount"; var Handled: Boolean)
    var
        ThisCodeunit: Codeunit "Demo New Customer";
    begin
        if ThisGuid <> Guid then
            exit;

        Handled := true;
        NewAccount := ThisCodeunit;
    end;
}

codeunit 50102 "Demo New Vendor" implements "Demo INewAccount"
{
    EventSubscriberInstance = StaticAutomatic;

    var
        LabelAssortment: Label 'Assortment satisfies requirements?';
        LabelPrices: Label 'Prices and terms are acceptable?';
        LabelLegal: Label 'Legal review completed?';
        LegalQuestion: Label 'Has the vendor contract been reviewed and approved by the legal department?';
        AssortmentPrecondition: Interface "Demo IPrecondition";
        PricesPrecondition: Interface "Demo IPrecondition";
        LegalPrecondition: Interface "Demo IPrecondition";
        ThisGuid: Label 'e28bdd50-e314-497b-b921-1724a8fc2a79', Locked = true;

    internal procedure ConfigurePreconditions();
    var
        Factory: Codeunit "Demo Precondition Factory";
    begin
        Factory.ClickPrecondition(LabelAssortment, AssortmentPrecondition);
        Factory.ClickPrecondition(LabelPrices, PricesPrecondition);
        Factory.ConfirmPrecondition(LabelLegal, LegalQuestion, LegalPrecondition);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Demo New Account Type", 'OnDiscoverAccountTypes', '', false, false)]
    local procedure DiscoverAccountType(var sender: Record "Demo New Account Type")
    var
        Vend: Record Vendor;
    begin
        sender.Discover(ThisGuid, Vend.TableCaption);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Demo New Account", 'OnAccountTypeFactoryMethod', '', false, false)]
    local procedure AccountTypeFactoryMethod(Guid: Guid; var NewAccount: Interface "Demo INewAccount"; var Handled: Boolean)
    var
        ThisCodeunit: Codeunit "Demo New Vendor";
    begin
        if ThisGuid <> Guid then
            exit;

        Handled := true;
        NewAccount := ThisCodeunit;
    end;
}

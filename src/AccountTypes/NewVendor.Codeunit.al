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

    internal procedure ConfigurePreconditions();
    var
        Factory: Codeunit "Demo Precondition Factory";
    begin
        Factory.ClickPrecondition(LabelAssortment, AssortmentPrecondition);
        Factory.ClickPrecondition(LabelPrices, PricesPrecondition);
        Factory.ConfirmPrecondition(LabelLegal, LegalQuestion, LegalPrecondition);
    end;
}

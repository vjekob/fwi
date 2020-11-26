codeunit 50102 "Demo New Vendor" implements "Demo INewAccount"
{
    EventSubscriberInstance = StaticAutomatic;

    var
        ConstAssortment: Label 'VEND.1.ASSORTMENT', Locked = true;
        ConstPrices: Label 'VEND.2.PRICES', Locked = true;
        ConstLegal: Label 'VEND.3.LEGAL', Locked = true;
        LabelAssortment: Label 'Assortment satisfies requirements?';
        LabelPrices: Label 'Prices and terms are acceptable?';
        LabelLegal: Label 'Legal review completed?';
        LegalQuestion: Label 'Has the vendor contract been reviewed and approved by the legal department?';

    procedure CreateNew()
    var
        Precond: Record "Demo Precondition";
        CheckPrecond: Page "Demo Check Preconditions";
    begin
        Precond.Define(ConstAssortment, LabelAssortment);
        Precond.Define(ConstPrices, LabelPrices);
        Precond.Define(ConstLegal, LabelLegal);

        CheckPrecond.Check(Precond);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Demo Check Preconditions", 'OnSatisfyPrecondition', '', false, false)]
    local procedure SatisfyPrecondition(Precondition: Code[20]; var Satisfied: Boolean)
    begin
        case Precondition of
            ConstAssortment:
                Satisfied := true;
            ConstPrices:
                Satisfied := true;
            ConstLegal:
                Satisfied := Confirm(LegalQuestion);
        end;
    end;
}

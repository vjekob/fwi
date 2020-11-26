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

    internal procedure GetPreconditions(var Precond: Record "Demo Precondition" temporary);
    begin
        Precond.Define(ConstAssortment, LabelAssortment);
        Precond.Define(ConstPrices, LabelPrices);
        Precond.Define(ConstLegal, LabelLegal);
    end;

    internal procedure CheckPrecondition(Precondition: Code[20]): Boolean;
    begin
        case Precondition of
            ConstAssortment:
                exit(true);
            ConstPrices:
                exit(true);
            ConstLegal:
                exit(Confirm(LegalQuestion));
        end;
    end;
}

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

    internal procedure ConfigurePreconditions();
    var
        Factory: Codeunit "Demo Precondition Factory";
    begin
        Factory.ClickPrecondition(LabelSolvency, SolvencyPrecondition);
        Factory.QuestionPrecondition(LabelKeyAcc, KeyAccountQuestion, KeyAccPrecondition);
        Factory.ConfirmPrecondition(LabelContract, ContractQuestion, ContractPrecondition);
    end;
}

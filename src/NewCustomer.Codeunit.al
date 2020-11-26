codeunit 50101 "Demo New Customer" implements "Demo INewAccount"
{
    EventSubscriberInstance = StaticAutomatic;

    var
        ConstSolvency: Label 'CUST.1.SOLVENCY', Locked = true;
        ConstKeyAcc: Label 'CUST.2.KEYACC', Locked = true;
        ConstContract: Label 'CUST.3.CONTRACT', Locked = true;
        LabelSolvency: Label 'Solvency OK?';
        LabelKeyAcc: Label 'Key-Account manager selected?';
        LabelContract: Label 'Contract signed';
        ContractQuestion: Label 'Has contract been signed, countersigned, scanned, and archived?';
        KeyAccountQuestion: Label 'Who is the key account manager?';

    internal procedure GetPreconditions(var Precond: Record "Demo Precondition" temporary);
    begin
        Precond.Define(ConstSolvency, LabelSolvency);
        Precond.Define(ConstKeyAcc, LabelKeyAcc);
        Precond.Define(ConstContract, LabelContract);
    end;

    internal procedure CheckPrecondition(Precondition: Code[20]): Boolean;
    var
        Input: Page "Demo Input Dialog";
        KeyAccountManager: Text;
    begin
        case Precondition of
            ConstSolvency:
                exit(true);
            ConstContract:
                exit(Confirm(ContractQuestion));
            ConstKeyAcc:
                exit(Input.AskForInput(KeyAccountQuestion, KeyAccountManager));
        end;
    end;
}

codeunit 50103 "Demo New Employee" implements "Demo INewAccount"
{
    EventSubscriberInstance = StaticAutomatic;

    var
        ConstCVOK: Label 'HR.1.CVOK', Locked = true;
        ConstQualifications: Label 'HR.2.QUALIFIES', Locked = true;
        ConstInterview1: Label 'HR.3.INTERVIEW1', Locked = true;
        ConstTestCompleted: Label 'HR.4.TEST', Locked = true;
        ConstInterview2: Label 'HR.5.INTERVIEW2', Locked = true;
        ConstHRPaperworkCompleted: Label 'HR.6.PAPERWORK', Locked = true;
        LabelCVOK: Label 'CV is submitted and OK?';
        LabelQualifications: Label 'Meets job qualifications?';
        LabelInterview1: Label 'Passed first interview?';
        LabelTestCompleted: Label 'Passed test?';
        LabelInterview2: Label 'Passed second interview?';
        LabelHRPaperworkCompleted: Label 'HR paperwork completed?';
        QualificationsQuestion: Label 'Have qualifications been confirmed by the future direct superior?';
        TestScoreQuestion: Label 'What was the test score?';
        PaperworkQuestion: Label 'Has all paperwork been signed, countersigned, scanned, and archived?';

    internal procedure GetPreconditions(var Precond: Record "Demo Precondition" temporary);
    begin
        Precond.Define(ConstCVOK, LabelCVOK, Precond.Type::Click);
        Precond.Define(ConstQualifications, LabelQualifications, Precond.Type::Confirm);
        Precond.Define(ConstInterview1, LabelInterview1, Precond.Type::Click);
        Precond.Define(ConstTestCompleted, LabelTestCompleted, Precond.Type::Question);
        Precond.Define(ConstInterview2, LabelInterview2, Precond.Type::Click);
        Precond.Define(ConstHRPaperworkCompleted, LabelHRPaperworkCompleted, Precond.Type::Confirm);
    end;

    // internal procedure CheckPrecondition(Precondition: Code[20]): Boolean;
    // var
    //     Input: Page "Demo Input Dialog";
    //     TestScore: Text;
    // begin
    //     case Precondition of
    //         ConstCVOK:
    //             exit(true);
    //         ConstQualifications:
    //             exit(Confirm(QualificationsQuestion));
    //         ConstInterview1:
    //             exit(true);
    //         ConstTestCompleted:
    //             exit(Input.AskForInput(TestScoreQuestion, TestScore));
    //         ConstInterview2:
    //             exit(true);
    //         ConstHRPaperworkCompleted:
    //             exit(Confirm(PaperworkQuestion));
    //     end;
    // end;
}

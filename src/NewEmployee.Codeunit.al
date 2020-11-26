codeunit 50103 "Demo New Employee"
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

    trigger OnRun()
    var
        Precond: Record "Demo Precondition";
        CheckPrecond: Page "Demo Check Preconditions";
    begin
        Precond.Define(ConstCVOK, LabelCVOK);
        Precond.Define(ConstQualifications, LabelQualifications);
        Precond.Define(ConstInterview1, LabelInterview1);
        Precond.Define(ConstTestCompleted, LabelTestCompleted);
        Precond.Define(ConstInterview2, LabelInterview2);
        Precond.Define(ConstHRPaperworkCompleted, LabelHRPaperworkCompleted);

        CheckPrecond.Check(Precond);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Demo Check Preconditions", 'OnSatisfyPrecondition', '', false, false)]
    local procedure SatisfyPrecondition(Precondition: Code[20]; var Satisfied: Boolean)
    var
        Input: Page "Demo Input Dialog";
        TestScore: Text;
    begin
        case Precondition of
            ConstCVOK:
                Satisfied := true;
            ConstQualifications:
                Satisfied := Confirm(QualificationsQuestion);
            ConstInterview1:
                Satisfied := true;
            ConstTestCompleted:
                Satisfied := Input.AskForInput(TestScoreQuestion, TestScore);
            ConstInterview2:
                Satisfied := true;
            ConstHRPaperworkCompleted:
                Satisfied := Confirm(PaperworkQuestion);
        end;
    end;
}

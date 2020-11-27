codeunit 50103 "Demo New Employee" implements "Demo INewAccount"
{
    EventSubscriberInstance = StaticAutomatic;

    var
        LabelCVOK: Label 'CV is submitted and OK?';
        LabelQualifications: Label 'Meets job qualifications?';
        LabelInterview1: Label 'Passed first interview?';
        LabelTestCompleted: Label 'Passed test?';
        LabelInterview2: Label 'Passed second interview?';
        LabelHRPaperworkCompleted: Label 'HR paperwork completed?';
        QualificationsQuestion: Label 'Have qualifications been confirmed by the future direct superior?';
        TestScoreQuestion: Label 'What was the test score?';
        PaperworkQuestion: Label 'Has all paperwork been signed, countersigned, scanned, and archived?';
        CVOKPrecondition: Interface "Demo IPrecondition";
        QualificationsPrecondition: Interface "Demo IPrecondition";
        Interview1Precondition: Interface "Demo IPrecondition";
        TestCompletedPrecondition: Interface "Demo IPrecondition";
        Interview2Precondition: Interface "Demo IPrecondition";
        HRPaperworkCompletedPrecondition: Interface "Demo IPrecondition";
        ThisGuid: Label '61b51c5c-a0b7-45e1-91be-85f03f952207', Locked = true;

    internal procedure ConfigurePreconditions();
    var
        Factory: Codeunit "Demo Precondition Factory";
    begin
        Factory.ClickPrecondition(LabelCVOK, CVOKPrecondition);
        Factory.ConfirmPrecondition(LabelQualifications, QualificationsQuestion, QualificationsPrecondition);
        Factory.ClickPrecondition(LabelInterview1, Interview1Precondition);
        Factory.QuestionPrecondition(LabelTestCompleted, TestScoreQuestion, TestCompletedPrecondition);
        Factory.ClickPrecondition(LabelInterview2, Interview2Precondition);
        Factory.ConfirmPrecondition(LabelHRPaperworkCompleted, PaperworkQuestion, HRPaperworkCompletedPrecondition);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Demo New Account Type", 'OnDiscoverAccountTypes', '', false, false)]
    local procedure DiscoverAccountType(var sender: Record "Demo New Account Type")
    var
        Employee: Record Employee;
    begin
        sender.Discover(ThisGuid, Employee.TableCaption);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Demo New Account", 'OnAccountTypeFactoryMethod', '', false, false)]
    local procedure AccountTypeFactoryMethod(Guid: Guid; var NewAccount: Interface "Demo INewAccount"; var Handled: Boolean)
    var
        ThisCodeunit: Codeunit "Demo New Employee";
    begin
        if ThisGuid <> Guid then
            exit;

        Handled := true;
        NewAccount := ThisCodeunit;
    end;
}

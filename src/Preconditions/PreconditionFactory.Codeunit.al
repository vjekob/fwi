codeunit 50108 "Demo Precondition Factory"
{
    procedure ClickPrecondition(Description: Text; var Precondition: Interface "Demo IPrecondition")
    var
        ClickPrecondition: Codeunit "Demo Click Precondition";
    begin
        BindSubscription(ClickPrecondition);
        Precondition := ClickPrecondition;
        Precondition.Initialize(Description);
    end;

    procedure ConfirmPrecondition(Description: Text; Question: Text; var Precondition: Interface "Demo IPrecondition")
    var
        ConfirmPrecondition: Codeunit "Demo Confirm Precondition";
    begin
        BindSubscription(ConfirmPrecondition);
        ConfirmPrecondition.SetQuestion(Question);
        Precondition := ConfirmPrecondition;
        Precondition.Initialize(Description);
    end;

    procedure QuestionPrecondition(Description: Text; Question: Text; var Precondition: Interface "Demo IPrecondition")
    var
        QuestionPrecondition: Codeunit "Demo Question Precondition";
    begin
        BindSubscription(QuestionPrecondition);
        QuestionPrecondition.SetQuestion(Question);
        Precondition := QuestionPrecondition;
        Precondition.Initialize(Description);
    end;
}

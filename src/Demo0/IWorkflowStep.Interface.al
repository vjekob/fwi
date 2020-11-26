interface "Demo IWorkflowStep"
{
    procedure Name(): Text;
    procedure Preconditions(var Preconditions: Record "Demo Precondition" temporary);
    procedure Completed(): Boolean;
    procedure RequiresConfirmation(): Boolean;
    procedure Confirm(): Boolean;
    procedure GoToNextStep(var Step: Interface "Demo IWorkflowStep");
}

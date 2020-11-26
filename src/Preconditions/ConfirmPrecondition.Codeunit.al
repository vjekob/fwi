codeunit 50106 "Demo Confirm Precondition" implements "Demo IPrecondition"
{
    var
        Question: Text;

    procedure Initialize(Question2: Text)
    begin
        Question := Question2;
    end;

    internal procedure Check(): Boolean
    begin
        exit(Confirm(Question));
    end;
}

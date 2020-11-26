codeunit 50104 "Demo Default New Account" implements "Demo INewAccount"
{
    internal procedure GetPreconditions(var Precond: Record "Demo Precondition" temporary);
    begin
        // Nothing to do
    end;

    internal procedure CheckPrecondition(Precondition: Code[20]): Boolean;
    begin
        // Nothing to do
    end;
}

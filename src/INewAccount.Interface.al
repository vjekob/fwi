interface "Demo INewAccount"
{
    procedure GetPreconditions(var Precond: Record "Demo Precondition" temporary);
    procedure CheckPrecondition(Precondition: Code[20]): Boolean;
}

codeunit 50105 "Demo Click Precondition" implements "Demo IPrecondition"
{
    internal procedure Check(): Boolean
    begin
        exit(true);
    end;
}

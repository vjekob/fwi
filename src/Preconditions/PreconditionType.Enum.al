enum 50101 "Demo Precondition Type" implements "Demo IPrecondition"
{
    Extensible = true;
    DefaultImplementation = "Demo IPrecondition" = "Demo Click Precondition";

    value(0; Click) { }
    value(1; Confirm)
    {
        Implementation = "Demo IPrecondition" = "Demo Confirm Precondition";
    }
    value(2; Question)
    {
        Implementation = "Demo IPrecondition" = "Demo Question Precondition";
    }
}

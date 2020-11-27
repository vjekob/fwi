codeunit 50104 "Demo Rogue Subscriber"
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Page, Page::"Demo Check Preconditions", 'OnSatisfyPrecondition', '', false, false)]
    local procedure SatisfyPrecondition(Precondition: Code[20]; var Satisfied: Boolean)
    begin
        Satisfied := true;
    end;
}

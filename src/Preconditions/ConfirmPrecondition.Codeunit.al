codeunit 50106 "Demo Confirm Precondition" implements "Demo IPrecondition"
{
    EventSubscriberInstance = Manual;

    var
        Question: Text;
        Description: Text;
        ThisGuid: Guid;

    internal procedure Initialize(Description2: Text)
    begin
        Description := Description2;
    end;

    internal procedure SetQuestion(Question2: Text)
    begin
        Question := Question2;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Demo Precondition", 'OnDiscoverPreconditions', '', false, false)]
    local procedure DiscoverPrecondition(var sender: Record "Demo Precondition")
    begin
        ThisGuid := sender.Discover(Description);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Demo Precondition", 'OnCheckPrecondition', '', false, false)]
    local procedure Check(Guid: Guid; var Satisfied: Boolean)
    begin
        if Guid = ThisGuid then
            Satisfied := Confirm(Question);
    end;
}

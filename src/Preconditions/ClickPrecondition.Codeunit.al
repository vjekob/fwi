codeunit 50105 "Demo Click Precondition" implements "Demo IPrecondition"
{
    EventSubscriberInstance = Manual;

    var
        Description: Text;
        ThisGuid: Guid;

    internal procedure Initialize(Description2: Text)
    begin
        Description := Description2;
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
            Satisfied := true;
    end;
}

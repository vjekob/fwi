table 50100 "Demo Precondition"
{
    TableType = Temporary;
    Caption = 'Precondition';

    fields
    {
        field(1; Ordinal; Integer)
        {
            Caption = 'Ordinal';
        }

        field(2; Description; Text[2048])
        {
            Caption = 'Description';
        }

        field(3; Satisfied; Boolean)
        {
            Caption = 'Satisfied';
        }

        field(4; Guid; Guid)
        {
            Caption = 'Guid';
        }
    }

    var
        Ordinal: Integer;

    procedure Discover(Description2: Text[2048]): Guid;
    begin
        Ordinal += 1;
        Rec.Ordinal := Ordinal;
        Rec.Description := Description2;
        Rec.Guid := CreateGuid();
        Rec.Insert();
        exit(Rec.Guid);
    end;

    procedure Check() Satisfied: Boolean;
    begin
        OnCheckPrecondition(Rec.Guid, Satisfied);
    end;

    [IntegrationEvent(true, false)]
    procedure OnDiscoverPreconditions()
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnCheckPrecondition(Guid: Guid; var Satisfied: Boolean);
    begin
    end;
}

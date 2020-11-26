table 50101 "Demo New Account Type"
{
    TableType = Temporary;
    Caption = 'New Account Type';

    fields
    {
        field(1; Guid; Guid)
        {
            Caption = 'Guid';
        }

        field(2; Description; Text[2048])
        {
            Caption = 'Description';
        }
    }

    procedure Discover(Guid2: Guid; Description2: Text)
    begin
        Rec.Init();
        Rec.Guid := Guid2;
        Rec.Description := Description2;
        Rec.Insert();
    end;

    [IntegrationEvent(true, false)]
    procedure OnDiscoverAccountTypes()
    begin
    end;
}

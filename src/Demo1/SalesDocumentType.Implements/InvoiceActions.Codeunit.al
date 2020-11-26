codeunit 50102 "Demo Sales Invoice Actions" implements "Demo IDocumentActions"
{
    procedure CanRelease(): Boolean;
    begin
        exit(false);
    end;

    procedure CanPost(): Boolean;
    begin
        exit(true);
    end;

    procedure CanShip(): Boolean;
    begin
        exit(false);
    end;

    procedure CanReceive(): Boolean;
    begin
        exit(false);
    end;

    procedure CanInvoice(): Boolean;
    begin
        exit(false);
    end;

    procedure CanMakeOrder(): Boolean;
    begin
        exit(false);
    end;
}

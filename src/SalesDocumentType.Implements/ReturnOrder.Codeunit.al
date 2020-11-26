codeunit 50125 "Demo Sales Ret. Order Actions" implements "Demo IDocumentActions"
{
    procedure CanRelease(): Boolean;
    begin
        exit(true);
    end;

    procedure CanPost(): Boolean;
    begin
        exit(false);
    end;

    procedure CanShip(): Boolean;
    begin
        exit(false);
    end;

    procedure CanReceive(): Boolean;
    begin
        exit(true);
    end;

    procedure CanInvoice(): Boolean;
    begin
        exit(true);
    end;

    procedure CanMakeOrder(): Boolean;
    begin
        exit(false);
    end;
}

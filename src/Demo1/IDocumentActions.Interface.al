interface "Demo IDocumentActions"
{
    procedure CanRelease(): Boolean;
    procedure CanPost(): Boolean;
    procedure CanShip(): Boolean;
    procedure CanReceive(): Boolean;
    procedure CanInvoice(): Boolean;
    procedure CanMakeOrder(): Boolean;
}

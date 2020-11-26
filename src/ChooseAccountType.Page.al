page 50102 "Demo Choose Account Type"
{
    PageType = StandardDialog;
    Caption = 'Account Type';
    SourceTable = "Demo New Account Type";
    SourceTableTemporary = true;
    Editable = false;

    layout
    {
        area(Content)
        {
            group(Instruction)
            {
                InstructionalText = 'What kind of an account would you like to create?';
            }

            repeater(Types)
            {
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.FindFirst() then;
    end;

    procedure Check(var Guid2: Guid): Boolean
    begin
        Clear(Rec);
        Rec.OnDiscoverAccountTypes();

        CurrPage.LookupMode := true;
        if CurrPage.RunModal() = Action::LookupOK then begin
            Guid2 := Rec.Guid;
            exit(true);
        end;
    end;
}

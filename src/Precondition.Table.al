table 50100 "Demo Precondition"
{
    TableType = Temporary;
    Caption = 'Precondition';

    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
        }

        field(2; Description; Text[2048])
        {
            Caption = 'Description';
        }

        field(3; Satisfied; Boolean)
        {
            Caption = 'Satisfied';
        }
        field(4; Type; Enum "Demo Precondition Type")
        {
            Caption = 'Type';
        }
    }

    procedure Define(Code2: Code[20]; Description2: Text[2048]; Type2: Enum "Demo Precondition Type")
    begin
        Rec.Code := Code2;
        Rec.Description := Description2;
        Rec.Type := Type2;
        Rec.Insert();
    end;
}

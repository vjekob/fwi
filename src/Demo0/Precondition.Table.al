table 50100 "Demo Precondition"
{
    // TODO: Temporary in BC170
    Caption = 'Precondition';

    fields
    {
        field(1; Code; Code[10])
        {
            Caption = 'Code';
        }

        field(2; Description; Text[250])
        { // Text[250] really needed for temporary?
            Caption = 'Description';
        }

        field(3; Satisfied; Boolean)
        {
            Caption = 'Satisfied';
        }
    }
}

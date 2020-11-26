page 50100 "Demo Pick Your Pet"
{
    PageType = StandardDialog;
    Caption = 'Pick your pet';

    layout
    {
        area(Content)
        {
            field(Pet; Pet)
            {
                Caption = 'Animal';
                ApplicationArea = All;
            }
        }
    }

    var
        Pet: Enum "Demo Animal Type";

    procedure PickPet(var PetType: Enum "Demo Animal Type"): Boolean
    begin
        if CurrPage.RunModal() = Action::OK then begin
            PetType := Pet;
            exit(true);
        end;
    end;
}

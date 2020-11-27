codeunit 50103 "Demo Pick Your Pet"
{
    var
        Caption: Label 'Pick your pet:';
        Options: Label 'Dog,Cat,Duck';

    trigger OnRun()
    var
        PetType: Enum "Demo Animal Type";
        Selection: Integer;
    begin
        Selection := StrMenu(Options, 0, Caption);
        if Selection = 0 then
            exit;

        PetType := Enum::"Demo Animal Type".FromInteger(Selection);
        MakeSound(PetType);
    end;

    local procedure MakeSound(Pet: Interface "Demo IAnimal")
    begin
        Pet.MakeSound();
    end;
}

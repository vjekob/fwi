codeunit 50103 "Demo Pick Your Pet"
{
    var
        Caption: Label 'Pick your pet:';
        Options: Label 'Dog,Cat,Duck';

    trigger OnRun()
    var
        PetFactory: Codeunit "Demo Pet Factory";
        PetType: Enum "Demo Animal Type";
        Pet: Interface "Demo IAnimal";
        Selection: Integer;
    begin
        Selection := StrMenu(Options, 0, Caption);
        if Selection = 0 then
            exit;

        PetType := Enum::"Demo Animal Type".FromInteger(Selection);
        PetFactory.CreatePet(PetType, Pet);
        MakeSound(Pet);
    end;

    local procedure MakeSound(Pet: Interface "Demo IAnimal")
    begin
        Pet.MakeSound();
    end;
}

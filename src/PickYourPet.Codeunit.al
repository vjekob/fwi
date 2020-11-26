codeunit 50103 "Demo Pick Your Pet"
{
    var
        Caption: Label 'Pick your pet:';
        Options: Label 'Dog,Cat,Duck';

    trigger OnRun()
    var
        AnimalType: Enum "Demo Animal Type";
        Selection: Integer;
    begin
        Selection := StrMenu(Options, 0, Caption);
        if Selection = 0 then
            exit;

        AnimalType := Enum::"Demo Animal Type".FromInteger(Selection);
        MakeSound(AnimalType);
    end;

    local procedure MakeSound(Pet: Enum "Demo Animal Type")
    var
        PetFactory: Codeunit "Demo Pet Factory";
        Animal: Interface "Demo IAnimal";
    begin
        case Pet of
            Pet::Dog:
                PetFactory.CreateDog(Animal);
            Pet::Cat:
                PetFactory.CreateCat(Animal);
            Pet::Duck:
                PetFactory.CreateDuck(Animal);
        end;

        Animal.MakeSound();
    end;
}

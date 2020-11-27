codeunit 50103 "Demo Pick Your Pet"
{
    var
        Caption: Label 'Pick your pet:';
        Options: Label 'Dog,Cat,Duck';

    trigger OnRun()
    var
        PetFactory: Codeunit "Demo Pet Factory";
        PetType: Option Unknown,Dog,Cat,Duck;
        Pet: Interface "Demo IAnimal";
    begin
        PetType := StrMenu(Options, 0, Caption);
        PetFactory.CreatePet(PetType, Pet);
        MakeSound(Pet);
    end;

    local procedure MakeSound(Animal: Interface "Demo IAnimal")
    begin
        Animal.MakeSound();
    end;
}

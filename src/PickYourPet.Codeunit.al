codeunit 50103 "Demo Pick Your Pet"
{
    var
        Caption: Label 'Pick your pet:';
        Options: Label 'Dog,Cat,Duck';

    trigger OnRun()
    begin
        MakeSound(StrMenu(Options, 0, Caption));
    end;

    local procedure MakeSound(Pet: Option Unknown,Dog,Cat,Duck)
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

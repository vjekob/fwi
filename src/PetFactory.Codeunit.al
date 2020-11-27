codeunit 50104 "Demo Pet Factory"
{
    procedure CreatePet(PetType: Enum "Demo Animal Type"; var Pet: Interface "Demo IAnimal")
    var
        Dog: Codeunit "Demo Dog";
        Cat: Codeunit "Demo Cat";
        Duck: Codeunit "Demo Duck";
    begin
        case PetType of
            PetType::Dog:
                Pet := Dog;
            PetType::Cat:
                Pet := Cat;
            PetType::Duck:
                Pet := Duck;
        end;
    end;
}

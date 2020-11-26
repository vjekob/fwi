codeunit 50104 "Demo Pet Factory"
{
    procedure CreateDog(var Pet: Interface "Demo IAnimal")
    var
        Dog: Codeunit "Demo Dog";
    begin
        Pet := Dog;
    end;

    procedure CreateCat(var Pet: Interface "Demo IAnimal")
    var
        Cat: Codeunit "Demo Cat";
    begin
        Pet := Cat;
    end;

    procedure CreateDuck(var Pet: Interface "Demo IAnimal")
    var
        Duck: Codeunit "Demo Duck";
    begin
        Pet := Duck;
    end;
}
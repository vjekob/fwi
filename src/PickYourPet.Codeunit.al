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
        Dog: Codeunit "Demo Dog";
        Cat: Codeunit "Demo Cat";
        Duck: Codeunit "Demo Duck";
    begin
        case Pet of
            Pet::Dog:
                Dog.Woof();
            Pet::Cat:
                Cat.Meow();
            Pet::Duck:
                Duck.Quack();
        end;
    end;
}

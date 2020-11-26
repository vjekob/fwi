enum 50100 "Demo Animal Type" implements "Demo IAnimal"
{
    Extensible = true;

    value(1; Dog)
    {
        Implementation = "Demo IAnimal" = "Demo Dog";
    }
    value(2; Cat)
    {
        Implementation = "Demo IAnimal" = "Demo Cat";
    }
    value(3; Duck)
    {
        Implementation = "Demo IAnimal" = "Demo Duck";
    }
}

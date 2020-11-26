enum 50100 "Demo Account Type" implements "Demo INewAccount"
{
    DefaultImplementation = "Demo INewAccount" = "Demo Default New Account";
    AssignmentCompatibility = true;

    value(1; Customer)
    {
        Caption = 'Customer';
        Implementation = "Demo INewAccount" = "Demo New Customer";
    }
    value(2; Vendor)
    {
        Caption = 'Vendor';
        Implementation = "Demo INewAccount" = "Demo New Vendor";
    }
    value(3; Employee)
    {
        Caption = 'Employee';
        Implementation = "Demo INewAccount" = "Demo New Employee";
    }
}

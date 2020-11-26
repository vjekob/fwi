pageextension 50100 "Demo Order Proc. Extension" extends "Order Processor Role Center"
{
    actions
    {
        addafter("Sales &Credit Memo")
        {
            action(NewAccount)
            {
                Caption = 'Create New';
                ApplicationArea = All;
                RunObject = codeunit "Demo New Account";
            }
        }
    }
}
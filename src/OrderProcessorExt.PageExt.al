pageextension 50100 "Demo Order Proc. Extension" extends "Order Processor Role Center"
{
    actions
    {
        addafter("Sales &Credit Memo")
        {
            action(NewAccount)
            {
                Caption = 'Pick Your Pet';
                ApplicationArea = All;
                RunObject = codeunit "Demo Pick Your Pet";
            }
        }
    }
}
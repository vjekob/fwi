page 50100 "Demo Check Preconditions"
{
    PageType = StandardDialog;
    Caption = 'Preconditions';
    SourceTable = "Demo Precondition";
    SourceTableTemporary = true;
    Editable = true;

    layout
    {
        area(Content)
        {
            group(Instruction)
            {
                InstructionalText = 'Make sure all these preconditions are met:';
            }

            repeater(Preconditions)
            {
                field(Satisfied; Rec.Satisfied)
                {
                    trigger OnValidate();
                    var
                        Satisfy: Boolean;
                    begin
                        if not Rec.Satisfied then
                            exit;

                        if not NewAccount.CheckPrecondition(Rec.Code) then
                            Error('');
                    end;
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    var
        ErrorNotSatisfied: Label 'Please, either make sure all preconditions are satisfied, or click Cancel.';
        NewAccount: Interface "Demo INewAccount";

    trigger OnOpenPage()
    begin
        Rec.FindFirst();
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if CloseAction = Action::Cancel then
            exit(true);

        exit(AllSatisfied());
    end;

    local procedure AllSatisfied() Result: Boolean
    var
        CopyRec: Record "Demo Precondition" temporary;
    begin
        Result := true;

        CopyRec := Rec;
        if Rec.FindSet() then
            repeat
                Result := Result and Rec.Satisfied;
            until Rec.Next = 0;
        Rec := CopyRec;

        if not Result then
            Error(ErrorNotSatisfied);
    end;

    procedure Check(NewAccount2: Interface "Demo INewAccount")
    var
        Source: Record "Demo Precondition" temporary;
    begin
        NewAccount := NewAccount2;

        Clear(Rec);
        NewAccount2.GetPreconditions(Source);
        if Source.FindSet() then
            repeat
                Rec := Source;
                Rec.Insert();
            until Source.Next = 0;

        CurrPage.RunModal();
    end;
}

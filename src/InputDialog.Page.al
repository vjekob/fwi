page 50101 "Demo Input Dialog"
{
    PageType = StandardDialog;
    Editable = true;
    DataCaptionExpression = Question;

    layout
    {
        area(Content)
        {
            field(Input; Result)
            {
                ApplicationArea = All;
                ShowCaption = false;
            }
        }
    }

    var
        Question: Text;
        Result: Text;

    procedure AskForInput(Question2: Text; var Answer: Text): Boolean;
    begin
        Question := Question2;

        if CurrPage.RunModal() = Action::OK then begin
            Answer := Result;
            exit(true);
        end;
    end;
}

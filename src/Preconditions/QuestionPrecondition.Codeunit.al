codeunit 50107 "Demo Question Precondition" implements "Demo IPrecondition"
{
    var
        Question: Text;

    procedure Initialize(Question2: Text)
    begin
        Question := Question2;
    end;

    internal procedure Check(): Boolean
    var
        Input: Page "Demo Input Dialog";
        Answer: Text; // Ignored for the POC
    begin
        exit(Input.AskForInput(Question, Answer));
    end;
}

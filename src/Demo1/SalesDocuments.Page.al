page 50100 "Demo Sales Documents"
{
    Caption = 'Sales Documents: Fun with Interfaces';
    PageType = list;
    Editable = false;
    SourceTable = "Sales Header";

    layout
    {
        area(Content)
        {
            repeater(Documents)
            {
                field(DocType; Rec."Document Type")
                {
                    ApplicationArea = All;
                }

                field(DocNo; Rec."No.")
                {
                    ApplicationArea = All;
                }

                field(DocDate; Rec."Document Date")
                {
                    ApplicationArea = All;
                }

                field(CustNo; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                }

                field(CustName; Rec."Sell-to Customer Name")
                {
                    ApplicationArea = All;
                }

                field(AmountInclVAT; Rec."Amount Including VAT")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(MakeOrder)
            {
                Caption = 'Make Order';
                ApplicationArea = All;
                Image = MakeOrder;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Visible = MakeOrderVisible;

                trigger OnAction()
                begin
                end;
            }

            action(Release)
            {
                Caption = 'Release';
                ApplicationArea = All;
                Image = ReleaseDoc;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Visible = ReleaseVisible;

                trigger OnAction()
                begin
                end;
            }

            action(Post)
            {
                Caption = 'Post';
                ApplicationArea = All;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Visible = PostVisible;

                trigger OnAction()
                begin
                end;
            }

            action(Ship)
            {
                Caption = 'Ship';
                ApplicationArea = All;
                Image = Shipment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Visible = ShipVisible;

                trigger OnAction()
                begin
                end;
            }

            action(Receive)
            {
                Caption = 'Receive';
                ApplicationArea = All;
                Image = Receipt;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Visible = ReceiveVisible;

                trigger OnAction()
                begin
                end;
            }

            action(Invoice)
            {
                Caption = 'Invoice';
                ApplicationArea = All;
                Image = Invoice;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Visible = InvoiceVisible;

                trigger OnAction()
                begin
                end;
            }
        }
    }

    var
        ReleaseVisible: Boolean;
        PostVisible: Boolean;
        ShipVisible: Boolean;
        ReceiveVisible: Boolean;
        InvoiceVisible: Boolean;
        MakeOrderVisible: Boolean;

    trigger OnAfterGetCurrRecord()
    var
        DocumentActions: Interface "Demo IDocumentActions";
        DocType: Enum "Demo Sales Document Type";
    begin
        DocType := Rec."Document Type";
        DocumentActions := DocType;

        ReleaseVisible := DocumentActions.CanRelease();
        PostVisible := DocumentActions.CanPost();
        ShipVisible := DocumentActions.CanShip();
        ReceiveVisible := DocumentActions.CanReceive();
        InvoiceVisible := DocumentActions.CanInvoice();
        MakeOrderVisible := DocumentActions.CanMakeOrder();

        CurrPage.Update(false);
    end;
}

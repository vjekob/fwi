enum 50100 "Demo Sales Document Type" implements "Demo IDocumentActions"
{
    Extensible = true;
    AssignmentCompatibility = true;

    value(0; "Quote")
    {
        Caption = 'Quote';
        Implementation = "Demo IDocumentActions" = "Demo Sales Quote Actions";
    }

    value(1; "Order")
    {
        Caption = 'Order';
        Implementation = "Demo IDocumentActions" = "Demo Sales Order Actions";
    }

    value(2; "Invoice")
    {
        Caption = 'Invoice';
        Implementation = "Demo IDocumentActions" = "Demo Sales Invoice Actions";
    }

    value(3; "Credit Memo")
    {
        Caption = 'Credit Memo';
        Implementation = "Demo IDocumentActions" = "Demo Sales Credit Memo Actions";
    }

    value(4; "Blanket Order")
    {
        Caption = 'Blanket Order';
        Implementation = "Demo IDocumentActions" = "Demo Sales Blkt. Order Actions";
    }

    value(5; "Return Order")
    {
        Caption = 'Return Order';
        Implementation = "Demo IDocumentActions" = "Demo Sales Ret. Order Actions";
    }
}

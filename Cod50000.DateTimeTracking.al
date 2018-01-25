codeunit 70000000 "DateTime Tracking"
{
    trigger OnRun();
    begin
    end;


    [EventSubscriber(ObjectType::Table, 36, 'OnAfterInsertEvent', '', false, false)]
    local procedure SaveDateTimeSalesHeaderOnAfterInsert(var Rec: Record "Sales Header"; RunTrigger: Boolean);
    var
        DateTimeTracking: Record "DateTime Tracking";
    begin
        DateTimeTracking.Init;
        DateTimeTracking.Validate("Order No", Rec."No.");
        DateTimeTracking.Validate("Order Created", CurrentDateTime);
        DateTimeTracking.Insert;
    end;

    [EventSubscriber(ObjectType::Codeunit, 414, 'OnAfterReleaseSalesDoc', '', false, false)]
    local procedure SaveDateTimeOnAfterReleaseSalesDoc(var SalesHeader: Record "Sales Header"; PreviewMode: Boolean);
    var
        DateTimeTracking: Record "DateTime Tracking";
    begin
        DateTimeTracking.SetFilter("Order No", SalesHeader."No.");
        if DateTimeTracking.FindFirst then begin
            DateTimeTracking.Validate("Order Released", CurrentDateTime);
            DateTimeTracking.Modify;
        end;
    end;

    [EventSubscriber(ObjectType::Table, 110, 'OnAfterInsertEvent', '', false, false)]
    local procedure SaveDateTimeShipmentHeaderOnAfterInsert(var Rec: Record "Sales Shipment Header"; RunTrigger: Boolean);
    var
        DateTimeTracking: Record "DateTime Tracking";
    begin
        DateTimeTracking.SetFilter("Order No", Rec."Order No.");
        if DateTimeTracking.FindFirst then begin
            DateTimeTracking.Validate("Shipment No", Rec."No.");
            DateTimeTracking.Validate("Shipment Created", CurrentDateTime);
            DateTimeTracking.Modify;
        end;
    end;

    [EventSubscriber(ObjectType::Table, 112, 'OnAfterInsertEvent', '', false, false)]
    local procedure SaveDateTimeInvoiceHeaderOnAfterInsert(var Rec : Record "Sales Invoice Header"; RunTrigger : Boolean);
    var
        DateTimeTracking: Record "DateTime Tracking";
    begin
        DateTimeTracking.SetFilter("Order No", Rec."Order No.");
        if DateTimeTracking.FindFirst then begin
            DateTimeTracking.Validate("Invoice No", Rec."No.");
            DateTimeTracking.Validate("Invoice Created", CurrentDateTime);
            DateTimeTracking.Modify;
        end;
    end;
}
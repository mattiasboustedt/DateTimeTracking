table 70000000 "DateTime Tracking"
{
    fields
    {
        field(1;No;BigInteger)
        {
            AutoIncrement = true;
        }

        field(2;"Order No";Code[50])
        {
        }

        field(3;"Shipment No";Code[50])
        {
        }

        field(4;"Invoice No";Code[50])
        {
        }

        field(5;"Order Created";Datetime)
        {
        }

        field(6;"Order Released";Datetime)
        {   
        }

        field(7;"Shipment Created";Datetime)
        {
        }

        field(8;"Invoice Created";Datetime)
        {
        }

    }

    keys
    {
        key(PK;No)
        {
            Clustered = true;
        }
    }

    trigger OnInsert();
    begin
    end;

    trigger OnModify();
    begin
    end;

    trigger OnDelete();
    begin
    end;

    trigger OnRename();
    begin
    end;

}
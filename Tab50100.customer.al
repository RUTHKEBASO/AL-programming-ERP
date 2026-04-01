table 50100 "Library"
{
    Caption = 'Store';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Book id"; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Book id';
            NotBlank = True;
        }
        field(2; "Title"; Text[60])
        {
            DataClassification = CustomerContent;
            Caption = 'Title';
        }
        field(3; "Author"; Text[89])
        {
            DataClassification = CustomerContent;
            Caption = 'Author';
        }
        field(4; "Year_published"; integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Year published';
        }
        field(5; "Status"; Option)
        {
            DataClassification = CustomerContent;
            Caption = 'Status';
            OptionMembers = " ","Not Available","Borrowed","Available";
            OptionCaption = ' ,Not Available,Borrowed,Available';
        }
    }
    keys
    {
        key(PK; "Book id")
        {
            Clustered = true;
        }
    }
}

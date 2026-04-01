// Declares a new table with ID 50101 to store library members
table 50101 "Library Member"
{
    // Caption shown in BC — what users see as the table label
    Caption = 'Library Member';

    // ToBeClassified is temporary — fine for learning projects
    DataClassification = ToBeClassified;

    fields
    {
        // Field 1 — Primary Key — unique ID for each member
        // Code[20] stores uppercase text up to 20 characters
        // NotBlank = true means this field cannot be left empty
        field(1; "Member Id"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Member Id';
            NotBlank = true;
        }

        // Field 2 — Member full name
        // Text[100] stores any text up to 100 characters
        field(2; "Full Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Full Name';
            NotBlank = true;
        }

        // Field 3 — Member email address
        field(3; "Email"; Text[80])
        {
            DataClassification = CustomerContent;
            Caption = 'Email';
        }

        // Field 4 — Member phone number
        field(4; "Phone No."; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Phone No.';
        }

        // Field 5 — Member physical address
        field(5; "Address"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Address';
        }

        // Field 6 — Date member registered in the library
        // Set automatically by OnInsert trigger below
        field(6; "Registration Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Registration Date';

            // Editable = false means user cannot manually change this
            // It is set automatically by the trigger
            Editable = false;
        }

        // Field 7 — How many books this member currently has borrowed
        // Editable = false — updated by code only, not by user
        field(7; "Books Borrowed"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Books Borrowed';
            Editable = false;

            // MinValue = 0 means it can never go below zero
            MinValue = 0;
        }

        // Field 8 — Whether this member is active or blocked
        field(8; "Status"; Option)
        {
            DataClassification = CustomerContent;
            Caption = 'Status';

            // OptionMembers defines the dropdown choices
            OptionMembers = "Active","Blocked";

            // OptionCaption is what the user sees in the dropdown
            OptionCaption = 'Active,Blocked';
        }
    }

    keys
    {
        // Primary key — must be Clustered = true
        // Member Id is the unique identifier for each member
        key(PK; "Member Id")
        {
            Clustered = true;
        }

        // Secondary key — allows fast search by Full Name
        key(NameKey; "Full Name") { }
    }

    // OnInsert trigger — runs automatically when a new member is saved
    trigger OnInsert()
    begin
        // If Registration Date is empty set it to today automatically
        // 0D means empty date in AL
        if "Registration Date" = 0D then
            "Registration Date" := Today();

        // New members always start as Active
        Status := Status::Active;
    end;
}
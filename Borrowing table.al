// Declares the Borrowing History table — links members to books
table 50102 "Borrowing History"
{
    Caption = 'Borrowing History';
    DataClassification = ToBeClassified;

    fields
    {
        // Field 1 — Primary Key — unique entry number for each borrowing
        // Integer auto-increments — each new entry gets the next number
        field(1; "Entry No."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Entry No.';
        }

        // Field 2 — links to Library Member table
        // Must match a Member Id that exists in Library Member table
        // TableRelation enforces this link — BC validates it automatically
        field(2; "Member Id"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Member Id';

            // TableRelation = tells BC this field must match a record
            // in the Library Member table
            TableRelation = "Library Member"."Member Id";
        }

        // Field 3 — links to Library table
        // Must match a Book id that exists in Library table
        field(3; "Book Id"; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Book Id';

            // TableRelation links this field to the Library table
            TableRelation = "Library"."Book id";
        }

        // Field 4 — stores the book title for easy reading
        // Filled automatically from the Library table when Book Id is set
        field(4; "Book Title"; Text[60])
        {
            DataClassification = CustomerContent;
            Caption = 'Book Title';

            // Editable = false — filled by code, not user
            Editable = false;
        }

        // Field 5 — the date the book was borrowed
        // Set automatically when record is inserted
        field(5; "Borrow Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Borrow Date';
            Editable = false;
        }

        // Field 6 — the date the book was returned
        // Empty until the book is returned
        field(6; "Return Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Return Date';
            Editable = false;
        }

        // Field 7 — whether the book has been returned or not
        field(7; "Returned"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Returned';

            // Editable = false — set by code when book is returned
            Editable = false;
        }
    }

    keys
    {
        // Primary key on Entry No.
        key(PK; "Entry No.")
        {
            Clustered = true;
        }

        // Secondary key — find all borrowings by a specific member
        key(MemberKey; "Member Id") { }

        // Secondary key — find all borrowings of a specific book
        key(BookKey; "Book Id") { }
    }

    // OnInsert trigger — runs when a new borrowing record is created
    trigger OnInsert()
    begin
        // Automatically set Borrow Date to today
        "Borrow Date" := Today();

        // Returned starts as false — book not yet returned
        Returned := false;
    end;
}
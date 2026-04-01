// List page to display all borrowing history records
page 50104 "Borrowing History List"
{
    // List type shows all history records in a grid
    PageType = List;

    // Visible to all users
    ApplicationArea = All;

    // THIS IS CRITICAL — makes page appear in BC search
    UsageCategory = Lists;

    // Connected to Borrowing History table
    SourceTable = "Borrowing History";

    // Title shown at top of page
    Caption = 'Borrowing History';

    // Read only — history should never be manually edited
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(HistoryList)
            {
                // Unique entry number
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }

                // Who borrowed the book
                field("Member Id"; Rec."Member Id")
                {
                    ApplicationArea = All;
                }

                // Which book was borrowed
                field("Book Id"; Rec."Book Id")
                {
                    ApplicationArea = All;
                }

                // Title of the book
                field("Book Title"; Rec."Book Title")
                {
                    ApplicationArea = All;
                }

                // Date borrowed
                field("Borrow Date"; Rec."Borrow Date")
                {
                    ApplicationArea = All;
                }

                // Date returned — empty if still borrowed
                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = All;
                }

                // True = returned, False = still borrowed
                field("Returned"; Rec.Returned)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
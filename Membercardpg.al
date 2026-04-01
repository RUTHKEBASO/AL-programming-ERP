// Card page to display one member in full detail
page 50103 "Member Card"
{
    // Card type shows one single record
    PageType = Card;

    // Visible to all users
    ApplicationArea = All;

    // Connected to Library Member table
    SourceTable = "Library Member";

    // Title shown at top of page
    Caption = 'Member Details';

    layout
    {
        area(Content)
        {
            // General group — main member info
            group(General)
            {
                Caption = 'Member Information';

                // Member Id field
                field("Member Id"; Rec."Member Id")
                {
                    ApplicationArea = All;
                }

                // Full Name field
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = All;
                }

                // Status — Active or Blocked
                field("Status"; Rec.Status)
                {
                    ApplicationArea = All;
                }

                // Date registered — set automatically
                field("Registration Date"; Rec."Registration Date")
                {
                    ApplicationArea = All;
                }

                // Number of books currently borrowed
                field("Books Borrowed"; Rec."Books Borrowed")
                {
                    ApplicationArea = All;
                }
            }

            // Contact group — member contact details
            group(Contact)
            {
                Caption = 'Contact Details';

                // Email address
                field("Email"; Rec."Email")
                {
                    ApplicationArea = All;
                }

                // Phone number
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                }

                // Physical address
                field("Address"; Rec."Address")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
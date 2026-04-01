// List page to display all Library Members in BC
page 50102 "Member List"
{
    // List type shows all members in a grid
    PageType = List;

    // Makes page visible to all users
    ApplicationArea = All;

    // THIS IS CRITICAL — makes page searchable in BC search bar
    // Without this line the page will NOT appear when you search
    UsageCategory = Lists;

    // Connects this page to Library Member table
    SourceTable = "Library Member";

    // Title shown at top of page in BC
    Caption = 'Library Members';

    // Clicking a row opens the Member Card page
    CardPageId = "Member Card";

    layout
    {
        area(Content)
        {
            // Repeater creates the grid of rows
            repeater(MemberList)
            {
                // Member Id column
                field("Member Id"; Rec."Member Id")
                {
                    ApplicationArea = All;
                }

                // Full Name column
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = All;
                }

                // Email column
                field("Email"; Rec."Email")
                {
                    ApplicationArea = All;
                }

                // Phone number column
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                }

                // How many books currently borrowed
                field("Books Borrowed"; Rec."Books Borrowed")
                {
                    ApplicationArea = All;
                }

                // Active or Blocked status
                field("Status"; Rec.Status)
                {
                    ApplicationArea = All;
                }

                // Date they joined the library
                field("Registration Date"; Rec."Registration Date")
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
            // Button to insert 3 test members
            action("Insert Test Members")
            {
                ApplicationArea = All;
                Caption = 'Insert Test Members';
                Image = Import;

                trigger OnAction()
                var
                    // Links to Library Management codeunit
                    LibMgt: Codeunit "Library Management";
                begin
                    // Calls InsertMembers procedure
                    LibMgt.InsertMembers();
                end;
            }
        }
    }
}
page 50100 "Library List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Library";
    Caption = 'Library Books';
    CardPageId = "Library Card";

    layout
    {
        area(Content)
        {
            repeater(BookList)
            {
                field("Book id"; Rec."Book id")
                {
                    ApplicationArea = All;
                }
                field("Title"; Rec."Title")
                {
                    ApplicationArea = All;
                }
                field("Author"; Rec."Author")
                {
                    ApplicationArea = All;
                }
                field("Year_published"; Rec."Year_published")
                {
                    ApplicationArea = All;
                }
                field("Status"; Rec.Status)
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
            action("Insert Test Data")
            {
                ApplicationArea = All;
                Caption = 'Insert Test Data';
                Image = Import;

                trigger OnAction()
                var
                    LibMgt: Codeunit "Library Management";
                begin
                    LibMgt.Run(); // calls OnRun trigger
                end;
            }

            action("Borrow Book")
            {
                ApplicationArea = All;
                Caption = 'Borrow Book';
                Image = Apply;

                trigger OnAction()
                var
                    LibMgt: Codeunit "Library Management";
                begin
                    // calls BorrowBook procedure directly
                    LibMgt.BorrowBook(Rec."Book id");
                end;
            }

            action("Return Book")
            {
                ApplicationArea = All;
                Caption = 'Return Book';
                Image = Undo;

                trigger OnAction()
                var
                    LibMgt: Codeunit "Library Management";
                begin
                    LibMgt.ReturnBook(Rec."Book id");
                end;
            }
        }
    }
}
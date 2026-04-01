page 50101 "Library Card"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "Library";
    Caption = 'Book Details';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'Book Information';

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
}

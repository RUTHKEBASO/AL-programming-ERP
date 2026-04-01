codeunit 50100 "Library Management"
{
    trigger OnRun()
    begin
        InsertBooks();
    end;

    // ─── INSERT BOOKS ────────────────────────────────────────────
    procedure InsertBooks()
    var
        Lib: Record "Library";
    begin
        if Lib.FindFirst() then begin
            Message('Books already exist!');
            exit;
        end;

        Lib.Init();
        Lib."Book id" := 'BK-001';
        Lib."Title" := 'Things Fall Apart';
        Lib."Author" := 'Chinua Achebe';
        Lib."Year_published" := 1958;
        Lib.Status := Lib.Status::Available;
        Lib.Insert(true);

        Lib.Init();
        Lib."Book id" := 'BK-002';
        Lib."Title" := 'Weep Not Child';
        Lib."Author" := 'Ngugi wa Thiongo';
        Lib."Year_published" := 1964;
        Lib.Status := Lib.Status::Borrowed;
        Lib.Insert(true);

        Lib.Init();
        Lib."Book id" := 'BK-003';
        Lib."Title" := 'A Grain of Wheat';
        Lib."Author" := 'Ngugi wa Thiongo';
        Lib."Year_published" := 1967;
        Lib.Status := Lib.Status::"Not Available";
        Lib.Insert(true);

        Message('3 Books inserted successfully!');
    end;

    // ─── INSERT MEMBERS ──────────────────────────────────────────
    procedure InsertMembers()
    var
        Mem: Record "Library Member";
    begin
        if Mem.FindFirst() then begin
            Message('Members already exist!');
            exit;
        end;

        Mem.Init();
        Mem."Member Id" := 'MEM-001';
        Mem."Full Name" := 'Alice Wanjiru';
        Mem."Email" := 'alice@email.com';
        Mem."Phone No." := '+254711000001';
        Mem."Address" := '123 Moi Avenue, Nairobi';
        Mem.Insert(true);

        Mem.Init();
        Mem."Member Id" := 'MEM-002';
        Mem."Full Name" := 'Brian Ochieng';
        Mem."Email" := 'brian@email.com';
        Mem."Phone No." := '+254722000002';
        Mem."Address" := '45 Kimathi Street, Mombasa';
        Mem.Insert(true);

        Mem.Init();
        Mem."Member Id" := 'MEM-003';
        Mem."Full Name" := 'Carol Njeri';
        Mem."Email" := 'carol@email.com';
        Mem."Phone No." := '+254733000003';
        Mem."Address" := '78 Kenyatta Avenue, Kisumu';
        Mem.Insert(true);

        Message('3 Members inserted successfully!');
    end;

    // ─── BORROW BOOK ─────────────────────────────────────────────
    procedure BorrowBook(BookId: Code[50])
    var
        Lib: Record "Library";
    begin
        if not Lib.Get(BookId) then begin
            Error('Book %1 was not found!', BookId);
            exit;
        end;

        if Lib.Status <> Lib.Status::Available then begin
            Error('Book %1 is not available for borrowing!', BookId);
            exit;
        end;

        Lib.Status := Lib.Status::Borrowed;
        Lib.Modify(true);
        Message('Book %1 borrowed successfully!', BookId);
    end;

    // ─── RETURN BOOK ─────────────────────────────────────────────
    procedure ReturnBook(BookId: Code[50])
    var
        Lib: Record "Library";
    begin
        if not Lib.Get(BookId) then begin
            Error('Book %1 was not found!', BookId);
            exit;
        end;

        Lib.Status := Lib.Status::Available;
        Lib.Modify(true);
        Message('Book %1 returned successfully!', BookId);
    end;

}
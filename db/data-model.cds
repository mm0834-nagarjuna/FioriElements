namespace my.bookshop;

entity Books {
  key ID              : Integer;
      title           : String;
      stock           : Integer;
      authorName      : String;
      authorDetails   : Association to many Authors
                          on authorDetails.authorName = $self.authorName;
      price           : Integer;
      publicationDate : String;
      genre           : String;
      language        : String;
      rating          : Integer;
}

entity Authors {
  key authorId      : Integer;
      authorName    : String;
      authorEmail   : String;
      authorCountry : String;
      authorBooks   : Composition of many Books
                        on authorBooks.authorName = $self.authorName;
}

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
      isDelatable     : Boolean;
      priceDetails    : Composition of many PriceStatistics
                          on priceDetails.bookID = $self.ID
}

entity Authors {
  key authorId      : Integer;
      authorName    : String;
      authorEmail   : String;
      authorCountry : String;
      authorBooks   : Composition of many Books
                        on authorBooks.authorName = $self.authorName;
}

entity PriceStatistics {
  key ID              : Integer;
      bookID          : Integer;
      previousPrice   : Integer;
      newPrice        : Integer;
      priceChangeType : String; // This could be "increase" or "decrease"
      timestamp       : Timestamp  @cds.on.insert: $now  @cds.on.update: $now;
}

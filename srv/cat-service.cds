using my.bookshop as my from '../db/data-model';

service CatalogService {
    
    entity Books as projection on my.Books actions{
        action addBooks () returns String;
    };
    entity Authors as projection on my.Authors;
    entity PriceStatistics as projection on my.PriceStatistics;
    
    
}




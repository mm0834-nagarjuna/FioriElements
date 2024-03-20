using from '../../srv/cat-service';
using from '../../db/data-model';

//listPage Table
annotate CatalogService.Books with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'ID',
            Value : ID,
            ![@UI.Importance] : #High
        },
        {
            $Type : 'UI.DataField',
            Label : 'title',
            Value : title,
            ![@UI.Importance] : #High
        },
        {
            $Type : 'UI.DataField',
            Label : 'author',
            Value : authorName,
            ![@UI.Importance] : #High
        },
        {
            $Type : 'UI.DataField',
            Value : genre,
            Label : 'genre',
        },
        {
            $Type : 'UI.DataField',
            Label : 'price',
            Value : price,
            ![@UI.Importance] : #High
        },
    ]
);

//listPage FilterBars
annotate CatalogService.Books with @(
    UI.SelectionFields : [
        authorName,
        title,
        genre
    ],
);




annotate CatalogService.Books{
   authorName @Common.ValueList: {
        Label : 'Author',
        CollectionPath : 'Books',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : 'authorName',
                ValueListProperty : 'authorName',
            },
             {
                $Type : 'Common.ValueListParameterOut',
                LocalDataProperty : 'genre',
                ValueListProperty : 'genre',
            }
           
        ]
    };
    
};





// annotate CatalogService.Books with {
//     genre @(Common : { 
//          Label  : 'Connected Entity',
//          Text : genre,
//          TextArrangement : #TextOnly,
//          ValueListWithFixedValues,
//          ValueList : {
//              $Type : 'Common.ValueListType',
//              CollectionPath : genre,
//              Parameters : [
//               {
//                   @Type : 'Common.ValueListParameterInOut',
//               }

//              ]
//          },
//      },)
// } ;





//objectPage FieldGroup
annotate CatalogService.Books with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'ID',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'title',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'stock',
                Value : stock,
            },
            {
                $Type : 'UI.DataField',
                Label : 'authorName',
                Value : authorName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'price',
                Value : price,
            },
            {
                $Type : 'UI.DataField',
                Label : 'publicationDate',
                Value : publicationDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'genre',
                Value : genre,
            },
            {
                $Type : 'UI.DataField',
                Label : 'language',
                Value : language,
            },
            {
                $Type : 'UI.DataField',
                Label : 'rating',
                Value : rating,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Author Details',
            ID : 'IdentificatinSection',
            Target : '@UI.Identification',
        },
    ],
   
);

//objectPage Header DataPoints
annotate CatalogService.Books with @(
    UI.DataPoint #title : {
        $Type : 'UI.DataPointType',
        Value : title,
        Title : 'title',
    },
     UI.DataPoint #rating : {
        $Type : 'UI.DataPointType',
        Value : rating,
        Title : 'rating',
        TargetValue : 5,
        Visualization : #Rating,
    },
    UI.DataPoint #stock : {
        Value : stock,
        TargetValue : 100,
    },
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'title',
            Target : '@UI.DataPoint#title',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'rating',
            Target : '@UI.DataPoint#rating',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'stock',
            Target : '@UI.Chart#stock',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'price',
            Target : '@UI.Chart#price1',
        },
    ],
     UI.Chart #stock : {
        ChartType : #Donut,
        Title : 'stock',
        Measures : [
            stock,
        ],
        MeasureAttributes : [
            {
                DataPoint : '@UI.DataPoint#stock',
                Role : #Axis1,
                Measure : stock,
            },
        ],
    }
);


annotate CatalogService.Authors with @(
    UI.DataPoint #authorId : {
        Value : authorId,
    },
    UI.Chart #authorId : {
        ChartType : #Line,
        Title : 'authorId',
        Measures : [
            authorId,
        ],
        MeasureAttributes : [
            {
                DataPoint : '@UI.DataPoint#authorId',
                Role : #Axis1,
                Measure : authorId,
            },
        ],
        Dimensions : [
            authorId,
        ],
    }
);
annotate CatalogService.Books with @(
    UI.DataPoint #price : {
        Value : price,
        TargetValue : price,
    },
    UI.Chart #price : {
        ChartType : #Donut,
        Title : 'price',
        Measures : [
            price,
        ],
        MeasureAttributes : [
            {
                DataPoint : '@UI.DataPoint#price',
                Role : #Axis1,
                Measure : price,
            },
        ],
    }
);
annotate CatalogService.Books with @(
    UI.DataPoint #rating1 : {
        Value : rating,
        MinimumValue : 0,
        MaximumValue : 5,
    },
    UI.Chart #rating : {
        ChartType : #Bullet,
        Title : 'rating',
        Measures : [
            rating,
        ],
        MeasureAttributes : [
            {
                DataPoint : '@UI.DataPoint#rating1',
                Role : #Axis1,
                Measure : rating,
            },
        ],
    }
);
annotate CatalogService.Books with @(
    UI.DataPoint #price1 : {
        Value : price,
        MinimumValue : 0,
        MaximumValue : 100,
    },
    UI.Chart #price1 : {
        ChartType : #Bullet,
        Title : 'price',
        Measures : [
            price,
        ],
        MeasureAttributes : [
            {
                DataPoint : '@UI.DataPoint#price1',
                Role : #Axis1,
                Measure : price,
            },
        ],
    }
);
annotate CatalogService.Authors with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Author Details',
            ID : 'AuthorDetails',
            Target : '@UI.FieldGroup#AuthorDetails',
        },
    ],
    UI.FieldGroup #AuthorDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : authorName,
                Label : 'authorName',
            },{
                $Type : 'UI.DataField',
                Value : authorEmail,
                Label : 'authorEmail',
            },{
                $Type : 'UI.DataField',
                Value : authorCountry,
                Label : 'authorCountry',
            },{
                $Type : 'UI.DataField',
                Value : authorBooks.title,
                Label : 'title',
            },{
                $Type : 'UI.DataField',
                Value : authorBooks.publicationDate,
                Label : 'publicationDate',
            },{
                $Type : 'UI.DataField',
                Value : authorBooks.genre,
                Label : 'genre',
            },{
                $Type : 'UI.DataField',
                Value : authorBooks.language,
                Label : 'language',
            },],
    }
);
annotate CatalogService.Books with @(
    UI.Identification : [
        {
            $Type : 'UI.DataField',
            Value : authorDetails.authorName,
            Label : 'authorName',
        },{
            $Type : 'UI.DataField',
            Value : authorDetails.authorEmail,
            Label : 'authorEmail',
        },{
            $Type : 'UI.DataField',
            Value : authorDetails.authorCountry,
            Label : 'authorCountry',
        },]
);

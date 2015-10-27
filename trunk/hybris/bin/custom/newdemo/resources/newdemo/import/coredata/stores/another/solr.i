#
# Import the Solr configuration for the store
#
$prefix=newdemo
$productCatalog=$prefixProductCatalog
$catalogVersions=catalogVersions(catalog(id),version);
$serverConfigName=$prefixSolrServerConfig
$indexConfigName=$prefixSolrIndexConfig
$searchConfigName=$prefixPageSize
$facetSearchConfigName=$prefixIndex
$facetSearchConfigDescription=newdemo Solr Index
$searchIndexNamePrefix=$prefix
$solrIndexedType=$prefixProductType
$indexBaseSite=$prefix
$indexLanguages=en,de
$indexCurrencies=EUR,GBP,USD
$priceRangeGBP=$prefixPriceRangeGBP
$priceRangeEUR=$prefixPriceRangeEUR
 
#
# Setup the Solr server, indexer, and search configs
#
# Create the solr server configuration
INSERT_UPDATE SolrServerConfig;name[unique=true];mode(code);embeddedMaster
;$serverConfigName;embedded;true
# Create the solr indexer configuration
INSERT_UPDATE SolrIndexConfig;name[unique=true];batchSize;numberOfThreads;indexMode(code);
;$indexConfigName;100;1;TWO_PHASE;
# Create the faceted search configuration
INSERT_UPDATE SolrSearchConfig;description[unique=true];pageSize
;$searchConfigName;20
#
# Setup the indexed types, their properties, and the update queries
#
# Declare the indexed type Product
INSERT_UPDATE SolrIndexedType;identifier[unique=true];type(code);variant;sorts(&sortRefID)
;$solrIndexedType;Product;false;sortRef1,sortRef2,sortRef3,sortRef4,sortRef5,sortRef6
INSERT_UPDATE SolrFacetSearchConfig;name[unique=true];description;indexNamePrefix;languages(isocode);currencies(isocode);solrServerConfig(name);solrSearchConfig(description);solrIndexConfig(name);solrIndexedTypes(identifier);enabledLanguageFallbackMechanism;$catalogVersions
;$facetSearchConfigName;$facetSearchConfigDescription;$searchIndexNamePrefix;$indexLanguages;$indexCurrencies;$serverConfigName;$searchConfigName;$indexConfigName;$solrIndexedType;true;newdemoProductCatalog:Online,newdemoProductCatalog:Staged
UPDATE BaseSite;uid[unique=true];solrFacetSearchConfiguration(name)
;$indexBaseSite;$facetSearchConfigName
 
# Define price range set
INSERT_UPDATE SolrValueRangeSet;name[unique=true];qualifier;type;solrValueRanges(&rangeValueRefID)
;$priceRangeGBP;GBP;double;rangeRefGBP1,rangeRefGBP2,rangeRefGBP3,rangeRefGBP4,rangeRefGBP5,rangeRefGBP6,rangeRefGBP7,rangeRefGBP8,rangeRefGBP9,rangeRefGBP10,rangeRefGBP11,rangeRefGBP12,rangeRefGBP13
;$priceRangeEUR;EUR;double;rangeRefEUR1,rangeRefEUR2,rangeRefEUR3,rangeRefEUR4,rangeRefEUR5,rangeRefEUR6,rangeRefEUR7,rangeRefEUR8,rangeRefEUR9,rangeRefEUR10,rangeRefEUR11,rangeRefEUR12,rangeRefEUR13
;$priceRangeUSD;USD;double;rangeRefUSD1,rangeRefUSD2,rangeRefUSD3,rangeRefUSD4,rangeRefUSD5,rangeRefUSD6,rangeRefUSD7,rangeRefUSD8,rangeRefUSD9,rangeRefUSD10,rangeRefUSD11,rangeRefUSD12,rangeRefUSD13
 
# Define price ranges
INSERT_UPDATE SolrValueRange;&rangeValueRefID;solrValueRangeSet(name)[unique=true];name[unique=true];from;to
;rangeRefGBP1 ;$priceRangeGBP;    £0-£19.99;   0; 19.99
;rangeRefGBP2 ;$priceRangeGBP;   £20-£49.99;  20; 49.99
;rangeRefGBP3 ;$priceRangeGBP;   £50-£99.99;  50; 99.99
;rangeRefGBP4 ;$priceRangeGBP; £100-£199.99; 100;199.99
;rangeRefGBP5 ;$priceRangeGBP; £200-£299.99; 200;299.99
;rangeRefGBP6 ;$priceRangeGBP; £300-£399.99; 300;399.99
;rangeRefGBP7 ;$priceRangeGBP; £400-£499.99; 400;499.99
;rangeRefGBP8 ;$priceRangeGBP; £500-£599.99; 500;599.99
;rangeRefGBP9 ;$priceRangeGBP; £600-£699.99; 600;699.99
;rangeRefGBP10;$priceRangeGBP; £700-£799.99; 700;799.99
;rangeRefGBP11;$priceRangeGBP; £800-£899.99; 800;899.99
;rangeRefGBP12;$priceRangeGBP; £900-£999.99; 900;999.99
;rangeRefGBP13;$priceRangeGBP;£1,000-£100,000;1000;100000
  
;rangeRefEUR1 ;$priceRangeEUR;    €0-€19.99;   0; 19.99
;rangeRefEUR2 ;$priceRangeEUR;   €20-€49.99;  20; 49.99
;rangeRefEUR3 ;$priceRangeEUR;   €50-€99.99;  50; 99.99
;rangeRefEUR4 ;$priceRangeEUR; €100-€199.99; 100;199.99
;rangeRefEUR5 ;$priceRangeEUR; €200-€299.99; 200;299.99
;rangeRefEUR6 ;$priceRangeEUR; €300-€399.99; 300;399.99
;rangeRefEUR7 ;$priceRangeEUR; €400-€499.99; 400;499.99
;rangeRefEUR8 ;$priceRangeEUR; €500-€599.99; 500;599.99
;rangeRefEUR9 ;$priceRangeEUR; €600-€699.99; 600;699.99
;rangeRefEUR10;$priceRangeEUR; €700-€799.99; 700;799.99
;rangeRefEUR11;$priceRangeEUR; €800-€899.99; 800;899.99
;rangeRefEUR12;$priceRangeEUR; €900-€999.99; 900;999.99
;rangeRefEUR13;$priceRangeEUR; €1,000-€100,000;1000;100000
 
;rangeRefUSD1 ;$priceRangeUSD;    $0-$19.99;   0; 19.99
;rangeRefUSD2 ;$priceRangeUSD;   $20-$49.99;  20; 49.99
;rangeRefUSD3 ;$priceRangeUSD;   $50-$99.99;  50; 99.99
;rangeRefUSD4 ;$priceRangeUSD; $100-$199.99; 100;199.99
;rangeRefUSD5 ;$priceRangeUSD; $200-$299.99; 200;299.99
;rangeRefUSD6 ;$priceRangeUSD; $300-$399.99; 300;399.99
;rangeRefUSD7 ;$priceRangeUSD; $400-$499.99; 400;499.99
;rangeRefUSD8 ;$priceRangeUSD; $500-$599.99; 500;599.99
;rangeRefUSD9 ;$priceRangeUSD; $600-$699.99; 600;699.99
;rangeRefUSD10;$priceRangeUSD; $700-$799.99; 700;799.99
;rangeRefUSD11;$priceRangeUSD; $800-$899.99; 800;899.99
;rangeRefUSD12;$priceRangeUSD; $900-$999.99; 900;999.99
;rangeRefUSD13;$priceRangeUSD; $1,000-$100,000;1000;100000
 
 
# Non-facet properties
INSERT_UPDATE SolrIndexedProperty;solrIndexedType(identifier)[unique=true];name[unique=true];type(code);sortableType(code);currency[default=false];localized[default=false];multiValue[default=false];useForSpellchecking[default=false];useForAutocomplete[default=false];fieldValueProvider;valueProviderParameter
;$solrIndexedType; code                   ;string ;            ;    ;    ;    ;true;true;springELValueProvider;code
;$solrIndexedType; name                   ;text   ;sortabletext;    ;true;    ;true;true;springELValueProvider;getName(#lang)
;$solrIndexedType; description            ;text   ;            ;    ;true;    ;    ;    ;;
;$solrIndexedType; summary                ;text   ;            ;    ;true;    ;    ;    ;;
;$solrIndexedType; manufacturerName       ;text   ;            ;    ;    ;    ;true;true;;
;$solrIndexedType; manufacturerAID        ;string ;            ;    ;    ;    ;    ;    ;;
;$solrIndexedType; ean                    ;string ;            ;    ;    ;    ;true;true;;
;$solrIndexedType; priceValue             ;double ;            ;true;    ;    ;    ;    ;productPriceValueProvider;
;$solrIndexedType; keywords               ;text   ;            ;    ;true;    ;true;true;productKeywordsValueProvider;
;$solrIndexedType; reviewAvgRating        ;double ;            ;    ;true;    ;    ;    ;productReviewAverageRatingValueProvider;
;$solrIndexedType; img-515Wx515H          ;string ;            ;    ;    ;    ;    ;    ;image515ValueProvider;
;$solrIndexedType; img-300Wx300H          ;string ;            ;    ;    ;    ;    ;    ;image300ValueProvider;
;$solrIndexedType; img-96Wx96H            ;string ;            ;    ;    ;    ;    ;    ;image96ValueProvider;
;$solrIndexedType; img-65Wx65H            ;string ;            ;    ;    ;    ;    ;    ;image65ValueProvider;
;$solrIndexedType; img-30Wx30H            ;string ;            ;    ;    ;    ;    ;    ;image30ValueProvider;
;$solrIndexedType; url                    ;string ;            ;    ;true;    ;    ;    ;productUrlValueProvider;
;$solrIndexedType; primaryPromotionCode   ;string ;            ;    ;    ;    ;    ;    ;promotionCodeValueProvider;
;$solrIndexedType; primaryPromotionBanner ;string ;            ;    ;    ;    ;    ;    ;promotionImageValueProvider;
;$solrIndexedType; stockLevelStatus       ;string ;            ;    ;    ;    ;    ;    ;productStockLevelStatusValueProvider;
# Category fields
INSERT_UPDATE SolrIndexedProperty;solrIndexedType(identifier)[unique=true];name[unique=true];type(code);localized[default=false];multiValue[default=true];categoryField[default=true];useForSpellchecking[default=false];useForAutocomplete[default=false];fieldValueProvider
;$solrIndexedType; categoryName     ;text   ;true;;;;;$prefixCategoryNameValueProvider
;$solrIndexedType; brandName        ;text   ;true;;;;;$prefixBrandCategoryNameValueProvider
# Category facets
INSERT_UPDATE SolrIndexedProperty;solrIndexedType(identifier)[unique=true];name[unique=true];type(code);multiValue[default=true];facet[default=true];facetType(code);facetSort(code);priority;visible;categoryField[default=true];fieldValueProvider;facetDisplayNameProvider;topValuesProvider
;$solrIndexedType; allCategories    ;string;;;Refine        ;Alpha;-9999;false;;categoryCodeValueProvider;
;$solrIndexedType; categoryPath     ;string;;;Refine        ;Alpha;-9999;false;false;categoryPathValueProvider;
;$solrIndexedType; category         ;string;;;Refine        ;Alpha; 6000;true;;$prefixCategoryCodeValueProvider;categoryFacetDisplayNameProvider;defaultTopValuesProvider
;$solrIndexedType; brand            ;string;;;Refine        ;Alpha; 5000;true;;$prefixBrandCategoryCodeValueProvider;categoryFacetDisplayNameProvider;defaultTopValuesProvider
# Other facet properties
INSERT_UPDATE SolrIndexedProperty;solrIndexedType(identifier)[unique=true];name[unique=true];type(code);sortableType(code);currency[default=false];localized[default=false];multiValue[default=false];facet[default=true];facetType(code);facetSort(code);priority;visible;useForSpellchecking[default=false];useForAutocomplete[default=false];fieldValueProvider;facetDisplayNameProvider;customFacetSortProvider;topValuesProvider;rangeSets(name)
;$solrIndexedType; price            ;double ;    ;true ;     ;     ;     ;MultiSelectOr ;Alpha ; 4000;true;     ;     ;productPriceValueProvider    ;;;defaultTopValuesProvider;$priceRangeGBP,$priceRangeEUR,$priceRangeUSD
;$solrIndexedType; allPromotions    ;string ;    ;     ;     ;true ;     ;MultiSelectOr ;Alpha ; 0   ;false;     ;     ;promotionCodeValueProvider  ;promotionFacetDisplayNameProvider;                         ;
;$solrIndexedType; availableInStores;string ;    ;     ;     ;true ;     ;MultiSelectOr ;Custom;10000;true;     ;     ;productStoreStockValueProvider;$prefixPointOfServiceFacetDisplayNameProvider;distanceAttributeSortProvider
# Create the queries that will be used to extract data for Solr
INSERT_UPDATE SolrIndexerQuery;solrIndexedType(identifier)[unique=true];identifier[unique=true];type(code);injectCurrentDate[default=true];injectCurrentTime[default=true];injectLastIndexTime[default=true];query;user(uid)
;$solrIndexedType;$solrIndexedType-fullQuery;full;;;false;"SELECT {PK} FROM {Product}";anonymous
;$solrIndexedType;$solrIndexedType-updateQuery;update;;;;"SELECT {p:PK} FROM {Product AS p LEFT JOIN CustomerReview AS cr ON {cr:product}={p:PK}} WHERE ({p:modifiedtime} >= ?lastIndexTime OR {cr:modifiedtime} >= ?lastIndexTime)";anonymous
# Define the available sorts
INSERT_UPDATE SolrSort;&sortRefID;indexedType(identifier)[unique=true];code[unique=true];useBoost
;sortRef1;$solrIndexedType;relevance;true
;sortRef2;$solrIndexedType;topRated;false
;sortRef3;$solrIndexedType;name-asc;false
;sortRef4;$solrIndexedType;name-desc;false
;sortRef5;$solrIndexedType;price-asc;false
;sortRef6;$solrIndexedType;price-desc;false
# Define the sort fields
INSERT_UPDATE SolrSortField;sort(indexedType(identifier),code)[unique=true];fieldName[unique=true];ascending[unique=true]
;$solrIndexedType:relevance;score;false
;$solrIndexedType:name-asc;name;true
;$solrIndexedType:name-desc;name;false
;$solrIndexedType:price-asc;priceValue;true
;$solrIndexedType:price-desc;priceValue;false
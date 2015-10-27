#
# Import the Solr configuration for the store
#
# Index Type
$solrIndexedType=newdemoProductType
# Language
$lang=en
# Solr Indexed Property
UPDATE SolrIndexedProperty;solrIndexedType(identifier)[unique=true];name[unique=true];displayName[lang=$lang]
 ;$solrIndexedType;allPromotions;"Promotion"
 ;$solrIndexedType;availableInStores;"Stores"
 ;$solrIndexedType;brand;"Brand"
 ;$solrIndexedType;category;"Category"
 ;$solrIndexedType;code;"Code"
 ;$solrIndexedType;description;"Description"
 ;$solrIndexedType;manufacturerName;"Manufacturer Name"
 ;$solrIndexedType;name;"Name"
 ;$solrIndexedType;price;"Price"
 ;$solrIndexedType;summary;"Summary"
# Define the available sorts
UPDATE SolrSort;indexedType(identifier)[unique=true];code[unique=true];name[lang=$lang];useBoost
 ;$solrIndexedType;name-asc;"Name (ascending)";"false";
 ;$solrIndexedType;name-desc;"Name (descending)";"false";
 ;$solrIndexedType;price-asc;"Price (lowest first)";"false";
 ;$solrIndexedType;price-desc;"Price (highest first)";"false";
 ;$solrIndexedType;relevance;"Relevance";"true";
 ;$solrIndexedType;topRated;"Top Rated";"false";
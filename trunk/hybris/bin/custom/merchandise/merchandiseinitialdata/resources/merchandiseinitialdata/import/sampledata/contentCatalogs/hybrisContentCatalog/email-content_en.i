# ImpEx for Importing Email Content
# English Localisation

# Macros / Replacement Parameter definitions
$contentCatalog=__CONTENT_CATALOG_NAME__

$contentCV=catalogVersion(CatalogVersion.catalog(Catalog.id[default=$contentCatalog]),CatalogVersion.version[default=Staged])[default=$contentCatalog:Staged]
$picture=media(code, $contentCV);
$wideContent=CMSImageComponent,BannerComponent
$jarResource=jar:de.hybris.merchandise.initialdata.setup.InitialDataSystemSetup&/merchandiseinitialdata/import
$siteResource=jar:de.hybris.merchandise.initialdata.setup.InitialDataSystemSetup&/merchandiseinitialdata/import/contentCatalogs/$contentCatalog

# Language
$lang=en

# Language
# Media
INSERT_UPDATE Media;$contentCV[unique=true];code[unique=true];realfilename;@media[translator=de.hybris.platform.impex.jalo.media.MediaDataTranslator];mime[default='image/jpeg'];folder(qualifier)[default='images']

# CMS Image Components
UPDATE CMSImageComponent;$contentCV[unique=true];uid[unique=true];$picture[lang=$lang]

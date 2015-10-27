# ImpEx for Importing CMS Content
# English Localisation

# Macros / Replacement Parameter definitions
$contentCatalog=__CONTENT_CATALOG_NAME__

$contentCV=catalogVersion(CatalogVersion.catalog(Catalog.id[default=$contentCatalog]),CatalogVersion.version[default=Staged])[default=$contentCatalog:Staged]
$picture=media(code, $contentCV);
$siteResource=jar:de.hybris.merchandise.initialdata.setup.InitialDataSystemSetup&/merchandiseinitialdata/import/contentCatalogs/$contentCatalog

# Language
$lang=en

# Site Logo Component
UPDATE SimpleBannerComponent;$contentCV[unique=true];uid[unique=true];$picture[lang=$lang]

# CMS Link Components
UPDATE CMSLinkComponent;$contentCV[unique=true];uid[unique=true];linkName[lang=$lang]

# Lightbox Banner for Mini Cart (banner is not localizable so we must create a separate banner per language)
INSERT_UPDATE Media;$contentCV[unique=true];code[unique=true];@media[translator=de.hybris.platform.impex.jalo.media.MediaDataTranslator];mime[default='image/jpeg'];&imageRef;folder(qualifier)[default='images'];altText

UPDATE SimpleBannerComponent;$contentCV[unique=true];uid[unique=true];$picture[lang=$lang]

# CMS Mini Cart Component
UPDATE MiniCartComponent;$contentCV[unique=true];uid[unique=true];name;title[lang=$lang]

# CMS Tab Paragraph Components
UPDATE CMSTabParagraphComponent;$contentCV[unique=true];uid[unique=true];title[lang=$lang];content[lang=$lang]

# CMS Footer Component
UPDATE FooterComponent;$contentCV[unique=true];uid[unique=true];notice[lang=$lang]

# CMS Paragraph Components
UPDATE CMSParagraphComponent;$contentCV[unique=true];uid[unique=true];content[lang=$lang]

# CMS Product References Components
UPDATE ProductReferencesComponent;$contentCV[unique=true];uid[unique=true];title[lang=$lang]

# CMS PurchasedCategorySuggestionComponent Components
UPDATE PurchasedCategorySuggestionComponent;$contentCV[unique=true];uid[unique=true];title[lang=$lang]

# CMS CartSuggestion Components
UPDATE CartSuggestionComponent;$contentCV[unique=true];uid[unique=true];title[lang=$lang]

# Category Pages
UPDATE CategoryPage;$contentCV[unique=true];uid[unique=true];title[lang=$lang]

# CMS Navigation Nodes
UPDATE CMSNavigationNode;$contentCV[unique=true];uid[unique=true];title[lang=$lang]


# FAQ Page

# CMS Paragraph Component (Contact information)
UPDATE CMSParagraphComponent;$contentCV[unique=true];uid[unique=true];content[lang=en];


# Terms and Conditions Page

# CMS Paragraph Component (Contact information)
UPDATE CMSParagraphComponent;$contentCV[unique=true];uid[unique=true];content[lang=en];


# Homepage

# Media Content
INSERT_UPDATE Media;$contentCV[unique=true];code[unique=true];@media[translator=de.hybris.platform.impex.jalo.media.MediaDataTranslator];mime[default='image/jpeg'];&imageRef;folder(qualifier)[default='images'];altText


# CMS Banner Components
UPDATE Media;$contentCV[unique=true];code[unique=true];@media[translator=de.hybris.platform.impex.jalo.media.MediaDataTranslator];mime[default='image/jpeg'];altText;&imageRef

UPDATE SimpleBannerComponent;$contentCV[unique=true];uid[unique=true];$picture[lang=$lang]

UPDATE BannerComponent;$contentCV[unique=true];uid[unique=true];headline[lang=$lang];$picture[lang=$lang];content[lang=$lang]

UPDATE ProductCarouselComponent;$contentCV[unique=true];uid[unique=true];title[lang=$lang]


# Camera Accessories and Supplies Category Landing Page

UPDATE CategoryPage;$contentCV[unique=true];uid[unique=true];title[lang=$lang]

INSERT_UPDATE Media;$contentCV[unique=true];code[unique=true];@media[translator=de.hybris.platform.impex.jalo.media.MediaDataTranslator];mime[default='image/jpeg'];folder(qualifier)[default='images'];altText

UPDATE CategoryFeatureComponent;$contentCV[unique=true];uid[unique=true];title[lang=$lang];$picture[lang=$lang];description[lang=$lang]

UPDATE SimpleBannerComponent;$contentCV[unique=true];uid[unique=true];$picture[lang=$lang]

# Search Results Page

# Media Content
INSERT_UPDATE Media;$contentCV[unique=true];code[unique=true];@media[translator=de.hybris.platform.impex.jalo.media.MediaDataTranslator];mime[default='image/jpeg'];folder(qualifier)[default='images'];altText

UPDATE SimpleBannerComponent;$contentCV[unique=true];uid[unique=true];$picture[lang=$lang]

UPDATE CMSParagraphComponent;$contentCV[unique=true];uid[unique=true];content[lang=$lang]

# Cart Page

# Media Content
INSERT_UPDATE Media;$contentCV[unique=true];code[unique=true];@media[translator=de.hybris.platform.impex.jalo.media.MediaDataTranslator];mime[default='image/jpeg'];folder(qualifier)[default='images'];altText

UPDATE SimpleBannerComponent;$contentCV[unique=true];uid[unique=true];$picture[lang=$lang]

UPDATE CMSParagraphComponent;$contentCV[unique=true];uid[unique=true];content[lang=$lang]



# ImpEx for Importing CMS Mobile Content
# English Localisation

# Macros / Replacement Parameter definitions
$contentCatalog=__CONTENT_CATALOG_NAME__

$contentCV=catalogVersion(CatalogVersion.catalog(Catalog.id[default=$contentCatalog]),CatalogVersion.version[default=Staged])[default=$contentCatalog:Staged]
$picture=media(code, $contentCV);
$siteResource=jar:de.hybris.merchandise.initialdata.setup.InitialDataSystemSetup&/merchandiseinitialdata/import/contentCatalogs/$contentCatalog

# Language
$lang=en



# CMS Content

# Add Lightbox Banner for Mini Cart (banner is not localizable so we must create a separate banner per language)
INSERT_UPDATE Media;$contentCV[unique=true];code[unique=true];@media[translator=de.hybris.platform.impex.jalo.media.MediaDataTranslator];mime[default='image/jpeg'];&imageRef;folder(qualifier)[default='images'];altText

# CMS Mini Cart Component
UPDATE MiniCartComponent;$contentCV[unique=true];uid[unique=true];name;title[lang=$lang]

# CMS tabs components
UPDATE CMSTabParagraphComponent;$contentCV[unique=true];uid[unique=true];title[lang=$lang];content[lang=$lang]

# CMS Footer Component
UPDATE FooterComponent;$contentCV[unique=true];uid[unique=true];notice[lang=$lang]

# CMS Paragraph Component (Contact information)
UPDATE CMSParagraphComponent;$contentCV[unique=true];uid[unique=true];content[lang=$lang]

# CMS ProductReferences Components
UPDATE ProductReferencesComponent;$contentCV[unique=true];uid[unique=true];title[lang=$lang]

# Search Results Page #

UPDATE CMSParagraphComponent;$contentCV[unique=true];uid[unique=true];content[lang=$lang]

# Cart Page #
UPDATE CMSParagraphComponent;$contentCV[unique=true];uid[unique=true];content[lang=$lang]

# FAQ Page #

# CMS Paragraph Component (Contact information)
UPDATE CMSParagraphComponent;$contentCV[unique=true];uid[unique=true];content[lang=$lang];

# Terms and Conditions Page #

# CMS Paragraph Component (Contact information)
UPDATE CMSParagraphComponent;$contentCV[unique=true];uid[unique=true];content[lang=$lang];

# Navigation
# CMS Image Components
UPDATE SimpleBannerComponent;$contentCV[unique=true];uid[unique=true];$picture[lang=$lang]

# CMS Link Components
UPDATE CMSLinkComponent;$contentCV[unique=true];uid[unique=true];linkName[lang=$lang]

# CMS Navigation Nodes
UPDATE CMSNavigationNode;$contentCV[unique=true];uid[unique=true];title[lang=$lang]


# Categories

# Media
INSERT_UPDATE Media;$contentCV[unique=true];code[unique=true];@media[translator=de.hybris.platform.impex.jalo.media.MediaDataTranslator];mime[default='image/jpeg'];folder(qualifier)[default='images'];altText

# Category Pages
UPDATE CategoryPage;$contentCV[unique=true];uid[unique=true];title[lang=$lang]

UPDATE CategoryPage;$contentCV[unique=true];uid[unique=true];title[lang=$lang]

UPDATE CategoryFeatureComponent;$contentCV[unique=true];uid[unique=true];title[lang=$lang];description[lang=$lang];$picture[lang=$lang]


# Homepage banners

# Media
INSERT_UPDATE Media;$contentCV[unique=true];code[unique=true];@media[translator=de.hybris.platform.impex.jalo.media.MediaDataTranslator];mime[default='image/jpeg'];&imageRef;folder(qualifier)[default='images'];altText

UPDATE SimpleBannerComponent;$contentCV[unique=true];uid[unique=true];$picture[lang=$lang]

UPDATE SimpleBannerComponent;$contentCV[unique=true];uid[unique=true];$picture[lang=$lang]

UPDATE BannerComponent;$contentCV[unique=true];uid[unique=true];headline[lang=$lang];$picture[lang=$lang];content[lang=$lang]

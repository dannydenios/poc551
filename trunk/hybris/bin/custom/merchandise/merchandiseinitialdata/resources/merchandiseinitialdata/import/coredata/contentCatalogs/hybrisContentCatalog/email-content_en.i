#
# Import the CMS content for the site emails
#
$contentCatalog=__CONTENT_CATALOG_NAME__
$contentCV=catalogVersion(CatalogVersion.catalog(Catalog.id[default=$contentCatalog]),CatalogVersion.version[default=Staged])[default=$contentCatalog:Staged]

# Import config properties into impex macros
UPDATE GenericItem[processor=de.hybris.platform.commerceservices.impex.impl.ConfigPropertyImportProcessor];pk[unique=true]
$emailResource=$config-emailResourceValue

# Language
$lang=en

# CMS components and Email velocity templates
UPDATE RendererTemplate;code[unique=true];description[lang=$lang];templateScript[lang=$lang,translator=de.hybris.platform.commerceservices.impex.impl.FileLoaderValueTranslator]

# Email Pages
UPDATE EmailPage;$contentCV[unique=true];uid[unique=true];fromEmail[lang=$lang];fromName[lang=$lang]

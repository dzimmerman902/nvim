-- This project is a collection of definition files for the framework Luvit.
-- The definitions provide types for all modules currently shipped in Luvit, the classes, methods and their arguments and returns;
-- it does as well provide descriptions whereever possible, either by scraping the Luvit-docs, Nodejs docs, luv docs or manually written in some places.

-- Some of the definitions are scraped off of code/docs and then some manual work is done to figure types out.
-- For those the used scraper is located under scrapers, the script outputs to a file in the same directory.
-- From there it is manually copied over to the actual library definition.
-- Other definitions -and most of them- are completely manually written, as it was required to figure the logic out in order to figure the types.

return {
    'Bilal2453/luvit-meta',
    lazy = true,
}

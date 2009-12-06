package com.yakraud

class SearchController {

    def index = {
        def query = params.q

        if (!query) {
            return [:]
        }

        try {
            params.withHighlighter = {highlighter, index, sr ->
                // lazy-init the list of highlighted search results
                if (!sr.highlights) {
                    sr.highlights = []
                }

                // store highlighted text;
                // "description" is a searchable-property of the
                // Project domain class
                def matchedFragment = highlighter.fragment("description")
                sr.highlights[index] = "..." +
                (matchedFragment ?: "") + "..."
            }

            params.suggestQuery = true

            if (params.justMine) {
                query += " +username:${authenticateService.userDomain().username}"
            }
            def searchResult = Project.search(query, params)
            return [searchResult: searchResult]
        } catch(e) {
            return [searchError: true]
        }
    }

}

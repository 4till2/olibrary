module Olibrary
  module Search
    # Robust access to the Olibrary free-text search.
    #
    # A simple search is converted to a cross field query.
    # @example search("A brief history of time")
    #
    # You can add multiple requirements to a single parameter by including a comma within the string.
    # @example: search({subject: "Science, Physics"}) will find all books with both science AND physics as subjects)
    #
    # Likewise you can combine multiple parameters to refine your results
    # @example search({title:"A Brief History of Time", subject: "Science, Physics", author: "Stephen Hawking"})
    #
    # Possible search parameter keys include
    # :q (cross-field query)
    # :author
    # :publisher
    # :isbn
    # :title
    # :person
    # :place
    # :subject
    # @param limit defaults to 10 but can be set to any number or nil for all. OpenLibrary returns results in batches of 100 so a limit greater than that will make subsequent requests until the limit or end of results is reached. Be warned that high limits on broad queries will take considerable time and return large data sets.
    # @param offset is useful if you want to continue a search from a given offset.
    #
    # @return An array of documents matching the query with all attributes accessible via method calls. Additional convenience methods 'book' and 'authors' are procs for retrieving the full document for the book and authors respectively. Usage: results[0].book.call() => client.book(results[0]['cover_edition_key'])
    def search(search_params, limit = 10, offset = 0)
      processed_params = search_params.is_a?(String) ? { q: search_params } : search_params
      _search(processed_params, limit, offset)
    end

    private

    def _search(search_params, limit, offset)
      results = []
      loop do
        data = request('/search.json', params: search_params.merge({ limit: limit, offset: offset }))
        data['docs'].each do |result|
          result['book'] = -> { book(result['cover_edition_key']) }
          result['authors'] = -> { result['author_key'].map { |key| author(key) } }
          results << Hashie::Mash.new(result)
        end
        offset = data['offset'] + data['docs'].count
        break if offset >= data['numFound'] || results.count >= limit
      end
      results
    end

  end
end

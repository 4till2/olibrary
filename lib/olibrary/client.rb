require_relative 'request'
require_relative 'client/books'
require_relative 'client/authors'
require_relative 'client/history'
require_relative 'client/recent'
require_relative 'client/editions'
require_relative 'client/search'
require_relative 'client/login'
require_relative 'client/save'

module Olibrary
  class Client
    include Olibrary::Request
    include Olibrary::Books
    include Olibrary::Authors
    include Olibrary::History
    include Olibrary::Recent
    include Olibrary::Editions
    include Olibrary::Search
    include Olibrary::Login
    include Olibrary::Save

    # Initialize an Olibrary::Client instance
    #
    def initialize(options={})
      unless options.kind_of?(Hash)
        raise ArgumentError, "Options hash required."
      end
    end
  end
end

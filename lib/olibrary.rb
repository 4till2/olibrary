require_relative 'olibrary/version'
require_relative 'olibrary/data'
require_relative 'olibrary/view'
require_relative 'olibrary/client'
require_relative 'olibrary/errors'
require_relative 'olibrary/request'
require_relative 'olibrary/details'

module Olibrary
  # Create a new Olibrary::Client instance
  # 
  def self.new(options={})
    Olibrary::Client.new(options)
  end

  # Return the openlibrary gem version
  #
  def self.version
    "Olibrary version #{Olibrary::VERSION}"
  end
end

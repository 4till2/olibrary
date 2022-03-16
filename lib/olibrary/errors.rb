module Olibrary
  class Error         < StandardError; end
  class Unauthorized  < Error; end
  class NotFound      < Error; end
  class Redirect      < Error; end
end

# frozen_string_literal: true

module SearchEngine
  # Search enginer class
  class TagsSearch
    attr_accessor :term
    class << self
      def find_tags(term)
        Quote.where(:tags.in => [term])
      end
    end
  end
end

# frozen_string_literal: true

module SearchEngine
  class TagsSearch
    attr_accessor :term
    class << self
      def find_tags(params = {})
        @term = params[:term]
        Quote.where(:tags.in => [@term.to_s])
      end
    end
  end
end

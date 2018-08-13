# frozen_string_literal: true

module Api
  module V1
    # Default serializer to quote
    class QuoteSerializer < ActiveModel::Serializer
      attributes :quote, :author, :author_about, :tags
    end
  end
end

# frozen_string_literal: true

module Api
  module V1
    # Quotes controller
    class QuotesController < ApplicationController
      def index
        qoutes = SearchEngine::TagsSearch.find_tags(params[:tag])
        render json: qoutes, each_serializer: Api::V1::QuoteSerializer
      end
    end
  end
end

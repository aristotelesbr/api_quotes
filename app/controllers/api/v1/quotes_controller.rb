# frozen_string_literal: true

module Api
  module V1
    # Quotes controller
    class QuotesController < BaseController
      before_action :authenticate_with_token!

      def index
        qoutes = SearchEngine::TagsSearch.find_tags(params[:tag])
        render json: qoutes
      end
    end
  end
end

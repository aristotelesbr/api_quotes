# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Quote API', type: :request do
  let(:headers) do
    {
      'Content-Type' => 'application/json'
    }
  end

  describe 'GET api/v1/quotes' do
    context 'when filter params is send' do
      let!(:first_quote) { create(:quote, tags: %w[dev ror]) }
      let!(:second_quote) { create(:quote, tags: %w[dev mongoDb JS]) }
      let!(:last_quote) { create(:quote, tags: %w[vue elixir]) }

      before do
        get '/api/v1/quotes?tag=dev', params: {}, headers: headers
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns only the quotes matching' do
        returned_quotes_quotes = json_body[:quotes].map { |k, _v| k[:quote] }

        expect(returned_quotes_quotes).to eq(
          [first_quote.quote, second_quote.quote]
        )
      end
    end
  end
end

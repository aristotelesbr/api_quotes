# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Authenticable API', type: :request do
  TOKEN = 'mysecret'
  describe 'GET /quotes' do
    context 'when the valid token' do
      let!(:quote) { create(:quote, tags: %w[dev ror]) }
      let!(:last_quote) { create(:quote, tags: %w[vue elixir]) }
      let(:headers) do
        {
          'Content-Type' => 'application/json',
          'Authorization' => 'Token ' + TOKEN
        }
      end
      before do
        get '/api/v1/quotes?tag=dev', params: {}, headers: headers
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the json data for the quotes for search' do
        expect(json_body[:quotes].first[:author]).to eq(quote.author)
      end
    end

    context 'when the credentials are incorrect' do
      let!(:quote) { create(:quote, tags: %w[dev ror]) }
      let!(:last_quote) { create(:quote, tags: %w[vue elixir]) }
      let(:headers) do
        {
          'Content-Type' => 'application/json'
        }
      end
      before do
        get '/api/v1/quotes?tag=dev', params: {}, headers: headers
      end

      it 'returns status code 401' do
        expect(response).to have_http_status(401)
      end

      it 'returns the json data for the errors' do
        expect(response.body).to match(/HTTP Token: Access denied./)
      end
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SearchEngine::TagsSearch do
  describe '.find_tags' do
    context 'when valid params' do
      let!(:quote) {create(:quote, tags: ['dev', 'ror', 'fullstack'])}

      it { expect(Quote.where(:tags.in => ['dev']).count).to eq(1) }

      it 'returns valid result' do
        results = Quote.where(:tags.in => ['ror']).to_a
        expect(results.first[:id]).to eq(quote.id)
      end
    end

    context 'when invalid params' do
      let!(:quote) {create(:quote, tags: ['dev', 'ror', 'fullstack'])}

      it { expect(Quote.where(:tags.in => ['unexist tag']).count).to eq(0) }

      it 'returns invalid result' do
        results = Quote.where(:tags.in => ['unexist tag']).to_a
        expect(results.first).to_not eq(quote.id)
      end
    end
  end
end

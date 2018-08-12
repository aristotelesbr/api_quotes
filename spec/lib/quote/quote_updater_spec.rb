# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/quote/quote_parser.rb"
require "#{Rails.root}/lib/quote/quote_updater.rb"

RSpec.describe QuoteUpdater, type: :model do
  describe '.update_quotes' do
    context 'when valid data' do
      before do
        html_page = Nokogiri::HTML(open(Rails.root + 'spec/support/quotes_to_scrape.html')).css('.row')
        @parsed = QuoteParser.parse_quote(html_page)
      end

      it 'Persist qoutes' do
        before_count = Quote.count
        QuoteUpdater.new(@parsed).update_quotes!
        expect(Quote.count).not_to eq(before_count)
      end
    end

    context 'when invalid data' do
      before do
        html_page = Nokogiri::HTML(open(Rails.root + 'spec/support/quotes_to_scrape.html')).css('.row')
        @new_content = { content: QuoteParser.parse_quote(html_page) }
      end

      it 'with invalid object' do
        expect(@new_content.class).not_to eq(Array)
      end
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/quote/quote_parser.rb"

RSpec.describe QuoteParser, type: :model do
  describe '.parse_quote' do
    context 'when valid data' do
      before do
        html_page = Nokogiri::HTML(open(Rails.root + 'spec/support/quotes_to_scrape.html')).css('.row')
        @content = QuoteParser.parse_quote(html_page)
      end

      it 'with valid object' do
        expect(@content.class).to eq(Array)
      end

      it 'returns required keys' do
        expect(@content[0]).to include({
          author: 'Albert Einstein',
          author_about: 'http://quotes.toscrape.comhttp://quotes.toscrape.com/author/Albert-Einstein',
          quote: '“The world as we have created it is a process of our thinking. It cannot be changed without changing our thinking.”'
        })  
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

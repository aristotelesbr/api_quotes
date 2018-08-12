# frozen_string_literal: true

require "#{Rails.root}/lib/quote/base_collector.rb"
require "#{Rails.root}/lib/quote/quote_parser.rb"
require "#{Rails.root}/lib/quote/quote_updater.rb"

class QuoteCollector < BaseCollector
  # Makes a request, sanatize and saves
  def collect_data
    url = 'http://quotes.toscrape.com'
    content = self.fetch(url).css('.row')
    quote_list = QuoteParser.parse_quote(content)
    QuoteUpdater.new(quote_list).update_quotes!
  end
end

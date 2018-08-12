require "#{Rails.root}/lib/quote/quote_collector.rb"

namespace :crawler do
  desc 'Download quotes from http://quotes.toscrape.com/'
  task run: :environment do
    puts 'Initialize database'
    quote_collector = QuoteCollector.new
    quote_collector.collect_data
  end
end

# frozen_string_literal: true

class QuoteParser
  attr_accessor :content
  class << self
    def parse_quote(content)
      prepare(content)
    end

    def prepare(quotes)
      quotes.css('div.quote').map do |quote|
        {
          quote:            quote.css('span.text').text,
          author:           quote.css('small.author').text,
          author_about:     'http://quotes.toscrape.com' + quote.css('a')[0]['href'],
          tags:             [quote.css('meta')[0]['content']]
        }
      end
    end
  end
end

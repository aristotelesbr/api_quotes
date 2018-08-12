# frozen_string_literal: true

class QuoteUpdater
  attr_reader :quote_list

  def initialize(quote_list)
    @quote_list = quote_list
  end

  def update_quotes!
    unless @quote_list.empty?
      quote_list.each do |q|
        Quote.create(
          quote: q[:quote],
          author: q[:author],
          author_about: q[:author_about],
          tags: q[:tags]
        )
      end
    end
  end
end

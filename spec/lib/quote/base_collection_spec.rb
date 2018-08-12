# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Base Collection' do
  
  describe '#fetch' do
    context 'when valid page' do
      before do
        @html_page = Nokogiri::HTML(open(Rails.root + 'spec/support/quotes_to_scrape.html')).css('.row')
      end
      it { expect(@html_page.css('.quote')[0]['class']).to eq('quote') }
      it { expect(@html_page.css('span.text')[0]['class']).to eq('text') }
      it { expect(@html_page.css('small.author')[0]['class']).to eq('author') }
      it { expect(@html_page.css('meta')[0].attributes.present?).to be_truthy }

      it 'returns text quote div' do
        expect(@html_page.css('div.quote')[0].css('.text').text).to eq("“The world as we have created it is a process of our thinking. It cannot be changed without changing our thinking.”")
      end
    end

    context 'when invalid page' do
      before do
        @invalid_html_page = Nokogiri::HTML(open(Rails.root + 'spec/support/another.html')).css('.row')
      end

      it { expect(@invalid_html_page.css('.quote')[0].present?).to be_falsey }
      it { expect(@invalid_html_page.css('span.text')[0].present?).to be_falsey }
      it { expect(@invalid_html_page.css('small')[0]).not_to be_falsey }
      it { expect(@invalid_html_page.css('meta')[0]).not_to be_falsey }
    end
  end
end

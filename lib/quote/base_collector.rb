require 'open-uri'

class BaseCollector
  def fetch(uri_str, limit = 10)
    begin
    page_response = Nokogiri::HTML(open(uri_str))
    rescue RestClient::ResourceNotFound => error
      @retries ||= 0
      if @retries < @max_retries
        @retries += 1
        retry
      else
        raise error
      end
    end
    page_response
  end
end

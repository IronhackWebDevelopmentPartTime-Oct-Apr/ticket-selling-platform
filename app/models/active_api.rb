class ActiveApi
  API_URL = "https://api.seatgeek.com/2"
  REQUEST_DEFAULTS = { :parse? => false }

  def self.uri(path = '')
    url_string = "#{API_URL}/#{self.endpoint}/#{path}"
    # byebug
    return URI.parse(url_string)
  end

  def self.request(path = '', given_options = {})
    options = REQUEST_DEFAULTS.merge(given_options)

    uri = self.uri(path)
    response = Net::HTTP.get_response(uri)
    body = response.body

    if options[:parse?]
      body = JSON.parse(body)
    end

    return body
  end

  def self.all
    self.request
  end

  def self.find(id)
    self.request(id)
  end

  def self.find_by(query_hash)
    self.request("?#{query_hash.keys.first}=#{query_hash.values.first}")
  end
end

class Venue < ActiveApi
  def self.endpoint
    "venues"
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

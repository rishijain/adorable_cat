require "adorable_cat/version"
require "rest-client"
require "json"

module AdorableCat

  def self.get_cat_data
    begin
      generate_fact
    rescue Exception => e
      "error message .. miaooo"
    end
  end


  private
  
  def self.generate_fact
    parse_response(RestClient.get "http://catfacts-api.appspot.com/api/facts", {:params => {:number => 1}})["facts"].first
  end

  def self.generate_image
  end

  def self.parse_response(fact)
    JSON.parse(fact)
  end
end

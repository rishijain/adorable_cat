require "adorable_cat/version"
require "rest-client"
require "json"
require "nokogiri"

module AdorableCat

  def self.get_cat_data
    begin
      [generate_fact, generate_image]
    rescue Exception => e
      "error message .. miaooo"
      ["Cats not so adorable", "http://3.bp.blogspot.com/_p1qvL_zJG4E/RjQKSX1rTrI/AAAAAAAAAAg/hexhfYgvyJM/s1600-h/cat%2Bwith%2Bfalse%2Bteeth.gif"]
    end
  end


  private
  
  def self.generate_fact
    parse_fact_response(RestClient.get "http://catfacts-api.appspot.com/api/facts", {:params => {:number => 1}})["facts"].first
  end

  def self.generate_image
    noko_ele = Nokogiri::HTML(RestClient.get "http://thecatapi.com/api/images/get", {:params => {:format => "html"}})
    parse_image_response noko_ele
  end

  def self.parse_fact_response(fact)
    JSON.parse(fact)
  end

  def self.parse_image_response(nokogiri_object)
    nokogiri_object.root.children.children.children.first.attributes["src"].value
  end
end

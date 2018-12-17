require 'httparty'
require 'nokogiri'
require 'pry'

class Scraper

  attr_accessor :parse_page 

  def initialize
    doc = HTTParty.get("https://www.nasdaq.com/")
    @parse_page ||= Nokogiri::HTML(doc)
    binding.pry
  end 

  def get_index_names
    item_container.css("b").children.map { |index_name| index_name.text }.compact
    # item_container.css(".name").css("a").children.map { |index_name| index_name.text }.compact
  end 

  # def get_index_data
  #   item_container.css(".push-data").css("span").children.map { |index_data| index_data.data-animation }.compact
  # end 


  # private   

  def item_container
    parse_page.css(".grid-item-info")
  end  
  # private since this contains information that will only be used within the class...

  scraper = Scraper.new
  index_names = scraper.get_index_names
  # data = scraper.get_index_data

  (0...index_names.size).each do |index|
    puts "--INDEX NAME--#{index_names[index]} | "
    # --VALUE-- #{data[index]}" 
  end 







end 
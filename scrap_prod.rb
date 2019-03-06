require 'watir'

require 'csv'
require 'json'


json = File.read("db.json")
@all_product = JSON.parse(json)


def go
  a = 0
  @all_product.each do |f|
    puts a 
    if f.size == 1
      @browser.goto f["url"] 
      sleep(10)
      f["title"] = @browser.span(id: "productTitle").text
      
      # f["asin"] = @browser.
      f["image"] = @browser.div(id: "imgTagWrapperId").img.src
      image 
      f["price"] = @price
    end
    filejson = File.open("db.json", "w")
    filejson.write(@all_product.to_json)
    filejson.close
    # binding.pry
    a += 1
  end
end

def image
  @price = @browser.tr(id: "priceblock_ourprice_row").text
rescue
  @price = "none"
end


def perform
  @browser = Watir::Browser.new(:firefox)
  go
end

perform




puts "hello"
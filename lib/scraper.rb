require 'nokogiri'
require 'open-uri'


def scraper

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

all_acronyms = page.xpath('//td[@class="text-left col-symbol"]')
all_prices = page.xpath('//a[@class="price"]')

all_acronyms_array = []
all_prices_array = []
 
all_acronyms.each do |acronyms|
	all_acronyms_array << acronyms.text
			# print all_acronyms_array
  end

all_prices.each do |prices|
	all_prices_array << prices.text.delete('$').to_f
			# print all_prices_array
	end

zipped = all_acronyms_array.zip(all_prices_array).map{|k, v| { k => v }}

return zipped

end

# scraper


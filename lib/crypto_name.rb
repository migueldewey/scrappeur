require "rubygems"
require "nokogiri"
require "open-uri"

PAGE_URL = "https://coinmarketcap.com/all/views/all/"
#puts page.class # => Nokogiri::HTML::Document

def crypto_scrapper
	page = Nokogiri::HTML(open(PAGE_URL)) 
	a =[]
	for i in 1..200
	all_crypto = page.xpath("/html/body/div/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[#{i}]/td[3]")
	all_prices = page.xpath("/html/body/div/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[#{i}]/td[5]")
	hash ={}
	hash[all_crypto.text] =all_prices.text
	a[i-1]= hash
	end
	return a
end

#page.css('div#content div#bodyContent table.infobox tr th').each do |el|
#   puts el.text
#end
require "rubygems"
require "nokogiri"
require "open-uri"
require "pry"
PAGE_URL_anuaire = "http://annuaire-des-mairies.com"

def get_townhall_email(urls)
	a =[]
	urls.each do |link|
	page = Nokogiri::HTML(open(link["href"]))
	email = page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]")
	town = page.xpath("/html/body/div/main/section[1]/div/div/div/h1")
	hash = {}
	hash[town.text] = email.text
	a << hash
	end
	return a
end

def get_townhall_url#(urls_dep)
	#urls_dep.each do |link|
	#	puts link.text
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	urls = page.css("a[class = lientxt]") #.select{|link| link["class"] == "lientxt"}
	urls.each do |link|
		#if link["href"].slice(0) == "."
		link["href"] = link["href"].sub(".","")
		#link["href"] = link["href"].sub("/","")
		#end
	link["href"] = PAGE_URL_anuaire + link["href"]
	#end
end
	return urls
end
def get_departement
	page = Nokogiri::HTML(open(PAGE_URL_anuaire))
	urls_dep = page.css("a[class = lientxt]")
	urls_dep.each do |link|
	link["href"] = PAGE_URL_anuaire + link["href"]
	end
	return urls_dep
end
a = get_townhall_url
b = get_townhall_email(a)
puts b


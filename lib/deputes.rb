require "rubygems"
require "nokogiri"
require "open-uri"
require "pry"

PAGE_DEPUTES = "http://www2.assemblee-nationale.fr"
Cedric = "http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA722260"

def depute(link)
	page = Nokogiri::HTML(open(link))
	hash = {}
	depute = page.xpath('//*[@id="haut-contenu-page"]/article/div[2]/h1')
	email = page.xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li[2]/a')
	hash["first_name"] = depute.text.split[1]
	hash["last_name"] = depute.text.split[2]
	hash["email"] = email.text	
	return hash
end
def fiche
	page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
	fiches = page.css("#deputes-list li a")
	fiches.each do |link|
	link["href"] = PAGE_DEPUTES + link["href"]
	end
	return fiches
end
def perform(fiches)
	a = []
	fiches.each do |link|
		a << depute(link["href"])
	end
return a
end


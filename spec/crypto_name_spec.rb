require_relative "../lib/crypto_name"

describe "crypto_scrapper" do 
	it "Retun an array of a hashes with a crypto from coinmarketcap" do
		a = crypto_scrapper
		expect(a[0].include? "BTC").to eq(true)
		expect(a[1].include? "ETH").to eq(true)
	end

	it "Retun also the price" do 
		a = crypto_scrapper
		expect(a[0]["BTC"]).not_to be_nil
	end

	it "makes with 200 cryptocurrencies" do 
		a = crypto_scrapper
		expect(a.size).to eq(200)
	end
end
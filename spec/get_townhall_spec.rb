require_relative "../lib/get_townhall"
descibe "get_townhall_url" do 
	it "finds a url of a townhall" do 
		a = get_townhall_url["href"]
		avernes = "http://annuaire-des-mairies.com/95/avernes.html"
		expect(a.include? avernes).to eq (true)
	end
end

descibe "get_townhall_email" do 
	it "finds a email of a townhall in the url" do
	a = get_townhall_url
	s = get_townhall_email(a)
	expect(s[0]["town"]).to eq("ABLEIGNES - 95450 ")
	expect(s[0].["email"]).to eq("mairie.ableignes95@wanadoo.fr")
	end
end
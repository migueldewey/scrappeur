require_relative "../lib/deputes"

describe "deputes" do 
	describe "depute" do
		it "finds the first_name, last_name and email for a depute" do
		Cedric = "http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA722260"
		a = depute(Cedric)
		expect(a["first_name"]).to eq("Cédric")
		expect(a["last_name"]).to eq("Villani")
		expect(a["email"]).to eq("cedric.villani@assemblee-nationale.fr")
		end
	end

	describe "fiche" do 
		it "finds all 577 members of the national assembly" do
			s = fiche
			expect(s.text.include? "M. Cédric Villani").to eq(true)
			expect(s.size).to eq(577)
		end
	end
end 

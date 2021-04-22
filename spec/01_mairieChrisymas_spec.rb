require_relative '../lib/01_mairie.rb'

describe "#methode_get_townhall" do
  it "Retournee une tableau" do
    expect(get_townhall_email("http://www.annuaire-des-mairies.com/95/ableiges.html")).to be_instance_of Array
  end
  it "Valeur null inacceptable" do 
  	expect(get_townhall_email("http://www.annuaire-des-mairies.com/95/ableiges.html")).not_to be_nil
  end

end
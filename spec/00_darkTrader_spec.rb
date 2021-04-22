require_relative '../lib/00_darkTrader.rb'

describe "dark trader" do
  it "Retourner un tableau" do
    expect(crypto).to be_instance_of Array
  end
  it "Valeur null inacceptable" do 
  	expect(crypto).not_to be_nil
  end

end
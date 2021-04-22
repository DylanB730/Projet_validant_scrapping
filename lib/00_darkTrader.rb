require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'


def crypto
	puts "Liste des cryptomonnaies"
	puts " "
	page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

	crypto_symbol = page.xpath('//*[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__symbol"]')

	prix = page.xpath('//*[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"]')

	tableau_symbole = [] 
	tableau_prix = [] 
	valeur = [] 
	
	for symbole in crypto_symbol do
		prix.size.times do |i|
			tableau_prix.push(prix[i].text)
		end
		tableau_symbole.push(symbole.text)
	end
	
	tableau_symbole.each_with_index do |k, v|	
		valeur.push({"#{k}" => "#{(tableau_prix)[v]}"}) 
	end

	return valeur

end

puts crypto
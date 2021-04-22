require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'


def web
	pg = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
	return pg
end


def get_townhall_email(townhall_url)
	page = Nokogiri::HTML(URI.open(townhall_url)) 

	tableau_email = []

	email = page.xpath('//*[contains(text(), "@")]').text
	ville = page.xpath('//*[contains(text(), "Adresse mairie de")]').text.split 

	tableau_email.push({ville[3] => email})  
	
	puts tableau_email
	return tableau_email
end


def get_townhall_urls
	page = web
	tableau_url = []

	urls = page.xpath('//*[@class="lientxt"]/@href') 

	for url in urls do
		
		url = "http://annuaire-des-mairies.com" + url.text[1..-1]
		tableau_url.push(url)	
	end

	return tableau_url 
end


def scrapp_data
	puts "Liste des adresse email des mairie de la ville de Val-d-oise".upcase
	puts "\n"
	tableau_url = get_townhall_urls
	
	for townhall_url in tableau_url do
		get_townhall_email(townhall_url)
	end
end 


scrapp_data
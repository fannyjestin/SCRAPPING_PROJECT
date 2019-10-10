require 'rubygems'

require 'nokogiri'

require 'open-uri'

#scrapper une page de web


# => Nokogiri::HTML::Document

#if the doc is remoted you have to put require 'open-uri'

#possibilité de mettre en évidence le CSS

def crypto_names

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

keys = page.xpath('//td[contains(@class,"currency-name")]//a[@class="link-secondary"]')
	 	#all_crypto_name = un array	
	return keys

end



def crypto_values

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

values = page.xpath('//td[contains(@class, "no-wrap text-right")]//a[contains(@href,"/currencies/")]')

	return values
	
end



def perform

keys = crypto_names
values = crypto_values


#pour extraire le texte de l'array :
	crypto_hash = [] 

	for a in 0..keys.length-1 do
		crypto_hash[a] = Hash.new
		crypto_hash[a][keys[a].text]=values[a].text
	end

	puts crypto_hash

	return crypto_hash

end 
		
perform 



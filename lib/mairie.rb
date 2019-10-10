require 'rubygems'

require 'nokogiri'

require 'open-uri'

#scrapper une page de web


# => Nokogiri::HTML::Document

#if the doc is remoted you have to put require 'open-uri'

#possibilité de mettre en évidence le CSS



def get_townhall_urls
	specific_url = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html")).xpath('//a[@class="lientxt"]/@href')  
	 	#PAGE DE CHAQUE MAIRIE DANS LE TABLEAU PAGE

	townhall_url = specific_url.map {|x|
			"https://www.annuaire-des-mairies.com" + x.text[1..-1]
			}

	return townhall_url
end




def get_townhall_email(townhall_url)

#important de mettre si l'URL est nil ou empty
	return nil if townhall_url.nil? || townhall_url.empty?


city_name = []
#array des noms de ville
	for x in 0..townhall_url.size-1 do
	city_name[x] = townhall_url[x][40..-6]
	end 


	list_mail = townhall_url.map{ |x|
			Nokogiri::HTML(open(x)).xpath('//*[contains(text(), "@")]')
				}
#array des mails
	 
	mail_hash = []

	city_name.each_with_index {|value, index| 

						        mail_hash[index] =Hash.new	              	 
						        mail_hash[index][city_name[index]]=list_mail[index].text
						      }

	puts mail_hash

	if mail_hash.empty?

		then puts "Pas de mail"
	end

end



def perform
	townhall_url = get_townhall_urls
	get_townhall_email(townhall_url)
end

perform




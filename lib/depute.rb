require 'rubygems'

require 'nokogiri'

require 'open-uri'

#scrapper une page de web


# => Nokogiri::HTML::Document

#if the doc is remoted you have to put require 'open-uri'

#possibilité de mettre en évidence le CSS



def get_deputes_urls
	specific_url = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique")).xpath('//a[contains(@href,"/deputes/fiche/OMC")]/@href')  
	 	#PAGE DE CHAQUE MAIRIE DANS LE TABLEAU PAGE

	depute_url = specific_url.map {|x|
			"http://www2.assemblee-nationale.fr" + x.text
			}
	return depute_url
end



def get_deputes_info

depute_url = get_deputes_urls

#important de mettre si l'URL est nil ou empty
	return nil if depute_url.nil? || depute_url.empty?


depute_name = depute_url.map{|x|
			Nokogiri::HTML(open(x)).xpath('//div[@class="titre-bandeau-bleu clearfix"]/h1/text()')
			}
#array des noms

depute_mail = depute_url.map{|x|
			Nokogiri::HTML(open(x)).xpath("//a[contains(text(), '@')]")
			}
#array des noms


puts depute_mail

end

get_deputes_info






require 'nokogiri'
require 'open-uri'

def get_townhall_email(townhall_url)
	page = Nokogiri::HTML(open(townhall_url))
	townhall_email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
	return townhall_email
end

# MAIRIE_GROSLAY = 'https://www.annuaire-des-mairies.com/95/groslay.html'
# get_townhall_email(MAIRIE_GROSLAY)

def get_townhall_name(townhall_url)
	page = Nokogiri::HTML(open(townhall_url))
	townhall_name = page.xpath("//title").text[/ - Commune de (.*?) -/, 1]
	#Ci-dessus je fais un regex pour ne garder que ce qui m'intéresse dans le title
	return townhall_name
end

# MAIRIE_GROSLAY = 'https://www.annuaire-des-mairies.com/95/groslay.html'
# get_townhall_name(MAIRIE_GROSLAY)

def get_townhall_urls(townhall_url)
	page = Nokogiri::HTML(open(townhall_url))
	townhall_sites = page.xpath("//a[@class='lientxt']/@href").map { |partial_link| 'http://annuaire-des-mairies.com' + partial_link.text[1..-1]}
	#ici avec le .map j'appelle une fonction spécifique sur chacune des entrées de mon array avec d'avoi une url complète et le [1..-1] permet de virer un point récalcitrant
	return townhall_sites
end

# MAIRIES_OISE = 'https://www.annuaire-des-mairies.com/val-d-oise.html'
# puts get_townhall_urls(MAIRIES_OISE)
# puts get_townhall_urls(MAIRIES_OISE).length

def merge_townhall_infos(townhall_url)
	townhall_websites = get_townhall_urls(townhall_url)
	townhall_emails = Array.new
	townhall_websites.each do |city_url|
    townhall_emails << {get_townhall_name(city_url) => get_townhall_email(city_url)}
  end
  return townhall_emails
end

def perform
	sites_web = 'http://annuaire-des-mairies.com/val-d-oise.html'
	return merge_townhall_infos(sites_web)
	# puts merge_townhall_infos(sites_web)
end

puts perform


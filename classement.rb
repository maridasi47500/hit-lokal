require 'nokogiri'
require 'open-uri'
require 'date'

# Définir la semaine actuelle dynamiquement
current_week = Date.today.strftime("%V").to_i - 2 # Obtenir la semaine en cours
if current_week == 0
  current_week = Date.new(Date.today.year - 1, 12, 31).strftime("%V").to_i - 1
end

url = "https://snepmusique.com/classement-radio-outre-mer/?semaine=#{current_week}&annee=#{Date.today.year}"
p url
html = URI.open(url)
doc = Nokogiri::HTML(html)

# Vérifier la date actuelle
today = Date.today
puts "Date actuelle : #{today}, Semaine #{current_week}"

doc.css('.item').each do |item|
  rank = item.css('.rang').text.strip
  title = item.css('.titre').text.strip
  artist = item.css('.artiste').text.strip

  puts "#{rank}: #{title} by #{artist}"
end


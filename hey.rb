# scraper.rb
require 'nokogiri'
require 'open-uri'
require 'active_record'
require 'sqlite3'


# Logique du Scraper
(2024).downto(2014).each do |year|
  p year
  (1..57).each do |week|
    url = "https://snepmusique.com/classement-radio-outre-mer/?semaine=#{week}&annee=#{year}"
    begin
      html = URI.open(url, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE)
      doc = Nokogiri::HTML(html)

      doc.css('.items .item').each do |item|
        title = item.css('.titre').text.strip
        artist = item.css('.artiste').text.strip
        chanson = Chanson.find_or_create_by(title: title, artist: artist)
        ok = { "chanson": chanson, "semaine_no": week, "annee": year }
        p ok
      end
    rescue OpenURI::HTTPError => e
      puts "Erreur en ouvrant l'URL: #{e.message}"
    end
  end
end


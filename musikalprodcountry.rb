require 'watir'
require 'cgi'
require 'nokogiri'
require 'nokogiri'
require 'open-uri'
require 'mechanize'
require 'certifi'
require 'selenium-webdriver'
require 'i18n'

agent = Mechanize.new



class MaproductionmusicaleLabel
  SEARCH_URL = "https://www.bing.com/search?q="
  LOCATIONS = [ARGV[0]]
  PLATFORMS = [ARGV[1]]
  METIERS_FR = [
    "Composé",
    "Réalisé",
    "Mixé",
    "Producteur exécutif", 
    "Producteur", 
    "Réalisateur", 
    "Réalisations",
    "Auteurs",
    "Compositeur",
    "Production",
    "Editions",
  "Réalisation Clip ","Réalisation Musicale",
  "Maquillage",
  "Coiffure",
  "Assistante",
  "Record","Programmation","Mix"," Montage"," Etalonnage",
  "Pianiste / Autrice",
  "Compositeur.e.s",
  "Production / Editions",
    "Scénariste", 
    "Directeur de production", 
    "Assistant réalisateur",
    "Lumière", 
    "Lumière/Électro", 
    "Maquilleur", 
    "Assistant maquillage", 
    "Coiffeur", 
    "Ongles", 

    "Enregistrement",
    "Mixage",
    "Danseuses",
    "Auteur Compositeur", "Auteur", "Compositeur", "Mix/Mastering", "Prise de voix", "Production", "Réalisation", "Cadrage", "Étalonnage", "Aide technique"

  ].uniq
  METIERS_FR = [
    "Réalisateur", "Scénariste", "Créateur de Moodboard", "Scénographe", "Conception Artistique", "Monteur",
    "Directeur de la Photographie", "Opérateur de Caméra", "Assistant Caméra", "Monteur de Bande-Son", "Coloriste",
    "Artiste Vocal", "Violoniste", "Arrangeur", "Compositeur", "Producteur Musical", "Ingénieur du Mixage",
    "Ingénieur du Mastering", "Studio d'Enregistrement", "Responsable Artistique/Commercial", "Responsable Administratif/Financier",
    "Producteur Exécutif", "Assistant de Production", "Marketeur Digital", "Stratégiste en Médias Numériques",
    "Gestionnaire des Médias Sociaux", "Chorégraphe", "Danseur", "Conseiller en Image et Presse", "Maquilleur",
    "Coiffeur", "Styliste Ongulaire", "Directeur de Costume", "Directeur de Caractérisation", "Styliste",
    "Créateur de Costumes", "Photographe", "Designer de Couverture", "Assistant Photographe", "Vidéo Making-Of",
    "Producteur", "Gestionnaire Stratégique", "Distributeur"
  ]

    #"steadycameur",
    #"Stylisme Mannequins", 
#"Guitares",
  #random_number = rand(1..METIERS_FR.length)

  #random_elements = METIERS_FR.sample(random_number) # Picks 2 random elements
  MY_JOBS = METIERS_FR.sample(3) # Picks 2 random elements




  def initialize

    agent = Mechanize.new

    @browser = Selenium::WebDriver.for :firefox # Ensure you have Firefox installed or change to another browser



    @labels = []
  end

  def scrape


    LOCATIONS.each do |location|
      PLATFORMS.each do |platform|
        query = "production music video #{location} #{platform} #{MY_JOBS.join(" ").split(" ").map {|z| "inbody:#{z}"}.join(" ")}"
        scrape_pages(query, location)
      end
    end
    @browser.quit
    @labels
  rescue => e
    @browser.quit
    @labels
  end

  private

  def scrape_pages(query, location, max_pages = 10)
    page = 1
    while page <= max_pages
      search_url = SEARCH_URL + CGI.escape(query) + "&first=#{(page - 1) * 10 + 1}"
      @browser.navigate.to search_url
    
      # Wait until the page title contains the search query
      wait = Selenium::WebDriver::Wait.new(timeout: 10)

      wait.until { @browser.title.include?(query) }


      sleep 2 # Allow page to load

      html = @browser.page_source

      parse_results(html, location)

      break unless next_page_exists?
      page += 1
    end
  end


  def parse_results(html, location)
    doc = Nokogiri::HTML(html)
    doc.css('li.b_algo').each do |link1|
      xx=link1.css(".b_tpcn").text

      next unless xx.to_s.downcase.match?(/instagram|facebook|youtube/)
      link=link1.css("h2 a")[0]
      name = link.text
      #p name
      url = link['href']
  
      # Ensure it's a direct link (avoiding Bing redirects)
      #next unless url.match?(/instagram\.com|facebook\.com|youtube\.com/)



      #url = decode_bing_redirect(url)

      #p url


  
      existing_label = @labels.find { |l| l[:name] == name }
  
      if existing_label
        existing_label[:accounts] << url unless existing_label[:accounts].include?(url)
      else
        @labels << { name: name, country: location, accounts: [url] }
      end
    end
  end
  
  def decode_bing_redirect(url)
    return url unless url.include?("bing.com/ck/a?!")
    
    # Extract actual target link from the Bing redirection pattern
    match = url.match(/u=a1aHR0c(.+?)&ntb=1/)
    return url unless match
  
    decoded_url = "https://" + match[1]
    decoded_url.gsub('%3A', ':').gsub('%2F', '/')
  end


  def next_page_exists?
    @browser.find_element(:css, 'a.sb_pagN') rescue nil
  end


end

# Usage
scraper = MaproductionmusicaleLabel.new
results = scraper.scrape
#puts results




puts JSON.pretty_generate({"musicalprods" =>results})


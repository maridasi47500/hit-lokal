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
  LOCATIONS = ["Martinique", "Guadeloupe", "Guyane", "Mayotte", "La Réunion"]
  PLATFORMS = ["Instagram", "Facebook", "YouTube"]

  def initialize

    agent = Mechanize.new

    @browser = Selenium::WebDriver.for :firefox # Ensure you have Firefox installed or change to another browser



    @labels = []
  end

  def scrape

    LOCATIONS.each do |location|
      PLATFORMS.each do |platform|
        query = "musical production label #{location} #{platform}"
        scrape_pages(query, location)
      end
    end
    @browser.quit
    @labels
  rescue
    @browser.quit
    @labels
  end

  private

  def scrape_pages(query, location, max_pages = 5)
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
    doc.css('li.b_algo h2 a').each do |link|
      name = link.text
      #p name
      url = link['href']
  
      # Ensure it's a direct link (avoiding Bing redirects)
      #next unless url.match?(/instagram\.com|facebook\.com|youtube\.com/)
      next unless name.downcase.match?(/instagram|facebook|youtube/)


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


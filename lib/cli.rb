class CLI 
  
    def run 
      self.greeting
      Scraper.scrape_bars
    end 
  
    def greeting 
      puts "\nAloha! Welcome to the World's 15 Most Important Tiki Bars!\n\n"
    end
  
end 
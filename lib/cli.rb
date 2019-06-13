class CLI 
  
    def run 
        self.greeting
        Scraper.scrape_bars
        list_tiki_bars
        
    end 
  
    def greeting 
        puts "\nAloha! Welcome to the World's 15 Most Important Tiki Bars!\n\n"
    end
    
    def list_tiki_bars
        puts "The following is an unranked list:"
        Bar.all.each.with_index(1) { |b, i| puts "#{i}. #{b.name}" }
    end
    
    def menu
        puts "Please enter the number of the bar you'd like to read more about:"
        index = gets.strip.to_i - 1
        bar = Bar.all[index]
    end 
  
end 
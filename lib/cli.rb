class CLI 

  def run 
    self.greeting
    Scraper.scrape_bars
    menu
  end 
  
  def greeting 
    puts "\nAloha! Welcome to the World's 15 Most Important Tiki Bars!\n\n"
  end
  
  def menu
    puts "To continue enter 'y' or 'exit' to leave"
    input = gets.strip.downcase
    case input 
    when 'exit'
      goodbye
      return
    when 'y'
      self.list_tiki_bars
      self.choose_bar
    else
      puts "That wasn't a valid response...\n\n"
      menu
    end
  end 
    
  def list_tiki_bars
    puts "The following is an unranked list:"
    Bar.all.each.with_index(1) { |b, i| puts "#{i}. #{b.name}" }
  end
    
  def choose_bar
    puts "Please enter the number of the bar you'd like to read more about:"
    index = gets.strip.to_i - 1
    if index.between?(1, 14) 
      bar = Bar.all[index]
      Scraper.scrape_bar_info(bar)
    else
      puts "Invalid response..."
      choose_bar
    end
  end 
  
  def goodbye
    puts "Mahalo! Cheers!"
  end 
  
end 
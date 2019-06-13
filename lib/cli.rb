class CLI 

  def run 
    self.greeting
    Scraper.scrape_bars
    menu
  end 
  
  def add_attributes_to_bars(bar)
    Bar.all.each do |bar|
      attributes = Scraper.scrape_more_info(bar)
      bar.add_bar_attributes(attributes)
    end 
  end
  
  def greeting 
    puts "\nAloha! Welcome to the World's 15 Most Important Tiki Bars!\n\n"
    puts "``'-.,_,.-'``'-.,_,.='``'-.,_,.-'``'-.,_,.='``'-.,_,.-'``'"
  end
  
  def menu
    puts "\n\n"
    puts "To continue enter 'y' or 'exit' to leave"
    input = gets.strip.downcase
    case input 
    when 'exit'
      goodbye
      return
    when 'y'
      self.list_tiki_bars
      self.choose_bar
      self.continue?
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
    if index.between?(0, 14) 
      bar = Bar.all[index]
      Scraper.scrape_bar_info(bar)
      self.add_attributes_to_bars(bar)
      self.display_bar_info(bar)
    else
      puts "Invalid response..."
      choose_bar
    end
  end 
  
  def display_bar_info(bar)
    puts "\n\n"
    puts bar.name.upcase
    puts bar.address
    puts bar.hours
    puts "\n"
    puts "The local neighborhood is #{bar.neighborhood}."
    puts "Recommended order: #{bar.what_to_drink}"
    puts bar.protip
    puts "\n\n"
  end 
  
  def continue?
    puts "Please enter 'y' to choose another tiki bar or 'exit' to leave:"
    input = gets.strip.downcase
    case input
    when 'exit'
      goodbye
    when 'y'
      puts "\n\n"
      self. list_tiki_bars
      self.choose_bar
      continue?
    else
      puts "Invalid response..."
      continue?
    end 
  end 
  
  def goodbye
    puts "\n\n"
    puts "    Time flies when you're having rum! Mahalo! Cheers!   "
    puts "``'-.,_,.-'``'-.,_,.='``'-.,_,.-'``'-.,_,.='``'-.,_,.-'``'"
  end 
  
end 
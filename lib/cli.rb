class CLI 

  def run 
    self.greeting
    Scraper.scrape_bars
    self.menu
  end 
  
  def greeting 
    puts "\nAloha! Welcome to the World's 15 Most Important Tiki Bars!\n".cyan
    puts "``'-.,_,.-'``'-.,_,.='``'-.,_,.-'``'-.,_,.='``'-.,_,.-'``'".light_blue
  end
 
  def menu
    self.list_tiki_bars
    self.choose_bar
    self.continue?
  end 
    
  def list_tiki_bars
    puts "\n\n"
    puts "The following is an unranked list:"
    Bar.all.each.with_index(1) { |b, i| puts "#{i}. #{b.name}" }
  end
  
  def choose_bar
    puts "Please enter the number of the bar you'd like to read more about:".blue
    index = gets.strip.to_i - 1
    if index.between?(0, Bar.all.size - 1) 
      bar = Bar.all[index]
      Scraper.scrape_bar_info(bar)
      self.display_bar_info(bar)
      #self.launch(bar)
    else
      puts "Invalid response..."
      self.choose_bar
    end
  end 
  
  def display_bar_info(bar)
    puts "\n\n"
    puts bar.name.upcase.light_blue.bold
    puts bar.address
    puts bar.hours
    puts "\n"
    puts "#{bar.name} is known for:".light_blue
    bar.known_for.each_with_index { |li, i| puts "#{i+1}. #{li}" }
    puts "\n"
    puts "The local neighborhood is #{bar.neighborhood}." if bar.neighborhood != nil
    puts "\n"
    puts "Recommended order: #{bar.what_to_drink}" 
    puts "\n"
    puts "Pro Tip: #{bar.protip}" if !bar.protip.empty?
    puts "\n\n"
  end 
  
  # def launch(bar)
  #   puts "Would you like to view this bar's website?"
  #   input = gets.strip.downcase 
  #   if input == 'yes' || 'y'
  #     Launchy.open("#{bar.website}")
  #   elsif input == 'no' ||'n' 
  #     self.continue?
  #   else 
  #     puts "Invalid response..."
  #   end
  # end 
  
  def continue?
    puts "Please enter 'y' to choose another tiki bar or 'exit' to leave:"
    input = gets.strip.downcase
    case input
    when 'exit'
      self.goodbye
    when 'y'
      puts "\n\n"
      self.list_tiki_bars
      self.choose_bar
      self.continue?
    else
      puts "Invalid response..."
      self.continue?
    end 
  end 
  
  def goodbye
    puts "\n\n"
    puts "   Time flies when you're having rum! Mahalo! Cheers!   ".cyan
    puts "``'-.,_,.-'``'-.,_,.='``'-.,_,.-'``'-.,_,.='``'-.,_,.-'``'".light_blue
    puts "\n\n"
  end 
  
end 
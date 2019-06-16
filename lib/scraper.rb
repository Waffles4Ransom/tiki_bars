class Scraper

  BASE_URL = 'https://punchdrink.com/articles/15-most-important-best-tiki-bars-chicago-london-sf/'
  
  def self.scrape_bars
    html = Nokogiri::HTML(open(BASE_URL))
      
    tb_list = html.css("div.list_wrapper h3")
    tb_list.each do |bar|
        name = bar.css("a").text 
        url = bar.css("a")[0].attr("href")
        Bar.new(name, url)
    end
  end  
  
  def self.scrape_bar_info(bar)
    html = Nokogiri::HTML(open(bar.url))
    deets = html.css("div.left-col.col-xs-12.col-sm-12.col-md-8.col-lg-8")

    bar.address = deets.css("div.info-box a")[0].text.strip if bar.address == nil 
    bar.hours = deets.css("div.info-box div")[1].text.strip if bar.hours == nil
    bar.website = deets.css("div.info-box a")[1].attr('href')
    bar.what_to_drink = deets.css("div.module span")[0].text.strip
    bar.known_for = deets.css("div.module ul li").map(&:text)
    if deets.css("div.module h5").text.include?("Neighborhood")
      bar.neighborhood = deets.css("div.module h5 a").text.strip
    elsif deets.css("div.module h5").text.include?("ProTip")
      bar.protip = deets.css("div.module span")[1].text.strip
    end
  end 
  
  # def self.scrape_more_info(bar)
  #   more_info = {}
    
  #   html = Nokogiri::HTML(open(bar.url))
  #   more = html.css("div.bordered-box.clearfix")

  #   more.each do |i|
  #     if i.css("div.module h5")[2].text == "Neighborhood"
  #       more_info[:neighborhood] = i.css("a").text.strip
  #     elsif i.css("div.module h5").last.text == "ProTip"
  #       more_info[:protip] = i.css("span")[1].text
  #     end
  #   end 

  #   more_info[:what_to_drink] = more.css("span")[0].text.strip

  #   more_info
  # end 
    
end 
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
    deets = html.css("div.info-box")

    bar.address = deets.css("a")[0].text.strip
    bar.hours = deets.css("div")[2].text.strip
  end 
  
  def self.scrape_more_info(bar)
    more_info = {}
    
    html = Nokogiri::HTML(open(bar.url))
    more = html.css("div.bordered-box.clearfix")

    more.each do |i|
      if i.css("div.module h5")[2].text == "Neighborhood"
        more_info[:neighborhood] = i.css("a").text.strip
      elsif i.css("div.module h5").last.text == "ProTip"
        more_info[:protip] = i.css("span")[1].text
      end
    end 

    more_info[:what_to_drink] = more.css("span")[0].text.strip

    more_info
  end 
    
end 
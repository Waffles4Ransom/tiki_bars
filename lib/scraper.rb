class Scraper

  BASE_URL = 'https://punchdrink.com/articles/15-most-important-best-tiki-bars-chicago-london-sf/'
  
  def self.scrape_bars
    page = open(BASE_URL)
    parsed_html = Nokogiri::HTML(page)
      
    tb_list = parsed_html.css("div.list_wrapper h3")
    tb_list.each do |bar|
        name = bar.css("a").text 
        url = bar.css("a")[0].attr("href")
        Bar.new(name, url)
    end
  end  
  
  def self.scrape_bar_info(bar)
    url = bar.url
    html = Nokogiri::HTML(open(url))
    deets = html.css("div.info-box")

    bar.address = deets.css("a")[0].text.strip
    bar.hours = deets.css("div")[2].text.strip
  end 
    
end 
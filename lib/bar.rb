class Bar 
   attr_reader :name, :url
   attr_accessor :address, :hours
   
   @@all = []
  
  def initialize(name, url)
    @name, @url = name, url
    @address = nil 
    @hours = nil
    @@all << self
  end 
  
  def self.all
    @@all
  end 
end 
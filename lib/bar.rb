class Bar 
   attr_reader :name, :url
   attr_accessor :address, :hours, :website, :neighborhood, :protip, :what_to_drink, :known_for
   
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
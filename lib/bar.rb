class Bar 
   attr_reader :name, :url
   attr_accessor :address, :hours, :neighborhood, :protip, :what_to_drink
   
   @@all = []
  
  def initialize(name, url)
    @name, @url = name, url
    @address = nil 
    @hours = nil
    @@all << self
  end 
  
  def add_bar_attributes(attributes_hash)
    attributes_hash.each do |k,v|
      self.send("#{k}=", v)
    end 
  end
  
  def self.all
    @@all
  end 
end 
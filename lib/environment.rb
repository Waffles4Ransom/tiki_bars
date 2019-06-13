require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative "./tiki_bars/version"
require_relative './cli.rb'
require_relative './scraper.rb'
require_relative './bar.rb'




module TikiBars
  class Error < StandardError; end
  # Your code goes here...
end
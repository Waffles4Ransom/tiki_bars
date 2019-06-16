require 'pry'
require 'nokogiri'
require 'colorize'
require 'launchy'
require 'open-uri'

LAUNCHY_DEBUG=true

require_relative './tiki_bars/version.rb'
require_relative './cli.rb'
require_relative './scraper.rb'
require_relative './bar.rb'



module TikiBars
  class Error < StandardError; end
  
end
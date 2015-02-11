require 'nokogiri'
require 'open-uri'
require 'colorize'
require_relative 'page_location'



# puts raw_data.raw_page

post = PageParser.hacker_news(ARGV[0])

post.display_post
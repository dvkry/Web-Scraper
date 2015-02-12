require 'nokogiri'
require 'open-uri'
require 'colorize'
require_relative 'interface'
require_relative 'page_parser'


#Interface.command(ARGV[0], ARGV[1])
if ARGV.length <= 1
  Interface.display_help
  exit
end

case ARGV[0].downcase
when 'hn'
  post = PageParser.hacker_news(ARGV[1])
when 'rd'
  post = PageParser.reddit(ARGV[1])
else
  Interface.invalid_arguments
  exit
end

Interface.display_post(post)
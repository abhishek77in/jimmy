require 'google-search'
require 'mechanize'

class GoogleWeb
  attr_accessor :title, :url, :excerpt

  $GOOGLE_WEB = Array.new

  def initialize(site)
    @title = site.title
    @url = site.uri
    @excerpt = strip_tags site.content
  end

  def self.fetch(keyword)
    Google::Search::Web.new(:query => keyword).each do |site|
      $GOOGLE_WEB << GoogleWeb.new(site)
    end
  end

  def strip_tags(html)
    Nokogiri::HTML(html).xpath("//text()").text
  end
end

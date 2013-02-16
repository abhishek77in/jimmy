require 'google-search'
require 'mechanize'

class GoogleWeb
  attr_accessor :title, :url, :excerpt

  $RESULTS = Array.new

  def initialize(site)
    @title = site.title
    @url = site.uri
    @excerpt = strip_tags site.content
  end

  def self.fetch(keyword)
    Google::Search::Web.new(:query => keyword).each do |site|
      $RESULTS << GoogleWeb.new(site)
    end
    log_result
  end

  def self.log_result
    puts "Fetching complete!"
    puts "Found #{$RESULTS.length} results"
    puts "Listing results: "
    $RESULTS.each { |r| r.to_s }
  end

  def to_s
    puts "[#{title}](#{url})"
    puts "#{excerpt}"
  end

  def strip_tags(html)
    Nokogiri::HTML(html).xpath("//text()").text
  end
end

GoogleWeb.fetch("rails tutorials")

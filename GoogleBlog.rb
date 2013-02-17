require 'google-search'
require 'mechanize'

class GoogleBlog
  attr_accessor :title, :url, :excerpt

  $GOOGLE_BLOG = Array.new

  def initialize(site)
    @title = site.title
    @url = site.uri
    @excerpt = strip_tags site.content
  end

  def self.fetch(keyword)
    Google::Search::Blog.new(:query => keyword).each do |site|
      $GOOGLE_BLOG << GoogleBlog.new(site)
    end
  end

  def strip_tags(html)
    Nokogiri::HTML(html).xpath("//text()").text
  end
end

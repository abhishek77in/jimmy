require 'mechanize'
class StackOverflow
  attr_accessor :title, :url, :excerpt

  REQ_URL = "http://stackoverflow.com/search?tab=votes&q="
  BASE_URL = "http://stackoverflow.com"
  $QAs = Array.new

  QA = ".search-result"
  TITLE = ".result-link span"
  URL = ".result-link span a"
  EXCERPT = ".excerpt"

  def initialize(qa)
    @title = qa.search(TITLE).text
    @url = BASE_URL + qa.search(URL).first["href"]
    @excerpt = qa.search(EXCERPT).text
    sanatize
  end

  def sanatize
    @title = @title.gsub("\n"," ")
    @excerpt = @excerpt.gsub("\n"," ")
  end

  def self.fetch(keyword)
    agent = Mechanize.new
    page = agent.get(REQ_URL + keyword)
    page.search(QA).each do |qa|
      $QAs << StackOverflow.new(qa)
    end
  end

end

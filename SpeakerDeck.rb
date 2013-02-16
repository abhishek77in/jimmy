require 'mechanize'
class SpeakerDeck
  attr_accessor :title, :url, :excerpt, :image

  REQ_URL = "https://speakerdeck.com/search?q="
  BASE_URL = "https://speakerdeck.com/"
  $SLIDES = Array.new

  SLIDE = ".talk"
  TITLE = "h3"
  URL = "a"
  CREDIT = "p a"
  IMAGE = "img"

  def initialize(slide)
    @title = slide.search(TITLE).first.text
    @url = BASE_URL + slide.search(URL).first["href"]
    credit = slide.search(CREDIT).text
    @excerpt = "#{@title} - by #{credit}"
    @image = slide.search(IMAGE).first["src"]
    sanatize
  end

  def sanatize
    @title = @title.gsub("\n","")
    @excerpt = @excerpt.gsub("\n","")
  end

  def self.fetch(keyword)
    agent = Mechanize.new
    page = agent.get(REQ_URL + keyword)
    page.search(SLIDE).each do |slide|
      $SLIDES << SpeakerDeck.new(slide)
    end
    log_result
  end

  def self.log_result
    puts "Fetching complete!"
    puts "Found #{$SLIDES.length} slides"
    puts "Listing slides: "
    $SLIDES.each { |s| s.to_s }
  end

  def to_s
    puts "[#{title}](#{url})"
    puts "image url - #{image}"
    puts "#{excerpt}"
  end

end

SpeakerDeck.fetch("rails")

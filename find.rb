require 'erb'
require_relative 'SpeakerDeck'
require_relative 'StackOverflow'
require_relative 'GoogleWeb'
require_relative 'GoogleBlog'
require_relative 'Resource'
require_relative 'Twitter'

keyword = ARGV.join(" ")

puts "Checking SpeakerDeck"
SpeakerDeck.fetch(keyword)
puts "Checking StackOverflow"
StackOverflow.fetch(keyword)
puts "Googling the Web for Websites"
GoogleWeb.fetch("#{keyword} tutorials")
puts "Googling the Web for Blogs"
GoogleBlog.fetch("#{keyword} tutorials")
puts "Checking Twitter"
Twitter.fetch(keyword)

def heading(url,title)
  "<a href=\"#{url}\"><h3>#{sanatize title}</h3></a>"
end

def excerpt(excerpt)
  "<p>#{sanatize excerpt}</p>"
end

def image(url,src)
  "<a href=\"#{url}\"><img src=\"#{src}\" /></a>"
end

def sanatize(content)
  content.gsub("\n"," ")
end

template = ERB.new(File.read("index.html.erb"))

file = File.new("#{keyword}.html", "w")
file.puts template.result(binding)
file.close

`open "#{keyword}.html"`
puts "\nOpen #{keyword}.html file if it does not open automatically"

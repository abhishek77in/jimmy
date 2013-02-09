require 'google-search'

query = "rails tutorials"

puts "# #{query.capitalize}"
Google::Search::Web.new(:query => query).each do |site|
    puts "## #{site.index}. [#{site.title}](#{site.uri})"
    puts site.content
end

Google::Search::Blog.new(:query => query).each do |site|
    puts "## #{site.index}. [#{site.title}](#{site.uri})"
    puts site.content
end

def sanatize
    #remove so links
end

def strip_tags
    #remove html tags from content
end

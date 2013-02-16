module Resource
  def log_result(items)
    puts "Fetching complete!"
    puts "Found #{items.length} results"
    puts "Listing results: "
    items.each { |i| i.to_s }
  end

  def to_s
    puts "[#{title}](#{url})"
    puts "#{excerpt}"
  end

  def strip_tags(html)
    Nokogiri::HTML(html).xpath("//text()").text
  end

end

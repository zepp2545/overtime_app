100.times do |index|
    Post.create(date: Date.today, rationale: "#{index} rationale content")
end

puts '100 post have been created'
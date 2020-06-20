user = User.create(email: 'zepp25458565@gmail.com', password: 'km25458565', password_confirmation: 'km25458565', first_name: 'Akio', last_name: 'Maruyo')

puts 'user is created'

100.times do |index|
    Post.create(date: Date.today, rationale: "#{index} rationale content", user_id: user.id)
end

puts '100 post have been created'
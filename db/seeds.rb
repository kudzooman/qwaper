require 'faker'
5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save
end
users = User.all

50.times do
  Post.create(
    body: Faker::Lorem.paragraph
)
posts = Post.all

end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{User.count} users created"
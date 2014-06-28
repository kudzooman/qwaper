require 'faker'

50.times do
  Post.create(
    body: Faker::Lorem.paragraph
)
posts = Post.all

end

puts "Seed finished"
puts "#{Post.count} posts created"
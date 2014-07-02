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
  post = Post.create(
    user: users.sample,
    body: Faker::Lorem.paragraph
)
# set the created_at to a time within the past year
  post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
  post.update_rank

end

posts = Post.all

admin = User.new(
  name:          'Admin User',
  email:         'admin@example.com',
  password:      'helloworld',
  role:          'admin'
  )
  admin.skip_confirmation!
  admin.save

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{User.count} users created"
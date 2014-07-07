require 'faker'
25.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save
end
users = User.all

75.times do
  post = Post.create(
    user: users.sample,
    body: Faker::Lorem.paragraph
)
# set the created_at to a time within the past year
  post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
  post.update_rank

end

posts = Post.all

# Create Comments
125.times do
  Comment.create(
    user: users.sample,
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end

admin = User.new(
  name:          'Admin User',
  email:         'admin@example.com',
  password:      'helloworld',
  role:          'admin'
  )
  admin.skip_confirmation!
  admin.save

  #Create a member
  memberOne = User.new(
    name:          'Member One User',
    email:         'memberone@example.com',
    password:      'helloworld',
    )
    memberOne.skip_confirmation!
    memberOne.save

    #Create a member
  memberTwo = User.new(
    name:          'Member Two User',
    email:         'membertwo@example.com',
    password:      'helloworld',
    )
    memberTwo.skip_confirmation!
    memberTwo.save

    #Create a member
  memberThree = User.new(
    name:          'Member Three User',
    email:         'memberthree@example.com',
    password:      'helloworld',
    )
    memberThree.skip_confirmation!
    memberThree.save

    #Create a member
  memberFour = User.new(
    name:          'Member Four User',
    email:         'memberfour@example.com',
    password:      'helloworld',
    )
    memberFour.skip_confirmation!
    memberFour.save

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{User.count} users created"
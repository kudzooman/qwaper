class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :posts, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

def role?(base_role)
  role == base_role.to_s
end

def favorited(post)
  # what is this doing?
  self.favorites.where(post_id: post.id).first
end

# def favorites(user)
  # self.favorites.where(user_id: user.id).first
# end

end

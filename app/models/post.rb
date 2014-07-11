class Post < ActiveRecord::Base
  #has_many :tags, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :user
  belongs_to :catagory

  def up_votes
    self.votes.where(value: 1).count
  end

  def down_votes
    self.votes.where(value: -1).count
  end

  def points
    self.votes.sum(:value).to_i
  end

  def update_rank
    #age = (self.created_at - Time.new(1970,1,1)) / 86400
    new_rank = points #+ age

    self.update_attribute(:rank, new_rank)
  end

  validates :body, length: { maximum: 200 }, presence: true
  validates :user, presence: true

  default_scope { order('rank DESC') }

  private 

  def create_vote
    user.votes.create(value: 1, post: self)
  end

# When someone votes in the top 25 index view the qwap only earns 1/4 pt
#def create_top_vote
  #user.votes.create(value: 0.25, post: self)
#end

# When someone votes in the random qwap mode, the qwap earns 2pts
#def create_random_vote
  #user.votes.create(value: 2, post: self)
#end

# When someone votes in the member qwap view, the qwap earns 1/2 pt
#def create_member_vote
  #user.votes.create(value: 0.5, post: self)
#end

# Users get points for voting

# When someone votes in the top 25 index view the user earns 1/4 pt
#def create_top_vote
  #user.votes.create(value: 0.25, user: self)
#end

# When someone votes in the random qwap mode, the user earns 2pts
#def create_random_vote
  #user.votes.create(value: 2, user: self)
#end

# When someone votes in the member qwap view, the user earns 1/2 pt
#def create_member_vote
  #user.votes.create(value: 0.5, user: self)
#end








end

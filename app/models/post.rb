class Post < ActiveRecord::Base
  has_many :tags, dependent: :destroy
  has_many :votes, dependent: :destroy
  belongs_to :user

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
    age = (self.created_at - Time.new(1970,1,1)) / 86400
    new_rank = points + age

    self.update_attribute(:rank, new_rank)
  end

  validates :body, length: { maximum: 200 }, presence: true
  validates :user, presence: true

  default_scope { order('rank DESC') }

  private 

  def create_vote
    user.votes.create(value: 1, post: self)
  end
end

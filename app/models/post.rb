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

  validates :body, length: { maximum: 200 }, presence: true
  validates :user, presence: true

  default_scope { order('created_at DESC') }
end

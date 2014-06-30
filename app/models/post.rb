class Post < ActiveRecord::Base
  has_many :tags
  belongs_to :user

  default_scope { order('created_at DESC') }

  validates :body, length: { maximum: 200 }, presence: true
  validates :user, presence: true
end

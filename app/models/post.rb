class Post < ActiveRecord::Base
  has_many :tags
  belongs_to :user

  default_scope { order('created_at DESC') }
end

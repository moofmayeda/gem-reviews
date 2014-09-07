class Review < ActiveRecord::Base
  validates :title, presence: true
  validates :text, presence: true

  belongs_to :user
  belongs_to :jewel

  has_many :upvotes
  has_many :downvotes

  default_scope { order('created_at DESC') }
end

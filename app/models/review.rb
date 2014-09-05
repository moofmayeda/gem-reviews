class Review < ActiveRecord::Base
  validates :title, presence: true
  validates :text, presence: true

  belongs_to :user
  belongs_to :jewel
end

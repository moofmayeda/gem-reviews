class Jewel < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true

  has_many :reviews
end

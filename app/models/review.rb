class Review < ActiveRecord::Base
  validates :rating, presence: true

  belongs_to :picture
  belongs_to :user
end

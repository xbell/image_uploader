class Review < ActiveRecord::Base
  # validates :user, presence: true

  belongs_to :picture
  belongs_to :user
end
